//
//  APIModel.swift
//  Agent Payzan
//
//  Created by Nani Mac on 10/10/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit
import SVProgressHUD


var appDelegate = AppDelegate()

class APIModel: NSObject {
    
    static let sharedInstance = APIModel()
    
    let responseParser = ParsingModelClass.sharedInstance
    
    
    let content_type = "application/json; charset=utf-8"
    
    var reachability: Reachability?
    
    private func isConnectionEshtablished() -> Bool {
        
       reachability = Reachability.init()!
     //   reachability = Reachability.init()!
        let networkStatus: Int = reachability!.currentReachabilityStatus.hashValue
        setupReachability(hostName: "google.com", useClosures: true)
        return (networkStatus != 0)
    }
    
    func setupReachability(hostName: String?, useClosures: Bool) {
        
        let reachability = hostName == nil ? Reachability() : Reachability(hostname: hostName!)
        self.reachability = reachability
        
        if useClosures {
            reachability?.whenReachable = { reachability in
                DispatchQueue.main.async {
                    
                    print("Network is reachable")
                    // Reachable
                }
            }
            reachability?.whenUnreachable = { reachability in
                DispatchQueue.main.async {
                    
                    print("Network is not reachable")
                    // Non Reachable
                }
            }
        }
    }
    
//////////////  Post Request //////////
    
    
    
    func postRequest(_ viewController : UIViewController, withUrl urlPath: String, parameters: Dictionary<String, Any>, successBlock: @escaping ( _ requestDataModel : Dictionary <String, Any>) -> Void, failureBlock: @escaping (_ failureMessage: String) -> Void)
    {
       
        if isConnectionEshtablished(){
            
        viewController.showHud(SVHUDMESSAGE)
            
            do {
                
                
                let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions.prettyPrinted)
                
                if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
                    print(JSONString)
                    
                    if let jsonData1 = JSONString.data(using: String.Encoding.utf8, allowLossyConversion: false)
                    {
                        print(jsonData1)
                
                let request = NSMutableURLRequest(url: NSURL(string: urlPath)! as URL)
                request.addValue(content_type, forHTTPHeaderField: "Content-Type")
                request.addValue(content_type, forHTTPHeaderField: "Accept")
                //// request.setValue(api_key, forHTTPHeaderField: "api_key")

//                request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
                request.setValue("application/json", forHTTPHeaderField: "Accept")
                request.httpMethod = "POST"
                
                request.httpBody = jsonData1
                
                let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
                    
                    if(response != nil){
                        do
                        {
                            
                            if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers ) as? NSDictionary {
                                
                                if let isSuccess = json["IsSuccess"] as? Bool{
                                    
                                    if(isSuccess == true){
                                        DispatchQueue.main.async {
                                            
                                            print(json)
                                            
                                            successBlock(json as! Dictionary<String, AnyObject>)
                                            viewController.hideHUD()
                                        }
                                    }
                                    else if (isSuccess == false){
                                        
                                        if Utilities.sharedInstance.isObjectNull(json as AnyObject?) {
                                            
                                            if let failureMessage = json["EndUserMessage"] as? String{
                                                
                                                DispatchQueue.main.async {
                                                    failureBlock(failureMessage)
                                                    
                                                    //self.ShowError(viewController, message: statusMessage)
                                                }
                                            }
                                        }
                                        
                                        viewController.hideHUD()
                                    }
                                    
                                    else  {
                                        
                                        if Utilities.sharedInstance.isObjectNull(json as AnyObject?) {
                                            
                                            if let failureMessage = json["EndUserMessage"] as? String{
                                                
                                                DispatchQueue.main.async {
                                                    failureBlock(failureMessage)
                                                    
                                                    //self.ShowError(viewController, message: statusMessage)
                                                }
                                            }
                                        }
                                        
                                        viewController.hideHUD()
                                    }

                                }
                          }
                            
                        } catch let catchError as NSError {
                            
                            DispatchQueue.main.async {
                                failureBlock(catchError.localizedDescription)
                                print(catchError.localizedDescription)
                                viewController.hideHUD()
                                // self.ShowError(viewController, message: catchError.localizedDescription)
                            }
                        }
                        
                        
                    }else{
                        
                        
                        
                        if let errorDescription = error?.localizedDescription {
                            
                            DispatchQueue.main.async {
                                failureBlock(errorDescription)
                                viewController.hideHUD()
                                //self.ShowError(viewController, message: errorDescription)
                            }
                        }
                    }
                    
                    
                    
                })
                task.resume()
                
        }
    }
            }
            catch {
                print("parsing error")
                viewController.hideHUD()
            }
       
        
        
    }
        
       else {
        
        Utilities.sharedInstance.alertWithOkButtonAction(vc: viewController, alertTitle: "Warning", messege: "Please Check Internet", clickAction: {
            
            
            
            
        })
        
        
        }
    
    }
    

//////////////  Get Request //////////  
    
    
    
    func getRequest(_ viewController : UIViewController, withUrl urlPath: String,successBlock: @escaping ( _ requestDataModel : Dictionary <String, AnyObject>) -> Void, failureBlock: @escaping (_ failureMessage: String) -> Void)
    {
        if isConnectionEshtablished() {
        viewController.showHud(SVHUDMESSAGE)
        
        let request = NSMutableURLRequest(url: NSURL(string: urlPath)! as URL)
        request.addValue(content_type, forHTTPHeaderField: "Content-Type")
        request.addValue(content_type, forHTTPHeaderField: "Accept")
        //// request.setValue(api_key, forHTTPHeaderField: "api_key")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
        request.httpMethod = "GET"
       
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {(data, response, error) in
            
//            if(response != nil){
            
                if error != nil
                {
                    
                    viewController.hideHUD()
                    print("error=\(String(describing: error))")
                    Utilities.sharedInstance.alertWithOkButtonAction(vc: viewController, alertTitle: "Alert", messege: "The request time out ", clickAction: {
                        
                    })
                    
                    return
                    
                }
               
            do
            {

                if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers ) as? NSDictionary {
                    
//                 let statusCode = (response as! HTTPURLResponse).statusCode
//                    
//                    if 200...299 ~= statusCode {
//                    
//                    
//                        DispatchQueue.main.async {
//
//                            
//                                successBlock(json as! Dictionary<String, AnyObject>)
//                            
//                            }
//                        
//                             viewController.hideHUD()
//                        }
                    
                    if let isSucsess = json["IsSuccess"] as? Bool{
                    
                        if isSucsess == true {
                        
                            DispatchQueue.main.async {
                                
                                successBlock(json as! Dictionary<String, AnyObject>)
                                viewController.hideHUD()
                                
                            }

                        }
                    
                    else{

                        if Utilities.sharedInstance.isObjectNull(json as AnyObject?) {
                            
                            if let failureMessage = json["EndUserMessage"] as? String{
                                
                                DispatchQueue.main.async {
                                    failureBlock(failureMessage)
                                    //self.ShowError(viewController, message: statusMessage)
                                }
                            }
                        }
                       SVProgressHUD.dismiss()
                    }
                    
                }
                
                    
                }
                
            } catch let catchError as NSError {
                
                DispatchQueue.main.async {
                    failureBlock(catchError.localizedDescription)
                    print(catchError.localizedDescription)
                   // self.ShowError(viewController, message: catchError.localizedDescription)
                }
                
                SVProgressHUD.dismiss()
            }
            
            
//        }else{
//            
//            
//            
//            if let errorDescription = error?.localizedDescription {
//                
//                DispatchQueue.main.async {
//                    failureBlock(errorDescription)
//                    Utilities.sharedInstance.alertWithOkButtonAction(vc: viewController, alertTitle: "Alert", messege: "The request time out ", clickAction: {
//                        
//                    })
//                    
//                    return
//                    //self.ShowError(viewController, message: errorDescription)
//                }
//                
//                SVProgressHUD.dismiss()
//                
//            }
//        }
            
           
        
        
        
    }
    task.resume()
}

        else {
        
            Utilities.sharedInstance.alertWithOkButtonAction(vc: viewController, alertTitle: "Warning", messege: "Please Check Internet", clickAction: {
                
                
                
                
            })
            

        }
    
    
    }

}


extension UIViewController {
    
    func showHud(_ message: String) {
        SVProgressHUD.show(withStatus: message)
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.setBackgroundColor(UIColor.lightGray)
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func hideHUD() {
        SVProgressHUD.dismiss()
        UIApplication.shared.endIgnoringInteractionEvents()
        
    }
    
}
    
/*
    
    
    func getDistricts(withUrl urlPath: String, withComplitionBlock responseBlock: @escaping (_ response: Dictionary <String, AnyObject>, _ errorString: String) -> Void)
    {

        let request = NSMutableURLRequest(url: NSURL(string: urlPath)! as URL)
        request.addValue(content_type, forHTTPHeaderField: "Content-Type")
        request.addValue(content_type, forHTTPHeaderField: "Accept")
        //// request.setValue(api_key, forHTTPHeaderField: "api_key")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {(data, response, error) in
            
            do
            {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary <String, AnyObject>
                
                let error = ""
                responseBlock(json,error)
            } catch
            {
                
            }
            
        }
        task.resume()
        
    }
    
    
    func getCountries(withUrl urlPath: String, withComplitionBlock responseBlock: @escaping (_ response: Dictionary <String, AnyObject>, _ errorString: String) -> Void)
    {
        let request = NSMutableURLRequest(url: NSURL(string: urlPath)! as URL)
        request.addValue(content_type, forHTTPHeaderField: "Content-Type")
        request.addValue(content_type, forHTTPHeaderField: "Accept")
        //// request.setValue(api_key, forHTTPHeaderField: "api_key")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {(data, response, error) in
            
            do
            {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary <String, AnyObject>
                
                let error = ""
                responseBlock(json,error)
            } catch
            {
                
            }
            
        }
        task.resume()
        
    }
    
    func RegistrationUser(withUrl urlPath: String, withParameters parameters: String, withComplitionBlock responseBlock: @escaping (_ response: Dictionary <String, AnyObject>, _ errorString: String) -> Void)
    {
        let request = NSMutableURLRequest(url: NSURL(string: urlPath)! as URL)
        request.addValue(content_type, forHTTPHeaderField: "Content-Type")
        request.addValue(content_type, forHTTPHeaderField: "Accept")
        //// request.setValue(api_key, forHTTPHeaderField: "api_key")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
        request.httpMethod = "POST"
        request.httpBody = parameters.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {(data, response, error) in
            
            do
            {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary <String, AnyObject>
                
                let error = ""
                responseBlock(json,error)
            } catch
            {
                
            }
            
        }
        task.resume()
        
    }
     
     
    
     func getCountInfo( viewController: UIViewController, parameters: Dictionary<String, Any>, successBlock: @escaping ( categories : Array<CountModel>) -> Void, failureBlock: @escaping (_ fail: Bool) -> Void){
     
     if isConnectionEshtablished() {
     
     do {
     
     
     let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
     
     // create post request
     let endpoint: String = BASE_URL + API_GETTOTALSTODISPLAY
     
     let session = URLSession.shared
     
     let request = networkSharedInstance(endpoint)
     
     request?.httpMethod = "POST"
     
     request?.httpBody = jsonData
     
     let task = session.dataTask(with: request! as URLRequest, completionHandler: { data, response, error in
     
     
     
     guard error == nil else {
     
     
     if let errorDescription = error?.localizedDescription {
     
     DispatchQueue.main.async {
     failureBlock(true)
     self.ShowError(viewController, message: errorDescription)
     }
     }
     return
     }
     
     guard let data = data else {
     return
     }
     
     
     // Checking here Response
     if response != nil {
     
     
     
     let statusCode = (response as! HTTPURLResponse).statusCode
     
     
     // Checking here Response Status
     
     do {
     
     //create json object from data
     
     if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary {
     
     if 200...299 ~= statusCode {
     
     DispatchQueue.main.async {
     
     let countDetails = NetworkResponseParser.sharedInstance.parseCountInfo(object: json)
     
     successBlock(countDetails)
     }
     }else if 401 == statusCode {
     DispatchQueue.main.async {
     self.moveToHomeScreen(kUnauthorizedError)
     }
     }else{
     
     
     
     if Utilities.sharedInstance.isObjectNull(json as AnyObject?) {
     
     if let statusMessage = json["message"] as? String{
     
     DispatchQueue.main.async {
     failureBlock(true)
     self.ShowError(viewController, message: statusMessage)
     }
     }
     }
     
     }
     
     
     }
     
     } catch let catchError as NSError {
     
     DispatchQueue.main.async {
     failureBlock(true)
     self.ShowError(viewController, message: catchError.localizedDescription)
     }
     }
     
     
     }else{
     
     
     
     if let errorDescription = error?.localizedDescription {
     
     DispatchQueue.main.async {
     failureBlock(true)
     self.ShowError(viewController, message: errorDescription)
     }
     }
     }
     
     
     
     })
     task.resume()
     } catch {
     print("parsing error")
     }
     }else {
     
     ShowError()
     }
     
     
     }
 
 
 
 */
    
   


