//
//  AddDocumentViewController.swift
//  Agent Payzan
//
//  Created by CalibrageMac02 on 20/10/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class AddDocumentViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var numberLabel: UITextField!
    
    @IBOutlet weak var imageDocView: UIImageView!
    
    var paramsDict = Dictionary<String, Any>()
    
    var myImagePicker = UIImagePickerController()
    
    let pickerView = UIPickerView()

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func submitAction(_ sender: Any) {
        
        
        print(self.paramsDict)
        
        APIModel().postRequest(self,withUrl: ADDAGENT_API, parameters: paramsDict as Dictionary<String, Any>, successBlock: { (json) in
            
            print("json:\(json)")
            
            
        }) { (failureMessage) in
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Warning", messege: failureMessage, clickAction: {
                
            })
            
            print("fail:\(failureMessage)")
            
        }
    
    
   

}
    
    @IBAction func addDcocAction(_ sender: Any) {
        
        
        let menu = UIAlertController(title: nil, message: "Select Image", preferredStyle: .actionSheet)
        
        
        
        let gallery = UIAlertAction(title: "From Gallery", style: .default, handler: { (alert : UIAlertAction!)
            -> Void in
            
            
            print("select from gallery")
            
            
            self.myImagePicker.delegate = self
            
            self.myImagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            
            self.myImagePicker.allowsEditing = false
            
            self.present(self.myImagePicker, animated : true){
                
                ///
            }
            
            
            
        })
        
        let camera = UIAlertAction(title: "From Camera", style: .default, handler: { (alert : UIAlertAction!)
            -> Void in
            
            
            print("select from camera")
            
            self.myImagePicker.delegate = self
            
            self.myImagePicker.sourceType = UIImagePickerControllerSourceType.camera
            
            self.myImagePicker.allowsEditing = false
            
            self.present(self.myImagePicker, animated : true){
                
                ///
            }
            
            
            
        })
        
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        
        menu.addAction(gallery)
        menu.addAction(camera)
        menu.addAction(cancel)
        
        
        
        // present(menu, animated: true, completion: nil)
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone) {
            
            
            present(menu, animated: true, completion: nil)
        }
            
        else{
            
            let popup = UIPopoverController.init(contentViewController: menu)
            
            popup.present(from: CGRect(x:self.view.frame.size.width/2, y:self.view.frame.size.height/4, width:0, height:0), in: self.view, permittedArrowDirections: UIPopoverArrowDirection.any, animated: true)
            
            // CGRect(x: 0, y: 0, width: 100, height: 100)
        }
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            
            self.imageDocView.image = image
            
        }
        else {
            
            ////
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
