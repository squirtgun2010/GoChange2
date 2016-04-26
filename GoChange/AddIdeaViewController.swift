//
//  AddIdeaViewController.swift
//  GoChange
//
//  Created by Nick Short on 06/02/2016.
//  Copyright © 2016 Nick Short. All rights reserved.
//

import UIKit

class AddIdeaViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate,UITableViewDelegate {
    
    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var addNameButton: UIButton!
    @IBOutlet weak var addDetailButton: UIButton!
    
    @IBOutlet weak var tweakTable: UITableView!
    
    @IBOutlet weak var addSolution: UIButton!
    
    @IBOutlet weak var petitionButton: UIButton!
    
    var currentNameData:String!
    var currentDetailData:String!
    
    
    var viewControllerStatus:String!
    var loadedNameData:String!
    var loadedDetailData:String!
    
    var change:Change!
    var changeID:String!
    
    var solutionID:String!
    var solutionCount:Int!
    var index:Int!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.title = "Add Solution"
        addNameButton.hidden = true
        addDetailButton.hidden = true
        
        addSolution.enabled = false
        addSolution.alpha = 0.5
        
        nameTextField.delegate = self
        detailTextView.delegate = self
        
        let barButtonItem = UIBarButtonItem(title: "Cancel Tweak", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        
        self.navigationItem.backBarButtonItem = barButtonItem
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
        
        
        if(viewControllerStatus == "viewing"){
            
            //Disbale editing of name and detail fields
            nameTextField.enabled = false
            detailTextView.selectable = false
            
            //Set controller title
            self.title = "Solution"
            
            //petitionButton.setTitle(`, forState: <#T##UIControlState#>)
            
            //load data into fields
            nameTextField.text = loadedNameData
            detailTextView.textColor = UIColor.blackColor()
            
            var localText:String = ""
            
            
            
            if(GoChangeClient.Constants.dynamicPetitionURL != ""){
                
                localText = loadedDetailData
                localText += GoChangeClient.Constants.dynamicPetitionURL
                detailTextView.text = localText
                
            }else{
                detailTextView.text = loadedDetailData
            }
            
            addSolution.setTitle("Vote For Solution", forState: .Normal)
            addSolution.enabled = true
            addSolution.alpha = 1
        
        }
        
        self.tweakTable.reloadData()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneAddingIdea(sender: UIButton) {
                
        if(viewControllerStatus == "viewing"){
           
            //Vote for solution
            _ = VoteForSolution(change: change,changeID:changeID,solutionID:solutionID){
                (result) in
                
            }
            
            var currentVoteCount = TempChange.sharedInstance().solutionVoteArray[self.index] as! Int
            currentVoteCount += 1
            TempChange.sharedInstance().solutionVoteArray[self.index] = currentVoteCount
            
            //TODO: decide whether to change button to Have Voted instead of alpha change
            self.addSolution.enabled = false
            self.addSolution.alpha = 0.5
            
        }else{
            
            if(nameTextField.text != "" && detailTextView.text != ""){
            
                // save data locally
                TempChange.sharedInstance().addingSolutions = "true"
                TempChange.sharedInstance().solutionNameArray.addObject(nameTextField.text!)
                TempChange.sharedInstance().solutionDetailArray.addObject(detailTextView.text!)
                TempChange.sharedInstance().solutionVoteArray.addObject(0)
                TempChange.sharedInstance().solutionNewOldArray.addObject("new")
            
                // dismiss view controller from navigation stack
                self.navigationController?.popViewControllerAnimated(true)
            }
        }
        
    }
    
    
    
    
    @IBAction func addNameClick(sender: AnyObject) {
        
        nameTextField.resignFirstResponder()
        addNameButton.hidden = true
        
        
        currentNameData = nameTextField.text
        
        if(nameTextField.text != "" && detailTextView.text != ""){
            addSolution.enabled = true
            addSolution.alpha = 1
        }
        
    }
    
    @IBAction func addDetailClick(sender: UIButton) {
        
        detailTextView.resignFirstResponder()
        addDetailButton.hidden = true
        
        currentDetailData = detailTextView.text
        
        //TODO: add check for "placeholder" text
        
        if(nameTextField.text != "" && detailTextView.text != ""){
            addSolution.enabled = true
            addSolution.alpha = 1
        }
    }
    
    
    
    @IBAction func addTweak(sender: UIButton) {
        
        var controller:AddTweakViewController
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("AddTweakViewController") as! AddTweakViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
    
    
    
    
    //-------------textfield methods ---------------
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        addNameButton.hidden = false
    }
    
    
    
    
    
    
    //---------------------textView methods------------
    func textViewDidBeginEditing(textView: UITextView) {
        
        if(textView.text == "Please enter details of the solution you have..."){
            textView.text = ""
        }
        textView.textColor = UIColor.blackColor()
        addDetailButton.hidden = false
        addNameButton.hidden = true
        
    }
    
    
    
    
    
    //--------------------Table view methods--------------
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return TempChange.sharedInstance().tweakNameArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID = "tweakCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath)
        
        cell.textLabel!.text = TempChange.sharedInstance().tweakNameArray[indexPath.row] as? String
        
        return cell
        
    }
    
    func tableView(tableView:UITableView,didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        //For tweak view controller
        
        
        
        
    }
    
    
    //---------------petition methods--------------------
    
    @IBAction func addPetition(sender: UIButton) {
        
        //open web browser to go to change.org
        
        var controller:WebViewController
        controller = storyboard?.instantiateViewControllerWithIdentifier("WebViewController") as! WebViewController
        
        controller.urlString = GoChangeClient.Constants.dynamicPetitionURL
        
        self.navigationController?.pushViewController(controller, animated: true)
        
        //self.presentViewController(controller, animated: true, completion: nil)
        
        
        //_ = ChangeOrgCode()
        
        
        //TODO: put all petition code into outside file
        //TODO: Add button to add petition
        /*
        let parameterDictionary = [
            "api_key":GoChangeClient.Constants.apiKey,
            "petition_url":GoChangeClient.Constants.petitionURL
        ]
        
       let queryString =  GoChangeClient.sharedInstance().escapedParameters(parameterDictionary)
       let finalString = GoChangeClient.Constants.requestURL + queryString
       
       let url = NSURL(string: finalString)!
       let request = NSURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request){
            data, response, downloadError in
            
            if downloadError != nil{
                
                //TODO: Deal with error
                print("error with request \(downloadError)")
                
            }else{
                
                GoChangeClient.sharedInstance().parseJSON(data!){
                    result,error in
                    
                    if error != nil{
                        //TODO: deal with error
                        print("error parsing JSON \(error)")
                    }else{
                        
                        self.petitionId = result["petition_id"] as! Int
                        
                    }
                }
            }
        }
        task.resume()
    */
    }
    
    
    
    
        
}


