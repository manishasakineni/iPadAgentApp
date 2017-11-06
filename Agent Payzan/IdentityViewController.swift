//
//  IdentityViewController.swift
//  Agent Payzan
//
//  Created by CalibrageMac02 on 20/10/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class IdentityViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var personalName: UITextField!
    
    @IBOutlet weak var personalNumber: UITextField!
    
    @IBOutlet weak var financialName: UITextField!
    
    @IBOutlet weak var financialNumber: UITextField!
    
    var activeTextfield = UITextField()
    
    var personalIDSAry : Array<String> = Array()
    var financialIDSAry : Array<String> = Array()
    var pickerDataAry : Array<String> = Array()
    
    var selectedID = "Select ID Proof"
    
    let IDPickerView = UIPickerView()
    

    var paramsDict = [String:Any]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IDPickerView.delegate = self
        IDPickerView.dataSource = self
        
        personalName.delegate = self
        personalName.inputView = IDPickerView
        personalName.text = selectedID
        financialName.delegate = self
        financialName.inputView = IDPickerView
        financialName.text = selectedID
        

        getpersonalIDNames()
        getfinancialNames()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
  
    
    func getpersonalIDNames(){
        
      let classTypeID = "7"
    
    APIModel().getRequest(self, withUrl: PERSONALIDS_API + classTypeID, successBlock: { (json) in
        
        if (json.count > 0){
        
        let getPersonalIDNamesArray = ParsingModelClass.sharedInstance.getPersonalIDNameAPIModelParsing(object: json as AnyObject)
            
            if (getPersonalIDNamesArray.count > 0){
            
                for personalIDName in getPersonalIDNamesArray{
                    
                    self.personalIDSAry.append(personalIDName.descriptions)
                
                }
            
            }
        
        }

        
    }) { (fail) in
        

        
        }
    
    }
    
    func getfinancialNames(){
        
        let classTypeID = "8"
        
        APIModel().getRequest(self, withUrl: FINANCIALIDS_API + classTypeID, successBlock: { (json) in
            
            if (json.count > 0){
            
    let getFinancialIDNamesArray = ParsingModelClass.sharedInstance.getFinancialIDNameAPIModelParsing(object: json as AnyObject)
            
                if (getFinancialIDNamesArray.count > 0){
                
                    for financialIDName in getFinancialIDNamesArray{
                    
                    self.financialIDSAry.append(financialIDName.descriptions)
                    
                    }
                
                }
            
            }
            
            
        }) { (fail) in
            
            
        
        }
        
        
        
        
        
        
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == personalName {
          
            pickerDataAry = self.personalIDSAry
            activeTextfield = personalName
            
            IDPickerView.reloadAllComponents()
            IDPickerView.selectRow(0, inComponent: 0, animated: false)
        
        
        }
        
        else if textField == financialName {
        
            pickerDataAry = self.financialIDSAry
            activeTextfield = financialName
            
            IDPickerView.reloadAllComponents()
            IDPickerView.selectRow(0, inComponent: 0, animated: false)
        
        
        
        }
        
    }
    
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        
//        if textField == personalName{
//        
//        personalName.text! = selectedID
//       
//        
//        }
//        
//        else if textField == financialName{
//            
//            financialName.text! = selectedID
//            
//        }
//        
//        
//    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerDataAry.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerDataAry[row]
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if activeTextfield == personalName{
            
        personalName.text = pickerDataAry[row]
            self.IDPickerView.endEditing(true)
            self.view.endEditing(true)
        
        }
        
        else if activeTextfield == financialName {
        financialName.text = pickerDataAry[row]
            
        self.IDPickerView.endEditing(true)
        self.view.endEditing(true)
        
        }
        
    }
    
    @IBAction func nextAction(_ sender: Any) {
        
        if ((personalName.text?.isEmpty)!&&(personalNumber.text?.isEmpty)!&&(financialName.text?.isEmpty)!&&(financialNumber.text?.isEmpty)!) {
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Warning", messege: "Please enter all fields", clickAction: {
                
            })
            
        }
        
        else{
        
        let docVC = self.storyboard?.instantiateViewController(withIdentifier: "AddDocumentViewController") as! AddDocumentViewController
        
        docVC.paramsDict = paramsDict
        
        self.navigationController?.pushViewController(docVC, animated: true)
       }
    }
}
