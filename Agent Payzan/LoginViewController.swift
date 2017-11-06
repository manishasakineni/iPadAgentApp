//
//  ViewController.swift
//  Agent Payzan
//
//  Created by N@n!'$ Mac on 26/10/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var mobileEmailTF: UITextField!
    
    
    @IBOutlet weak var passwordTF: UITextField!
    
    var email = ""
    var password = ""

    var eyeIcon : Bool!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        eyeIcon = true
        
        mobileEmailTF.delegate = self
        passwordTF.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        

        if textField == mobileEmailTF{
        email = mobileEmailTF.text!
        
        }
        
        else if textField == passwordTF{
        
        password = passwordTF.text!
        
        }
        
    }
    
    
    func validatePhoneNumber(value: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    
    
    @IBAction func loginClicked(_ sender: Any) {
        
self.view.endEditing(true)
        
        //        if(email.contains("@"))
        //        {
        //            let RequestsVC = self.storyboard?.instantiateViewController(withIdentifier: "RequestsVC") as! RequestsViewController
        //
        //            self.navigationController?.pushViewController(RequestsVC, animated: true)
        //        }
        //
        //        else{
        //
        //            let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        //            let emailTest = NSPredicate(format: "SELF MATCHES %@", emailReg)
        //            if emailTest.evaluate(with: email) == false {
        //                UIAlertView(title: "Worning", message: "Please Enter Valid Email Address (or) Phone Number", delegate: nil, cancelButtonTitle: "OK").show()
        //                return
        //            }
        
        
        if email.isEmpty && password.isEmpty{
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Message", messege: "Please Enter Required Fields", clickAction: {
                
                
            })
            
        }
            
            
        else if (email.isEmpty) {
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Message", messege: "Please Enter Your Mobile Number or Email", clickAction: {
                
                
            })
            
        }
        else if (password.isEmpty) {
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Message", messege: "Please Enter Your Password", clickAction: {
                
                
            })
            
        }
            
        else if (email.characters.count != 10){
        
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Worning", messege: "Mobile number should be 10 digits", clickAction: { 
                
            })
        
        }
            
        
            
        else {
            
            
            
            let params = ["userName": email,
                          "password": password] as Dictionary<String, AnyObject>
            
            print("parms:\(params)")
            
            APIModel().postRequest(self, withUrl: LOGIN_API , parameters: params as Dictionary<String, AnyObject> , successBlock: { (json) in
                
                print(json)
   
                UserDefaults.standard.set("true", forKey: KFirstTimeLogin)
                UserDefaults.standard.synchronize()
                
                let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "homeVC") as! HomeViewController
                
                self.navigationController?.pushViewController(homeVC, animated: true)
                
                
                
            })
            { (failureMessage) in
                
                Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Warning", messege: failureMessage, clickAction: {
  
                })
                
                
                print("fail: \(failureMessage)")
                
                // appDelegate.window?.makeToast("madhu"), duration:kToastDuration , position:CSToastPositionCenter)
                
                
            }
        }
    }
    
    
    
    
    
    @IBAction func eyeClicked(_ sender: Any) {
        
        if eyeIcon == true {
            passwordTF.isSecureTextEntry = false
            eyeIcon = false
        }
            
        else if eyeIcon == false
        {
            
            passwordTF.isSecureTextEntry = true
            eyeIcon = true
            
        }
        
        
    }


}
