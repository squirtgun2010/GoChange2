//
//  ViewFollowedChangeViewController.swift
//  GoChange
//
//  Created by Nick Short on 15/04/2016.
//  Copyright © 2016 Nick Short. All rights reserved.
//

import UIKit
import CoreData
import Firebase


class ViewFollowedChangeViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate,UITableViewDelegate {

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var detailsField: UITextView!
    @IBOutlet weak var solutionTable: UITableView!
    
    @IBOutlet weak var addASolutionButton: UIButton!
    @IBOutlet weak var followChangeButton: UIButton!
    
    
    var changeClicked:Change!
    var changeID:String!
    var solutionID:String!
    
    var localSolutionCount:Int!
    var changeIDArray:[String] = []
    
    var sendingController:String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("viewDidLoad")
        
        //set delegates
        nameField.delegate = self
        detailsField.delegate = self
        solutionTable.delegate = self
        
        
        nameField.enabled = false
        detailsField.selectable = false
        
        self.title = "Following"
        
        
        //if coming from ViewResultChangeViewController need back button to go home
        if(sendingController == "ViewResult"){
            
            let barButtonItem = UIBarButtonItem(title: "Home", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ViewFollowedChangeViewController.goBackHome))
            self.navigationItem.leftBarButtonItem = barButtonItem
            
        }
        
        nameField.text = changeClicked.changeName
        detailsField.text = changeClicked.changeDescription
        localSolutionCount = changeClicked.solutionCount as Int
        changeID = changeClicked.changeID
        
        //add changeID to changeID array ready for passing to RetrieveSolutions
        changeIDArray.append(changeID)
        
        
        //check to see whether solution count in database matches that in core data
        //Even if coming from results can check to see whether any new solutions added since search was conducted
        _ = RetrieveSolutionCountFirebase(changeArray: changeIDArray, completionHandler: {
            (result) in
            
            //process returned snapshot
            let firebaseSolutionCount = Int(result[0])
                       
            // if new solutions exist
            if (firebaseSolutionCount != self.localSolutionCount){
                
                //retrieve from firebase
                _ = RetrieveSolutionsFromFirebase(changeID: self.changeID,change:self.changeClicked,caller:"following", completionHandler: {
                    (result) in
                    
                    // empty TempArrays ready to be populate with new data
                    TempChange.sharedInstance().solutionNameArray = []
                    TempChange.sharedInstance().solutionDetailArray = []
                    TempChange.sharedInstance().solutionVoteArray = []
                    TempChange.sharedInstance().solutionIDArray = []
                    TempChange.sharedInstance().solutionOwnerArray = []
                    
                    
                    
                    //loop through retrieved firebase solutions and save into TempArrays
                    for solution in result.children.allObjects as! [FDataSnapshot]{
                        
                        TempChange.sharedInstance().solutionIDArray.append(solution.key)
                        TempChange.sharedInstance().solutionNameArray.append(solution.value["SolutionName"] as! String)
                        TempChange.sharedInstance().solutionDetailArray.append(solution.value["SolutionDescription"] as! String)
                        TempChange.sharedInstance().solutionVoteArray.append(solution.value["SolutionVoteCount"] as! Int)
                        TempChange.sharedInstance().solutionOwnerArray.append(solution.value["SolutionOwner"] as! String)
                    }
                    
                    let localSolutionIDArray:NSMutableArray = []
                    
                    //retrieve existing solutions save into an array
                     _ = RetrieveSolutions(change: self.changeClicked, completionHandler:{
                        (result) in
                        
                        
                        
                        for solution in result as! [Solution]{
                            localSolutionIDArray.addObject(solution.solutionID)
                        }
                        
                        //Test whether any of the solutions from firebase already exist in retrieved coredata array
                        for i in 0 ..< TempChange.sharedInstance().solutionIDArray.count{
                        
                            for j in 0 ..< localSolutionIDArray.count{
                                    
                                    
                                if(TempChange.sharedInstance().solutionIDArray[i] == localSolutionIDArray[j] as? String){
                                
                                    // IF there is a match between a firebase solution and coreData remove it from arrays
                                    /*
                                    TempChange.sharedInstance().solutionIDArray.removeObjectAtIndex(i)
                                    TempChange.sharedInstance().solutionNameArray.removeObjectAtIndex(i)
                                    TempChange.sharedInstance().solutionDetailArray.removeObjectAtIndex(i)
                                    TempChange.sharedInstance().solutionVoteArray.removeObjectAtIndex(i)
                                    TempChange.sharedInstance().solutionOwnerArray.removeObjectAtIndex(i)
                                    */
                                }
                            }
                         }
                     })
                    
                    //save any newly downloaded solutions to firebase
                    _ = UpdateCoreDataSolutions(change: self.changeClicked!)                    
                    self.solutionTable.reloadData()
                    
                })
            }else{
                //No new solutions to download so gather existing ones from core data
                
                _ = RetrieveSolutions(change:self.changeClicked!){
                    (result) in
                    
                    // empty TempArrays ready to be populate with new data
                    TempChange.sharedInstance().solutionNameArray = []
                    TempChange.sharedInstance().solutionDetailArray = []
                    TempChange.sharedInstance().solutionVoteArray = []
                    TempChange.sharedInstance().solutionIDArray = []
                    TempChange.sharedInstance().solutionOwnerArray = []
                    
                    
                    //assign results from coreData return to temp array then use TempArray for table
                    for solution in result as! [Solution]{
                        
                        TempChange.sharedInstance().solutionNameArray.append(solution.solutionName)
                        TempChange.sharedInstance().solutionDetailArray.append(solution.solutionDescription)
                        TempChange.sharedInstance().solutionVoteArray.append(solution.voteCount as Int)
                        TempChange.sharedInstance().solutionIDArray.append(solution.solutionID)
                        TempChange.sharedInstance().solutionOwnerArray.append(solution.solutionOwner)
                    }
                    self.solutionTable.reloadData()
                    
                }
                
            }
            
            
        })
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.solutionTable.reloadData()
        
    }

    @IBAction func addNameClick(sender: UIButton) {
        
        //enable button if owner
    }


    @IBAction func addDetailClick(sender: UIButton) {
        
        //enable button if owner
    }


    @IBAction func addSolutionClick(sender: UIButton) {
        
        //if adding a new solution set back button title to cancel
        let barButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = barButtonItem
        
        
        var controller:AddIdeaViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("AddIdeaViewController") as! AddIdeaViewController
        
        controller.viewControllerStatus = "addingSolutionToExistingChange"
        //controller.changeID = changeID
        controller.change = changeClicked
        
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }

   
    
    //--------------------Table view methods--------------
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TempChange.sharedInstance().solutionNameArray.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID = "solutionCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath)
        
        var solutionName:String = ""
        solutionName = TempChange.sharedInstance().solutionNameArray[indexPath.row]
        
         //TODO: Gather vote numbers from firebase populated into Temp.sharedInstance().solutionVoteArray
        let voteCount:String = String(TempChange.sharedInstance().solutionVoteArray[indexPath.row])
        
        cell.detailTextLabel!.text = voteCount
        cell.textLabel!.text = solutionName
        
        return cell
        
    }
    
    func tableView(tableView:UITableView,didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        
        var controller:ViewIdeaViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ViewIdeaViewController") as! ViewIdeaViewController
        
        
        controller.loadedNameData = TempChange.sharedInstance().solutionNameArray[indexPath.row]
        controller.loadedDetailData = TempChange.sharedInstance().solutionDetailArray[indexPath.row]
        
        
        //controller.solutionCount = TempChange.sharedInstance().solutionVoteArray[indexPath.row] as? Int
        controller.solutionID = TempChange.sharedInstance().solutionIDArray[indexPath.row]
        
        //controller.viewControllerStatus = "viewing"
        controller.changeID = changeID
        controller.index = indexPath.row
        
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    func goBackHome(){
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func unfollowChange(sender: UIButton) {
        
        print("Change unfollowed")
        
    }
    
}