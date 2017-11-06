//
//  BankDetailsViewController.swift
//  Agent Payzan
//
//  Created by Nani Mac on 12/10/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class BankDetailsViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate {
    
    var paramsDict = [String:Any]()
    
    let imagesPicker = UIImagePickerController()
    let pickerView = UIPickerView()
    
    @IBOutlet weak var bankNameTF: UITextField!
    
    @IBOutlet weak var branchNameTF: UITextField!
    
    
    
    
    @IBOutlet weak var accountHolderTF: UITextField!
    
    @IBOutlet weak var accountNoTF: UITextField!
    
    @IBOutlet weak var swiftCodeTF: UITextField!
    
    
    @IBOutlet weak var docImgVW: UIImageView!
    
    
    var bankNamesAry : Array<String> = Array()
    var bankBranchesArray :  Array<String> = Array()
    var swiftCodesAry : Array<String> = Array()
    
    var pickerDataAry : Array<String> = Array()
    
    var activeTextfield = UITextField()
    
    var selectedbankName = "Select Bank Name"
    var selectedbankBranch = "Select Branch"
    var selectedSwiftCode = "Select Swift Code"

    @IBOutlet weak var addDocsBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bankNameTF.borderStyle = UITextBorderStyle.roundedRect
        branchNameTF.borderStyle = UITextBorderStyle.roundedRect
        accountHolderTF.borderStyle = UITextBorderStyle.roundedRect
        accountNoTF.borderStyle = UITextBorderStyle.roundedRect
        swiftCodeTF.borderStyle = UITextBorderStyle.roundedRect
        
        pickerView.delegate = self
        
        bankNameTF.inputView = pickerView
        bankNameTF.delegate = self
        branchNameTF.inputView = pickerView
        branchNameTF.delegate = self
        accountHolderTF.keyboardType = .default
        accountNoTF.keyboardType = .numberPad
        swiftCodeTF.inputView = pickerView
        swiftCodeTF.delegate = self
        
        
        bankNameTF.text = selectedbankName
        branchNameTF.text = selectedbankBranch
        swiftCodeTF.text = selectedSwiftCode
       
        
        
        getBankDetailsAPICall()

        print(paramsDict)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    func getBankDetailsAPICall(){
    
        let classTypeID = "1"
        APIModel.sharedInstance.getRequest(self, withUrl: BANKNAMES_API + classTypeID, successBlock: { (json) in
            
            if(json.count > 0){
                
                let getBankArray = ParsingModelClass.sharedInstance.getBankNamesAPIModelParsing(object: json as AnyObject?)
                
                print(getBankArray.count)
                
                if(getBankArray.count > 0){
                    
                    for bankName in getBankArray{
                        
                    self.bankNamesAry.append(bankName.descriptions)
                        
                        if (self.bankNamesAry.count > 0) {
                         
                           self.getBankBranchesAndSwiftCode()
   
                        }
                        
                        
                        else{
                        
                        
                        
                        }
            
                        
                    }
                    
                }
                
                else{
                
                print("No items")
                
                }
                
                
            }
            
        })  { (failureMessage) in
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Worning", messege: failureMessage, clickAction: {
                
                
            })
            
            print("json Failed")
            
            
        }
    
    }
    
    
    func getBankBranchesAndSwiftCode(){
    
        let classTypeID = "1"
        
        APIModel().getRequest(self, withUrl: BANKBRANCHES_API + classTypeID, successBlock: { (json) in
            
            
            if(json.count > 0){
                
                let getBankBranchesArray = ParsingModelClass.sharedInstance.getBankBranchesAPIModelParsing(object: json as AnyObject?)
                
                print(getBankBranchesArray.count)
                
                if(getBankBranchesArray.count > 0){
                    for branchDetails in getBankBranchesArray{
                        
                        self.bankBranchesArray.append(branchDetails.branchName)
                        self.swiftCodesAry.append(branchDetails.swiftCode)
                        
                        print("--->>%@",self.bankBranchesArray.count)
                        
                    }}
                
                else{
                    
                    print("No items")
                    
                }
            
            }
            
        }) { (failureMessage) in
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Worning", messege: failureMessage, clickAction: {
                
                
            })
            
            print("json Failed")
            
            
        }

    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        if textField == bankNameTF{
         
        pickerDataAry = bankNamesAry
        activeTextfield = bankNameTF
        activeTextfield.text = ""
            
        pickerView.reloadAllComponents()
        pickerView.selectRow(0, inComponent: 0, animated: false)
            
        }
        
        else if textField == swiftCodeTF{
            
            pickerDataAry = swiftCodesAry
            activeTextfield = swiftCodeTF
            activeTextfield.text = ""
            
            pickerView.reloadAllComponents()
            pickerView.selectRow(0, inComponent: 0, animated: false)
        }
        
        else if textField == branchNameTF{
        
        pickerDataAry = bankBranchesArray
      
        activeTextfield = branchNameTF
        activeTextfield.text = ""
            
        pickerView.reloadAllComponents()
        pickerView.selectRow(0, inComponent: 0, animated: false)
            
            
        }
        
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == bankNameTF{
            
          
            bankNameTF.text = selectedbankName
                
            
          //  activeTextfield.text = ""
            
            pickerView.reloadAllComponents()
            pickerView.selectRow(0, inComponent: 0, animated: false)
            
        }
            
        else if textField == swiftCodeTF{
            
          
            
            swiftCodeTF.text = selectedSwiftCode
                
            
           // activeTextfield.text = ""
            
            pickerView.reloadAllComponents()
            pickerView.selectRow(0, inComponent: 0, animated: false)
        }
            
        else if textField == branchNameTF{
            
           
           branchNameTF.text = selectedbankBranch
          
           // activeTextfield.text = ""
            
            pickerView.reloadAllComponents()
            pickerView.selectRow(0, inComponent: 0, animated: false)
            
        }
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
       
        
        return self.pickerDataAry.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
    
        return self.pickerDataAry[row]
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if(activeTextfield == bankNameTF){
            selectedbankName = pickerDataAry[row]
        }
        
        else if(activeTextfield == branchNameTF){
        selectedbankBranch = pickerDataAry[row]
        }
        
        else if(activeTextfield == swiftCodeTF){
            selectedSwiftCode = pickerDataAry[row]
        }
        
        self.pickerView.endEditing(true)
        self.view.endEditing(true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            
            self.docImgVW.image = image
            
        }
        else {
            
            ////
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    @IBAction func submitClicked(_ sender: Any) {
        
        if ((bankNameTF.text?.isEmpty)!&&(branchNameTF.text?.isEmpty)!&&(swiftCodeTF.text?.isEmpty)!&&(accountHolderTF.text?.isEmpty)!&&(accountNoTF.text?.isEmpty)!) {
        
        Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Warning", messege: "Please enter all fields", clickAction: { 
            
        })
            
        }
        
        else {
        let docVC = self.storyboard?.instantiateViewController(withIdentifier: "IdentityViewController") as! IdentityViewController
        
        docVC.paramsDict = paramsDict as [String:Any]
        
        self.navigationController?.pushViewController(docVC, animated: true)
        }
    
    }
    
    @IBAction func backClicked(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
