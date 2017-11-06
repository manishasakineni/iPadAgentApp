//
//  InProgressViewController.swift
//  Agent Payzan
//
//  Created by CalibrageMac02 on 02/11/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class InProgressViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var inProgressTableView: UITableView!
    
    var namesarra1 : Array<String> = Array()
    var businessArr : Array<String> = Array()
    var addressArr : Array<String> = Array()
    var mobileArr : Array<String> = Array()
    var emailArr :  Array<String> = Array()
    
    var statusTypeIdArr :  Array<Int> = Array()
    
    var agentReqArr = [String]()
    let textView = UITextView()
    
    var statusTypeIdd:String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.inProgressTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        inProgressTableView.register(UINib.init(nibName: "InProgressTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: "InProgressTableViewCell")
        
        self.inProgressTableView.delegate = self
        self.inProgressTableView.dataSource = self
        
        self.getAgentRequesgtInfoAPICall()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                        
                        print("statusTypeId:\(String(describing: agentRequestInfo.statusTypeId))")
                        
                        self.statusTypeIdArr.append(agentRequestInfo.statusTypeId!)
                        
                    }
                    self.inProgressTableView.reloadData()
                }
                
            }
                
    
            else{}
            
            
            
        }) { (failureMessage) in
            
            
            
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
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InProgressTableViewCell", for: indexPath) as! InProgressTableViewCell
        
        
        cell.selectionStyle = .none
        cell.firstnameLabel.text = agentReqArr[indexPath.row]
        cell.businessCatgLabel.text = businessArr[indexPath.row]
        cell.addressLabel.text = addressArr[indexPath.row]
        cell.mobileNumLabel.text = mobileArr[indexPath.row]
        cell.emailLabel.text = emailArr[indexPath.row]
        
        
        cell.addBtn.addTarget(self, action: #selector(addClicked), for: .touchUpInside)
        cell.updateBtn.addTarget(self, action: #selector(updateClicked), for: .touchUpInside)
        
        
        
        if (statusTypeIdArr[indexPath.row] == 44) {
            
            cell.updateBtn.isHidden = true
            cell.rightImageView.isHidden = true
            
        }else{
            
            cell.updateBtn.isHidden = false
        }
        
        if (statusTypeIdArr[indexPath.row] == 46) {
            
            cell.updateBtn.isHidden = true
            cell.addBtn.isHidden = true
            
            cell.rightImageView.isHidden = false
            
        }        
        
        print("loading")
        return cell
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    func addClicked(_ sender: UIButton){
        
        
        let alert = UIAlertController(title: "Enter your Minutes", message: "", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
            
            textField.keyboardType = UIKeyboardType.numberPad
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            //                    print("Text field: \(textField?.text)")
            
            //                    self.timeField.text = textField?.text
        }))
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            //                    print("Text field: \(textField?.text)")
            
            let labelStr = textField?.text
            
            print("labelStr:\(String(describing: labelStr))")
        }))
        
        
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func updateClicked(_ sender: UIButton){
        
        
    }

    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }


}
