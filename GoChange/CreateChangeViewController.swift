//
//  CreateChangeViewController.swift
//  GoChange
//
//  Created by Nick Short on 06/02/2016.
//  Copyright © 2016 Nick Short. All rights reserved.
//

import UIKit
import CoreData
import Firebase


class CreateChangeViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate,UITableViewDelegate {
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var detailsField: UITextView!
    @IBOutlet weak var namePlusButton: UIButton!
    @IBOutlet weak var detailsPlusButton: UIButton!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var addASolutionButton: UIButton!
    @IBOutlet weak var solutionTable: UITableView!
    
    
    var currentNameData:String = ""
    var currentDetailData:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.navigationBar.barTintColor = GoChangeClient.Constants.customOrangeColor
        
        addASolutionButton.setTitleColor(GoChangeClient.Constants.customOrangeColor, forState: UIControlState.Normal)
        
        /*
        //set drop shadow for namefield
        nameField.layer.masksToBounds = false
        nameField.borderStyle = UITextBorderStyle.None
        nameField.layer.shadowRadius = 0.5
        nameField.layer.shadowColor = GoChangeClient.Constants.customOrangeColor.CGColor
        nameField.layer.shadowOffset = CGSizeMake(-3.0,-3.0)
        nameField.layer.shadowOpacity = 0.5
        */
        
        //Set up drop shadow for detailsField
        detailsField.layer.masksToBounds = false
        detailsField.layer.borderColor = UIColor.clearColor().CGColor
        detailsField.layer.shadowRadius = 0.5
        detailsField.layer.shadowColor = GoChangeClient.Constants.customOrangeColor.CGColor
        detailsField.layer.shadowOffset = CGSizeMake(0,-1.0)
        detailsField.layer.shadowOpacity = 0.5
        
        //Set up drop shadow for detailsField
        solutionTable.layer.masksToBounds = false
        solutionTable.layer.borderColor = UIColor.clearColor().CGColor
        solutionTable.layer.shadowRadius = 0.5
        solutionTable.layer.shadowColor = GoChangeClient.Constants.customOrangeColor.CGColor
        solutionTable.layer.shadowOffset = CGSizeMake(0,-1.0)
        solutionTable.layer.shadowOpacity = 0.5
        
        
        //set delegates
        nameField.delegate = self
        detailsField.delegate = self
        solutionTable.delegate = self
        
        //hide and disable buttons
        namePlusButton.hidden = true
        detailsPlusButton.hidden = true
        
        postButton.alpha = 0.5
        postButton.enabled = false
        
        //clear TempChange ready for new change
        TempChange.sharedInstance().changeName = ""
        TempChange.sharedInstance().changeDetail = ""
       
        TempChange.sharedInstance().solutionDetailArray = []
        TempChange.sharedInstance().solutionNameArray = []
        TempChange.sharedInstance().solutionVoteArray = []
        TempChange.sharedInstance().solutionIDArray = []
        TempChange.sharedInstance().currentPetitionValue = ""
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        self.solutionTable.reloadData()
        
    }
    
    
    lazy var sharedContext:NSManagedObjectContext = {
        return CoreDataStackManager.sharedInstance().managedObjectContext
    }()
    
    
    
    //-------------------Button methods---------------
    
    @IBAction func homeButtonClick(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func nameActionButton(sender: UIButton) {
        
        nameField.resignFirstResponder()
        namePlusButton.hidden = true
        
        if(nameField.text != "" && (detailsField.text != "" || detailsField.text != GoChangeClient.Constants.detailText)){
            postButton.alpha = 1
            postButton.enabled = true

        }
        
        currentNameData = nameField.text!
        TempChange.sharedInstance().changeName = nameField.text!
        
    }
    
    
    @IBAction func detailsActionButton(sender: UIButton) {
        
        //TODO: check for /n character, delete if necessary
        
        detailsField.resignFirstResponder()
        detailsPlusButton.hidden = true
        
        if(nameField.text != "" && (detailsField.text != "" || detailsField.text != GoChangeClient.Constants.detailText)){
            postButton.alpha = 1
            postButton.enabled = true
            
        }
        currentDetailData = detailsField.text!
        TempChange.sharedInstance().changeDetail = detailsField.text!
    }
    
    
    
    
    @IBAction func addSolution(sender: UIButton) {
        
        //if adding a new solution set back button title to cancel
        let barButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = barButtonItem
        
        
        var controller:AddIdeaViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("AddIdeaViewController") as! AddIdeaViewController
        
        controller.viewControllerStatus = "addingSolutionToNewChange"
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
    
    
    
    //-----------------textfield methods-------------------
    func textFieldDidBeginEditing(textField: UITextField) {
        
        //TODO: If field begin editing due to user clicking instead of plus button save data?
        //TODO: Disable editing of fields until other field plus button clicked?
        
        namePlusButton.hidden = false
        detailsPlusButton.hidden = true
    }
    
    
    
    //---------------------textView methods------------
    func textViewDidBeginEditing(textView: UITextView) {
        
        if(textView.text == GoChangeClient.Constants.detailText){
            textView.text = ""
        }
        textView.textColor = UIColor.blackColor()
        
        detailsPlusButton.hidden = false
        namePlusButton.hidden = true
        
    }
    
    
    
    
    
    //--------------------Table view methods--------------
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TempChange.sharedInstance().solutionNameArray.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID = "solutionCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! CustomTableViewCell
        
        var solutionName:String = ""
        solutionName = TempChange.sharedInstance().solutionNameArray[indexPath.row]
        
        //cell.textLabel!.text = solutionName
        cell.problemName.text = solutionName
        
        let username = NSUserDefaults.standardUserDefaults().valueForKey("username") as? String
        if let username = username{
            cell.ownerName.text = "Submitted by: \(username)"
        }
        
        cell.voteCount.text = "0"
        
        cell.layer.masksToBounds = false
        cell.layer.shadowRadius = 1.0
        cell.layer.shadowColor = GoChangeClient.Constants.customOrangeColor.CGColor
        cell.layer.shadowOffset = CGSizeMake(3.0,3.0)
        cell.layer.shadowOpacity = 0.5
        
        return cell
        
    }
    
    func tableView(tableView:UITableView,didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        //change back button on addIdeaVC to Back instead of "Cancel Idea"
        let barButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = barButtonItem
        
        
        var controller:ViewIdeaViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ViewIdeaViewController") as! ViewIdeaViewController
        
        controller.viewControllerStatus = "newChange"
        controller.petitionURL = TempChange.sharedInstance().petitionURLArray[indexPath.row]
        controller.loadedNameData = TempChange.sharedInstance().solutionNameArray[indexPath.row]
        controller.loadedDetailData = TempChange.sharedInstance().solutionDetailArray[indexPath.row]
        
        
        //TODO: Fix empty change do we need to view solutions after adding them
        //controller.change = self.change
        
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }

    
    
        
    //---------------------Posting/Saving data----------------
    @IBAction func PostInfo(sender: UIButton) {
        
        //TODO: Check size of string? Stop people posting short questions?
        //TODO: Check for unusable data? USe GoChangeConvenieince for string testing
        if(currentDetailData == "" || currentNameData == ""){
            
            //TODO: Alert message to user to get them to fill in form
            print("please input name and detail data")
            
        }else{
           
            _ = SaveNewChange(completionHandler:{
                (result) in
                
                //result is the newly created change!
                
            })
            
            
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }

        
    }
    
}


