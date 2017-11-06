//
//  RequestsViewController.swift
//  Agent Payzan
//
//  Created by Nani Mac on 18/10/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class RequestsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var requesttableView: UITableView!
    
    var namesarra1 : Array<String> = Array()
    var businessArr : Array<String> = Array()
    var addressArr : Array<String> = Array()
    var mobileArr : Array<String> = Array()
    var emailArr :  Array<String> = Array()
    var assignToUserIdArr: Array<String> = Array()
    var agentIdArr: Array<Int> = Array()
    
    var statusTypeIdArr :  Array<Int> = Array()
    
    var agentReqArr = [String]()
      let textView = UITextView()
    
    var updateAgentArr :  Array<Int> = Array()
    
    var statusTypeIdd:String!

    override func viewDidLoad() {
        super.viewDidLoad()

        requesttableView.register(UINib.init(nibName: "RequestsTableViewCell", bundle: nil),
                                 forCellReuseIdentifier: "RequestsTableViewCell")
        
        self.requesttableView.delegate = self
        self.requesttableView.dataSource = self
        
        self.getAgentRequesgtInfoAPICall()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
    }
    

    
    func getAgentRequesgtInfoAPICall(){
        
        
        let strUrl = AGENTREQUESTINFO_API + "" + statusTypeIdd!
    
    
    APIModel().getRequest(self, withUrl:strUrl , successBlock: { (json) in
        
        
        if (json.count > 0){
        
            
        let getAgentRequestArray = ParsingModelClass.sharedInstance.agentRequesgtInfoAPIModelParsing(object: json as AnyObject?)
            
            print(getAgentRequestArray)
            
            if(getAgentRequestArray.count > 0){
                
                for agentRequestInfo in getAgentRequestArray{
                    
                    print("firstName:\(agentRequestInfo.firstName)")
                    
                    self.agentReqArr.append(agentRequestInfo.firstName)
                    
                    self.mobileArr.append(agentRequestInfo.mobileNumber)
                    self.addressArr.append(agentRequestInfo.addressLine1)
                    self.emailArr.append(agentRequestInfo.email)
                    self.businessArr.append(agentRequestInfo.statusType)
                    
                    print("statusTypeId:\(agentRequestInfo.statusTypeId)")
                    
                    self.statusTypeIdArr.append(agentRequestInfo.statusTypeId!)
                    
                    self.assignToUserIdArr.append(agentRequestInfo.assignToUserId)
                    self.agentIdArr.append(agentRequestInfo.id!)
                    
                }
                 self.requesttableView.reloadData()
            }
            
        }
        
        
        
        
        else{}
        
        
        
    }) { (failureMessage) in
        
        
        Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Alert", messege: failureMessage, clickAction: {
            
            print(failureMessage)
            
        })
        
        }
    
    
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return agentReqArr.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 165
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestsTableViewCell", for: indexPath) as! RequestsTableViewCell
        
        
        cell.selectionStyle = .none
        cell.agentName.text = agentReqArr[indexPath.row]
        cell.businessCategory.text = businessArr[indexPath.row]
        cell.addressLabel.text = addressArr[indexPath.row]
        cell.mobileLabel.text = mobileArr[indexPath.row]
        cell.emailLabel.text = emailArr[indexPath.row]
      
        cell.holdBtn.tag = indexPath.row
        
        cell.pickUpBtn.addTarget(self, action: #selector(pickUpClicked), for: .touchUpInside)
        cell.holdBtn.addTarget(self, action: #selector(holdClicked), for: .touchUpInside)
        
       
        
        if (statusTypeIdArr[indexPath.row] == 47 || statusTypeIdArr[indexPath.row] == 48) {
            
            cell.holdBtn.isHidden = true
            
        }else{
           cell.holdBtn.isHidden = false
        }
        
        
        print("loading")
        return cell
  
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
               
        
    }
    
    func pickUpClicked(_ sender: UIButton){
    
        
        let alertController = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        
        let margin:CGFloat = 8.0
        let rect = CGRect(x:margin,y:margin, width:255, height:165)
        let customView = UITextView(frame: rect)
        
        //        customView.backgroundColor = UIColor.clear
        customView.font = UIFont(name: "Helvetica", size: 15)
        
        customView.placeholderText = "Please enter your text"
        
        //  customView.backgroundColor = UIColor.greenColor()
        alertController.view.addSubview(customView)
        
        let somethingAction = UIAlertAction(title: "Submit", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in print("Submit")
            
            print(customView.text)
            
            
            let indexPath : IndexPath = IndexPath(row: sender.tag, section: 0)
            
            if let _ : RequestsTableViewCell = self.requesttableView.cellForRow(at: indexPath) as? RequestsTableViewCell {
                
                
                print("index:\(indexPath.row)")
                
                let statusTypeId = self.statusTypeIdArr[indexPath.row]
                
                let assignToUserId = self.assignToUserIdArr[indexPath.row]
                
                let agentRequestId = self.agentIdArr[indexPath.row]
                
                let comentsFiled:String = customView.text
                
                let paramsDict = [ "AgentRequestId": agentRequestId,
                                   "StatusTypeId": statusTypeId,
                                   "AssignToUserId": assignToUserId,
                                   "Comments": comentsFiled,
                                   "Id": 0,
                                   "IsActive": true,
                                   "CreatedBy": "f1df3305-f345-490b-aee0-7cffdaeb7e0e",
                                   "ModifiedBy": "f1df3305-f345-490b-aee0-7cffdaeb7e0e",
                                   "Created": "2017-11-02T10:18:16.024Z",
                                   "Modified": "2017-11-02T10:18:16.024Z"] as [String:Any]
                
                print("paramsDict:\(paramsDict)")
                
                APIModel().postRequest(self, withUrl: UPDATEAGENTREQUESTINFO_API, parameters: paramsDict, successBlock: { (json) in
                    
                    print("json:\(json)")
                    
                    
                    if (json.count > 0){
                        
                        
                        let updateAgetAgentRequestArray = ParsingModelClass.sharedInstance.updateAgentRequesgtInfoAPIModelParsing(object: json as AnyObject?)
                        
                        print(updateAgetAgentRequestArray)
                        
                        
                        if(updateAgetAgentRequestArray.count > 0){
                            
                            for updateAgentRequestInfo in updateAgetAgentRequestArray{
                                
                                print("firstName:\(String(describing: updateAgentRequestInfo.statusTypeId))")
                                
                                self.updateAgentArr.append(updateAgentRequestInfo.statusTypeId!)
                                
                                let commetns = updateAgentRequestInfo.comments
                                
                                print("commetns:\(commetns)")
                                
                            }
                        }
                        
                    }
                    
                    
                }) { (failureMessage) in
                    
                }
                
            }
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {(alert: UIAlertAction!) in print("cancel")})
        
        alertController.addAction(somethingAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    
    }
    
    
    func holdClicked(_ sender: UIButton){
        
        
        let alertController = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        
        let margin:CGFloat = 8.0
        let rect = CGRect(x:margin,y:margin, width:255, height:165)
        let customView = UITextView(frame: rect)
        
        //        customView.backgroundColor = UIColor.clear
        customView.font = UIFont(name: "Helvetica", size: 15)
        
        customView.placeholderText = "Please enter your text"
        
        //  customView.backgroundColor = UIColor.greenColor()
        alertController.view.addSubview(customView)
        
        let somethingAction = UIAlertAction(title: "Submit", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in print("Submit")
            
            print(customView.text)
            
            
            let indexPath : IndexPath = IndexPath(row: sender.tag, section: 0)
            
            if let _ : RequestsTableViewCell = self.requesttableView.cellForRow(at: indexPath) as? RequestsTableViewCell {
                
                
                print("index:\(indexPath.row)")
                
                let statusTypeId = self.statusTypeIdArr[indexPath.row]
                
                let assignToUserId = self.assignToUserIdArr[indexPath.row]
                
                let agentRequestId = self.agentIdArr[indexPath.row]
                
                let comentsFiled:String = customView.text
                
                let paramsDict = [ "AgentRequestId": agentRequestId,
                                   "StatusTypeId": statusTypeId,
                                   "AssignToUserId": assignToUserId,
                                   "Comments": comentsFiled,
                                   "Id": 0,
                                   "IsActive": true,
                                   "CreatedBy": "f1df3305-f345-490b-aee0-7cffdaeb7e0e",
                                   "ModifiedBy": "f1df3305-f345-490b-aee0-7cffdaeb7e0e",
                                   "Created": "2017-11-02T10:18:16.024Z",
                                   "Modified": "2017-11-02T10:18:16.024Z"] as [String:Any]
                
                print("paramsDict:\(paramsDict)")
                
                APIModel().postRequest(self, withUrl: UPDATEAGENTREQUESTINFO_API, parameters: paramsDict, successBlock: { (json) in
                    
                    print("json:\(json)")
                    
                    
                    if (json.count > 0){
                        
                        
                        let updateAgetAgentRequestArray = ParsingModelClass.sharedInstance.updateAgentRequesgtInfoAPIModelParsing(object: json as AnyObject?)
                        
                        print(updateAgetAgentRequestArray)
                        
                        
                        if(updateAgetAgentRequestArray.count > 0){
                            
                            for updateAgentRequestInfo in updateAgetAgentRequestArray{
                                
                                print("firstName:\(String(describing: updateAgentRequestInfo.statusTypeId))")
                                
                                self.updateAgentArr.append(updateAgentRequestInfo.statusTypeId!)
                                
                                let commetns = updateAgentRequestInfo.comments
                                
                                print("commetns:\(commetns)")
                                
                            }
                        }
                        
                    }
                    
                    
                }) { (failureMessage) in
                    
                }
                
            }
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {(alert: UIAlertAction!) in print("cancel")})
        
        alertController.addAction(somethingAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    
    
    }
    
    
    func popUpController()
    {
        
        let alertController = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertControllerStyle.alert)
//        alertController.popoverPresentationController?.sourceView = self.view
//        alertController.popoverPresentationController?.sourceRect = self.view.bounds
        
        let margin:CGFloat = 8.0
        let rect = CGRect(x:margin,y:margin, width:255, height:165)
        let customView = UITextView(frame: rect)
        
//        customView.backgroundColor = UIColor.clear
        customView.font = UIFont(name: "Helvetica", size: 15)
        
        customView.placeholderText = "Please enter your text"
        
        //  customView.backgroundColor = UIColor.greenColor()
        alertController.view.addSubview(customView)
        
        let somethingAction = UIAlertAction(title: "Submit", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in print("Submit")
            
            print(customView.text)
            
            
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {(alert: UIAlertAction!) in print("cancel")})
        
        alertController.addAction(somethingAction)
        alertController.addAction(cancelAction)
        
//        self.present(alertController, animated: true, completion:{})
        
       
        // this is the center of the screen currently but it can be any point in the view
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func UpdateAgentRequestAPICall(){
        
//        let newRegCell : RequestsTableViewCell = textField.superview?.superview as? RequestsTableViewCell
        
       
        let paramsDict = [ "AgentRequestId": 26,
                           "StatusTypeId": 44,
                           "AssignToUserId": "071862aa-d6b6-448a-bf23-943d88739f9d",
                           "Comments": "Hi Naveen",
                           "Id": 26,
                           "IsActive": true,
                           "CreatedBy": "071862aa-d6b6-448a-bf23-943d88739f9d",
                           "ModifiedBy": "071862aa-d6b6-448a-bf23-943d88739f9d",
                           "Created": "2017-11-02T10:18:16.024Z",
                           "Modified": "2017-11-02T10:18:16.024Z"] as [String:Any]
        
        
        print("paramsDict:\(paramsDict)")
        
        APIModel().postRequest(self, withUrl: UPDATEAGENTREQUESTINFO_API, parameters: paramsDict, successBlock: { (json) in
            
            print("json:\(json)")
            
            
            if (json.count > 0){
                
                
                let updateAgetAgentRequestArray = ParsingModelClass.sharedInstance.updateAgentRequesgtInfoAPIModelParsing(object: json as AnyObject?)
                
                print(updateAgetAgentRequestArray)
                
                
                if(updateAgetAgentRequestArray.count > 0){
                    
                    for updateAgentRequestInfo in updateAgetAgentRequestArray{
                        
                        print("firstName:\(String(describing: updateAgentRequestInfo.statusTypeId))")
                        
                        self.updateAgentArr.append(updateAgentRequestInfo.statusTypeId!)
                        
                        let commetns = updateAgentRequestInfo.comments
                        
                       print("commetns:\(commetns)")
                        
                    }
                }
                
            }
            
            
        }) { (failureMessage) in
            
            
            
        }
        
        
        
        
    }
   
    
    @IBAction func backClicked(_ sender: Any) {
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
