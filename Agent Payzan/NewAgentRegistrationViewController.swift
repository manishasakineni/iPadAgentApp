//
//  NewAgentRegistrationViewController.swift
//  Agent Payzan
//
//  Created by Nani Mac on 05/10/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class NewAgentRegistrationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource,MKMapViewDelegate,CLLocationManagerDelegate,UITextFieldDelegate {
    
    var userName            : String = ""
    var password            : String = ""
    var mobileNumber        : String = ""
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var newRegTableview: UITableView!
    
    var userCurrentLatitude = ""
    var userCurrentLongitude = ""
    var lanLatStr = ""
    var userCurrentaddressDict = NSDictionary()

    let newRegPicker = UIPickerView()
    var toolBar = UIToolbar()
    var pickerData : Array<String> = Array()
    
    var businessCategoryAry = Array<String>()
    var provinceNamesAry = Array<String>()
    var genderArray = Array<String>()
    
    var activeTextField = UITextField()
    var activeLabel = UILabel()
    
    var userRegistrationData : Dictionary = Dictionary<String,Any>()
    
    var selectedBusinessStr = ""
    var selectedProvinceStr = ""
    var selectedGenderStr   = ""
    
    var placeholdersAry  = ["Title","Agent Name","Business Category","Agency Name","Id No","User Name","Password","Mobile No","Email ID","Provinence Name","Address","State","Pincode",""]
    
    var labelAry  = ["Title","Agent Name","Business Category","Agency Name","Id No","User Name","Password","Mobile No","Email ID","Provinence Name","Address","State","Pincode",""]
    
    var userLocationCoordinate : CLLocationCoordinate2D?
    
    
    
    let mapTableViewCell = MapTableViewCell()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        

        
        newRegPicker.delegate = self
        newRegPicker.dataSource = self

        newRegTableview.register(UINib.init(nibName: "NewRegTableViewCell", bundle: nil),
                                          forCellReuseIdentifier: "NewRegTableViewCell")
        
        newRegTableview.register(UINib.init(nibName: "MapTableViewCell", bundle: nil),
                                 forCellReuseIdentifier: "MapTableViewCell")
        
//        selectedBusinessStr = "Select Business Category"
//        selectedProvinceStr = "Select Province Name"
//        selectedGenderStr   = "Select Gender Type"
        
        
        setupRegistrationData()
        getBusinessCategory()
        getProvinceNames()
        getGender()
        
    }
    
    func setupRegistrationData(){
        
        userRegistrationData.updateValue("", forKey: "AgentBusinessCategoryId")
        userRegistrationData.updateValue("", forKey: "AgentRequestId")
        userRegistrationData.updateValue("", forKey: "Id")
        userRegistrationData.updateValue("", forKey: "AspNetUserId")
        userRegistrationData.updateValue("", forKey: "TitleTypeId")
        userRegistrationData.updateValue("", forKey: "FirstName")
        userRegistrationData.updateValue("", forKey: "MiddleName")
        userRegistrationData.updateValue("", forKey: "LastName")
        userRegistrationData.updateValue("", forKey: "Phone")
        userRegistrationData.updateValue("", forKey: "Email")
        userRegistrationData.updateValue("", forKey: "GenderTypeId")
        userRegistrationData.updateValue("", forKey: "DOB")
        userRegistrationData.updateValue("", forKey: "Address1")
        userRegistrationData.updateValue("", forKey: "Address2")
        userRegistrationData.updateValue("", forKey: "Landmark")
        userRegistrationData.updateValue("", forKey: "VillageId")
        userRegistrationData.updateValue("", forKey: "ParentAspNetUserId")
        userRegistrationData.updateValue("", forKey: "IsActive")
        userRegistrationData.updateValue("", forKey: "CreatedBy")
        userRegistrationData.updateValue("", forKey: "Created")
        userRegistrationData.updateValue("", forKey: "ModifiedBy")
        userRegistrationData.updateValue("", forKey: "Modified")
        
    
    }
    
    func validateRegistrationFields(){
        if(userRegistrationData["AgentBusinessCategoryId"] as? String == ""){
            
          Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Warning", messege: "Should not be empty", clickAction: {})
            return
        }
        
        if(userRegistrationData["AgentRequestId"] as? String == ""){
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Warning", messege: "Should not be empty", clickAction: {})
            return
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    func getGender(){
    
    let classTypeID = "4"
    
    APIModel().getRequest(self, withUrl: GENDER_API + classTypeID, successBlock: { (json) in
        
        if (json.count > 0){
        
        let genderAPIModelArray = ParsingModelClass.sharedInstance.getGenderTypeAPIModelParsing(object: json as AnyObject)
            
            if genderAPIModelArray.count > 0{
            
            for genderType in genderAPIModelArray{
                self.genderArray.append(genderType.descriptions)
           
            }
            
            }
        
        
        }
  
    }) { (failureMessage) in
        
        print("getGender Details Failed")
        Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Warning",
            messege: failureMessage , clickAction: {
                                                            
        })
        }
    
    }
    
    
    func getBusinessCategory(){
    
    let classTypeID = "3"
        
    APIModel().getRequest(self, withUrl: BUSINESSCATEGORY_API + classTypeID, successBlock: { (json) in
        
        if(json.count > 0){
            
            let businessCategoryAPIModelArray = ParsingModelClass.sharedInstance.getBankNamesAPIModelParsing(object: json as AnyObject?)
            
            print(businessCategoryAPIModelArray.count)
            
            if(businessCategoryAPIModelArray.count > 0){
                for businessCategory in businessCategoryAPIModelArray{
                    
                    self.businessCategoryAry.append(businessCategory.descriptions)
                    
                    
                }
                
            }
   
            else{
                print("No items")
            }
            
            
        }
  
    }) { (failureMessage) in
        
//        Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Warning", messege: failureMessage, clickAction: {
//            
//            
//        })
        
        print("json Failed")
        
        
        }
    }
    
    
    
    func getProvinceNames(){
    
    
    let classTypeID = "4"
        
        APIModel().getRequest(self, withUrl: PROVINCE_API + classTypeID, successBlock: { (json) in
            
            if (json.count > 0){
            
             let provinceNameModelArray = ParsingModelClass.sharedInstance.getProvinceNameAPIModelParsing(object: json as AnyObject?)
                
                
                if(provinceNameModelArray.count > 0){
                
                for provinceName in provinceNameModelArray{
                
                self.provinceNamesAry.append(provinceName.name)
                
                    }}
 
            }
            else{
                print("No items")
            }
            
            
            
        }) { (failureMessage) in
            
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Warning", messege: failureMessage, clickAction: {
                
                
                
                
            })
        }
    
    
    
    
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        activeTextField = textField
        
        if textField.tag == 0{
        
            pickerData = genderArray
            self.pickUp(activeTextField)
            newRegPicker.reloadAllComponents()
            newRegPicker.selectRow(0, inComponent: 0, animated: false)
        
        
        }
        
          else if textField.tag == 2{
            
           
            pickerData = businessCategoryAry
             self.pickUp(activeTextField)
            newRegPicker.reloadAllComponents()
            newRegPicker.selectRow(0, inComponent: 0, animated: false)
                
            }
                
            else if textField.tag == 9 {
                
    
            pickerData = provinceNamesAry
             self.pickUp(activeTextField)
            newRegPicker.reloadAllComponents()
            newRegPicker.selectRow(0, inComponent: 0, animated: false)

            
            }
        
       
        
  
    }
    
    func pickUp(_ textField : UITextField){
        
        // UIPickerView
//        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
//        self.myPickerView.delegate = self
//        self.myPickerView.dataSource = self
//        self.myPickerView.backgroundColor = UIColor.white
        textField.inputView = self.newRegPicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = #colorLiteral(red: 0.4438641369, green: 0.09910114855, blue: 0.1335680187, alpha: 1)
        //            UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(NewAgentRegistrationViewController.doneClick))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(NewAgentRegistrationViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    
    //MARK:- Button
    func doneClick() {
        
        activeTextField.resignFirstResponder()
        newRegTableview.reloadData()
    }
    func cancelClick() {
        
        activeTextField.resignFirstResponder()
        newRegTableview.reloadData()
        selectedGenderStr = ""
        selectedBusinessStr = ""
        selectedProvinceStr = ""
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        
        if let newRegCell : NewRegTableViewCell = textField.superview?.superview as? NewRegTableViewCell {
            
            if textField.tag == 0{
            
            activeTextField.text = selectedGenderStr
            
            }
            
            else if textField.tag == 2 {
                
               activeTextField.text = selectedBusinessStr
                
                
                // nextBtnClicked(textField.text!, keyName: "Password")
                
                
            }
                
             else if textField.tag == 9 {
                
                activeTextField.text = selectedProvinceStr
               
                // nextBtnClicked(textField.text!, keyName: "Password")
                
                
             }
            
            else if textField.tag == 5 {
                
                userName = textField.text!
                //  nextBtnClicked(textField.text!, keyName: "userName")
                
            }
                
            else if textField.tag == 6 {
                
                password = textField.text!
                //  nextBtnClicked(textField.text!, keyName: "Password")
                
                
            }
                
                
            else if textField.tag == 7 {
                
                mobileNumber = textField.text!
                //  nextBtnClicked(textField.text!, keyName: "Password")
                
                
            }
                
   
            else if textField.tag == 8 {
                
                password = textField.text!
                //  nextBtnClicked(textField.text!, keyName: "Password")
                
                
            }
                
            else if textField.tag == 10 {
                
                password = textField.text!
                //  nextBtnClicked(textField.text!, keyName: "Password")
                
                
            }
                
            else if textField.tag == 11 {
                
                password = textField.text!
                //  nextBtnClicked(textField.text!, keyName: "Password")
                
                
            }
                
            else if textField.tag == 12 {
                
                password = textField.text!
                //  nextBtnClicked(textField.text!, keyName: "Password")
                
                
            }
            
        }
        
       
        
    }
    
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 14
    }
    
    
//  func  tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
//    
//    return 40
//    
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//    
//            let view = UIView(frame: CGRect(x: 0, y: 10, width: newRegTableview.frame.size.width, height: 40))
//            /* Create custom view to display section header... */
//            let label = UILabel(frame: CGRect(x: 0, y: 5, width: newRegTableview.frame.size.width, height: 20))
//           // label.font = UIFont.boldSystemFont(ofSize: 15)
//        
//            label.font = UIFont(name: "HelveticaNeue", size: 17)
//            let string: String = " "
//            /* Section header is in 0th index... */
//            label.text = string
//            label.textAlignment = .center
//            label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//            view.addSubview(label)
//            view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//            return view
//        }
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 13 {
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone) {
            
            return 220
        }
            
            else{
            
            return 480
            }
        
        }
        
        return 60
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        if(indexPath.row != 13){
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewRegTableViewCell") as! NewRegTableViewCell
            
            cell.detailsTextField.delegate = self
            
            cell.detailsTextField.tag = indexPath.row
            
            cell.detailsTextField.placeholder = placeholdersAry[indexPath.row]
            
            cell.detailLbl.text = labelAry[indexPath.row]
            cell.detailLbl.tag = indexPath.row
            activeLabel = cell.detailLbl
            activeLabel.isHidden = true
            
            if indexPath.row == 0 {
                
                cell.detailsTextField.inputView = newRegPicker
                
                cell.detailsTextField.text = selectedGenderStr
                
                
            }
                
            else if indexPath.row == 2 {
                
                cell.detailsTextField.inputView = newRegPicker
                
                cell.detailsTextField.text = selectedBusinessStr
                
                
            }
                
                
                
            else if indexPath.row == 7{
                
                cell.detailsTextField.keyboardType = .numberPad
                
            }
                
            else if indexPath.row == 8{
                
                cell.detailsTextField.keyboardType = .emailAddress
                
            }
                
            else if indexPath.row == 9{
                
                cell.detailsTextField.inputView = newRegPicker
                cell.detailsTextField.text = selectedProvinceStr
                
            }
            else if indexPath.row == 10{
                
                cell.detailsTextField.text = self.userCurrentaddressDict.value(forKey: "City") as? String
                
            }
                
            else if indexPath.row == 11{
                
                cell.detailsTextField.text = self.userCurrentaddressDict.value(forKey: "State") as? String
                
            }
                
            else if indexPath.row == 12{
                
                cell.detailsTextField.text = self.userCurrentaddressDict.value(forKey: "ZIP") as? String
                
            }
                
                
            else {
                
                
                cell.detailsTextField.text = "abc"
                cell.detailsTextField.inputView = nil
            }
            return cell

        }else{
            
            let mapCell = tableView.dequeueReusableCell(withIdentifier: "MapTableViewCell") as! MapTableViewCell
            
            mapCell.lanLatLbl.text = "Lan, Lat"
            
            mapCell.lanLatTF.delegate = self
            
            mapCell.nextClicked.addTarget(self, action: #selector(nextBtnClicked), for: .touchUpInside)
            
            mapCell.currentLocationBtn.addTarget(self, action: #selector(getCurrentLocation), for: .touchUpInside)
            
            mapCell.userMapview.delegate = self
            
            
            mapCell.userMapview.showsUserLocation = false
            
            
            
            
            mapCell.currentLocationBtn.tag = indexPath.row
            
            
            mapCell.lanLatTF.text = lanLatStr
            mapCell.lanLatTF.tag = indexPath.row
            
            return mapCell
        }
        
        
        
    
        
        
        
    }
    
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        
//        let userLocation:CLLocation = locations[0] as CLLocation
//        locationManager.stopUpdatingLocation()
//        
//        let location = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
//        
//        let span = MKCoordinateSpanMake(0.5, 0.5)
//        
//        let region = MKCoordinateRegion (center:  location,span: span)
//        
//       // mapView.setRegion(region, animated: true)
//    }
    
    
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            

                userLocationCoordinate = userLocation.coordinate
            
            let indexPath : IndexPath = IndexPath(row: 13, section: 0)
            
            if let mapTableViewCell : MapTableViewCell = newRegTableview.cellForRow(at: indexPath) as? MapTableViewCell {
                
                mapTableViewCell.userMapview.showsUserLocation = true
                
                
                 let userlocation = userLocationCoordinate
                 
                
                 
                 let region = MKCoordinateRegionMakeWithDistance((userlocation)!, 1000, 1000)
                 
                 mapTableViewCell.userMapview.setRegion(region, animated: true)
                 
                 
                 let latitude   = userlocation?.latitude
                 let longitude  = userlocation?.longitude
                
                 
//                 userCurrentLatitude = "\(String(describing: latitude!))"
//                 
//                 userCurrentLongitude = "\(String(describing: longitude!))"
                
                userCurrentLatitude = (String(format: "%.4f", latitude!))
                userCurrentLongitude = (String(format: "%.4f", longitude!))
                 
                 lanLatStr = userCurrentLatitude + ", " + userCurrentLongitude
                 
                 let location = CLLocation(latitude:latitude!, longitude: longitude!)
                 
                 CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                 
                 if error != nil{
                 
                 print("faild")
                 return
                 
                 
                 }
                 
                 if (placemarks?.count)! > 0{
                 
                 
                 //     let  pplacemark = placemarks?[0] as? CLPlacemark!
                 
                 // Place details
                 var placeMark: CLPlacemark!
                 placeMark = placemarks?[0]
                 
                 
                 
                 // Address dictionary
                 
                 self.userCurrentaddressDict = placeMark.addressDictionary! as NSDictionary
                 //     print(placeMark.addressDictionary, terminator: "")
                 
                 if let placemark = placemarks?[0] {
                 
                 // Create an empty string for street address
                 var streetAddress = ""
                 
                 // Check that values aren't nil, then add them to empty string
                 // "subThoroughfare" is building number, "thoroughfare" is street
                 if placemark.subThoroughfare != nil && placemark.thoroughfare != nil {
                 
                 streetAddress = placemark.subThoroughfare! + " " + placemark.thoroughfare!
                 
                 } else {
                 
                 print("Unable to find street address")
                 
                 }
                 
                 // Same as above, but for city
                 var city = ""
                 
                 // locality gives you the city name
                 if placemark.locality != nil  {
                 
                 city = placemark.locality!
                 
                 } else {
                 
                 print("Unable to find city")
                 
                 }
                 
                 // Do the same for state
                 var state = ""
                 
                 // administrativeArea gives you the state
                 if placemark.administrativeArea != nil  {
                 
                 state = placemark.administrativeArea!
                 
                 } else {
                 
                 print("Unable to find state")
                 
                 }
                 
                 // And finally the postal code (zip code)
                 var zip = ""
                 
                 if placemark.postalCode != nil {
                 
                 zip = placemark.postalCode!
                 
                 } else {
                 
                 print("Unable to find zip")
                 
                 }
                 
                 print("\(streetAddress)\n\(city), \(state) \(zip)")
                 
                 
                 
                 // Location name
                 //                    if let locationName = placeMark.addressDictionary!["Name"] as? NSString {
                 //                        print(locationName, terminator: "")
                 //                    }
                 //
                 //                    // Street address
                 //                    if let street = placeMark.addressDictionary!["Thoroughfare"] as? NSString {
                 //                        print(street, terminator: "")
                 //                    }
                 //
                 //                    // City
                 //                    if let city = placeMark.addressDictionary!["City"] as? NSString {
                 //                        print(city, terminator: "")
                 //                    }
                 //
                 //                    // Zip code
                 //                    if let zip = placeMark.addressDictionary!["ZIP"] as? NSString {
                 //                        print(zip, terminator: "")
                 //                    }
                 //
                 //                    // Country
                 //                    if let country = placeMark.addressDictionary!["Country"] as? NSString {
                 //                        print(country, terminator: "")
                 //                    }
                 
                 let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                 longitude: location.coordinate.longitude)
                 
//                  Set the span (zoom) of the map view. Smaller number zooms in closer
              //   let span = MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)
                 
//                  Set the region, using your coordinates & span objects
               //  let region = MKCoordinateRegion(center: coordinate, span: span)
                 
//                  Set your map object's region to the region you just defined
              //   mapTableViewCell.userMapview.setRegion(region, animated: true)
                 
                 self.newRegTableview.reloadData()
                 }
                 
                 else{
                 
                 print("can't find address")
                 
                 }
                 
                 }
                 
                 })
                 
 
            }
            
//             let region = MKCoordinateRegionMakeWithDistance((userLocation.coordinate), 1000, 1000)
//                mapView.setRegion(region, animated: true)
                            
        }
    
    func getCurrentLocation(_ sender : UIButton){
        
        let indexPath : IndexPath = IndexPath(row: sender.tag, section: 0)
        
         if let mapTableViewCell : MapTableViewCell = newRegTableview.cellForRow(at: indexPath) as? MapTableViewCell {
            
             mapTableViewCell.userMapview.showsUserLocation = true
            
            
           /* let userlocation = userLocationCoordinate
            
           
            
            let region = MKCoordinateRegionMakeWithDistance((userlocation)!, 1000, 1000)
            
            mapTableViewCell.userMapview.setRegion(region, animated: true)
            
            
            let latitude   = userlocation?.latitude
            let longitude  = userlocation?.longitude
            
            userCurrentLatitude = "\(String(describing: latitude!))"
            
            userCurrentLongitude = "\(String(describing: longitude!))"
            
          //  lanLatStr = userCurrentLatitude.appending(userCurrentLongitude)
            
            lanLatStr = userCurrentLatitude + ", " + userCurrentLongitude
            
            let location = CLLocation(latitude:latitude!, longitude: longitude!)
            
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                
                if error != nil{
                    
                    print("faild")
                    return
                    
                    
                }
                
                if (placemarks?.count)! > 0{
                    
                    
                    //     let  pplacemark = placemarks?[0] as? CLPlacemark!
                    
                    // Place details
                    var placeMark: CLPlacemark!
                    placeMark = placemarks?[0]
                    
                    
                    
                    // Address dictionary
                    
                  self.userCurrentaddressDict = placeMark.addressDictionary! as NSDictionary
                    //     print(placeMark.addressDictionary, terminator: "")
                    
                    if let placemark = placemarks?[0] {
                        
                        // Create an empty string for street address
                        var streetAddress = ""
                        
                        // Check that values aren't nil, then add them to empty string
                        // "subThoroughfare" is building number, "thoroughfare" is street
                        if placemark.subThoroughfare != nil && placemark.thoroughfare != nil {
                            
                            streetAddress = placemark.subThoroughfare! + " " + placemark.thoroughfare!
                            
                        } else {
                            
                            print("Unable to find street address")
                            
                        }
                        
                        // Same as above, but for city
                        var city = ""
                        
                        // locality gives you the city name
                        if placemark.locality != nil  {
                            
                            city = placemark.locality!
                            
                        } else {
                            
                            print("Unable to find city")
                            
                        }
                        
                        // Do the same for state
                        var state = ""
                        
                        // administrativeArea gives you the state
                        if placemark.administrativeArea != nil  {
                            
                            state = placemark.administrativeArea!
                            
                        } else {
                            
                            print("Unable to find state")
                            
                        }
                        
                        // And finally the postal code (zip code)
                        var zip = ""
                        
                        if placemark.postalCode != nil {
                            
                            zip = placemark.postalCode!
                            
                        } else {
                            
                            print("Unable to find zip")
                            
                        }
                        
                        print("\(streetAddress)\n\(city), \(state) \(zip)")

                    
                    
                    // Location name
//                    if let locationName = placeMark.addressDictionary!["Name"] as? NSString {
//                        print(locationName, terminator: "")
//                    }
//                    
//                    // Street address
//                    if let street = placeMark.addressDictionary!["Thoroughfare"] as? NSString {
//                        print(street, terminator: "")
//                    }
//                    
//                    // City
//                    if let city = placeMark.addressDictionary!["City"] as? NSString {
//                        print(city, terminator: "")
//                    }
//                    
//                    // Zip code
//                    if let zip = placeMark.addressDictionary!["ZIP"] as? NSString {
//                        print(zip, terminator: "")
//                    }
//                    
//                    // Country
//                    if let country = placeMark.addressDictionary!["Country"] as? NSString {
//                        print(country, terminator: "")
//                    }
                    
                    let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                            longitude: location.coordinate.longitude)
                    
                    // Set the span (zoom) of the map view. Smaller number zooms in closer
                    let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
                    
                    // Set the region, using your coordinates & span objects
                    let region = MKCoordinateRegion(center: coordinate, span: span)
                    
                    // Set your map object's region to the region you just defined
                    mapTableViewCell.userMapview.setRegion(region, animated: true)
                    
                    self.newRegTableview.reloadData()
                }
                    
                else{
                    
                    print("can't find address")
                    
                }
                
                }
                
            })
            
            */
        }
        
        

    }

    

    
 
    
////////////// Pickerview  /////////////
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerData.count
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[row]
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if activeTextField.tag == 0{
        
        selectedGenderStr = pickerData[row]
        activeTextField.text = selectedGenderStr
            
        }
        
        if activeTextField.tag == 2{
        
        selectedBusinessStr = pickerData[row]
        activeTextField.text = selectedBusinessStr
            
        }
        
       else if activeTextField.tag == 9{
        
        selectedProvinceStr = pickerData[row]
        activeTextField.text = selectedProvinceStr
            
        }
        
      //  self.newRegTableview.endEditing(true)
        
    //    newRegPicker.isHidden = false
        
      //  newRegTableview.reloadData()
        
        
    }
    
    

    
    func nextBtnClicked(){
        
//        _ keyValue : Any, keyName : String
        
  //  paramsDict.updateValue(keyValue, forKey: keyName)
        
        var validateSuccess = true
        newRegTableview.endEditing(true)

        for row in 0 ..< newRegTableview.numberOfRows(inSection: 0)
        {
        
        let indexPath : IndexPath = IndexPath(row: row, section: 0)

        newRegTableview.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: false)

        
        if let newRegTableViewCell : NewRegTableViewCell = newRegTableview.cellForRow(at: indexPath) as? NewRegTableViewCell {
        

//            if (newRegTableViewCell.detailsTextField.text == ""){
//                
//                Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Warning", messege: "Please enter all fields", clickAction: {
//                    
//                    
//                    
//                    
//                })
//                validateSuccess = false
//                return
//                
//            }
            

       
    }
     
        
    }
        
        
        if(validateSuccess == true){
            
            
            let BankDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "BankDetailsVC") as! BankDetailsViewController
            
            let null = NSNull()
            
            let agentInformationDict = [
                "UserName": "8121969308",
                "Password": "Amith@123",
                "MobileNumber": "8121969308",
                "Email": "abc@abc",
                "AgentPersonalInfo": [
                    "AgentBusinessCategoryId": 14,
                    "AgentRequestId": 39,
                    "Id": 0,
                    "AspNetUserId": "test",
                    "TitleTypeId": 17,
                    "FirstName": "amith",
                    "MiddleName": "sai",
                    "LastName": "jonnakuti",
                    "Phone": "8121969202",
                    "Email": "amith@gmail.com",
                    "GenderTypeId": 20,
                    "DOB": "2017-10-30T17:15:42.569Z",
                    "Address1": "ral",
                    "Address2": "ral",
                    "Landmark": "ral",
                    "VillageId": 1,
                    "ParentAspNetUserId": null,
                    "IsActive": true,
                    "CreatedBy": "c3a9f1cd-8530-4510-9a1d-555e10108d92",
                    "Created": "2017-10-30T17:15:42.569Z",
                    "ModifiedBy": "c3a9f1cd-8530-4510-9a1d-555e10108d92",
                    "Modified": "2017-10-30T17:15:42.569Z"
                ],
                "AgentBankInfo": [
                    "AgentId": null,
                    "BankId": 1,
                    "AccountHolderName": "amith",
                    "AccountNumber": "123456",
                    "Id": 0,
                    "IsActive": true,
                    "CreatedBy": "c3a9f1cd-8530-4510-9a1d-555e10108d92",
                    "ModifiedBy": "c3a9f1cd-8530-4510-9a1d-555e10108d92",
                    "Created": "2017-10-30T17:15:42.569Z",
                    "Modified": "2017-10-30T17:15:42.569Z"
                ],
                "AgentIdProofs": [
                    [
                        "AgentId": null,
                        "IdProofTypeId": 24,
                        "IdProofNumber": "123456",
                        "Id": 0,
                        "IsActive": true,
                        "CreatedBy": "c3a9f1cd-8530-4510-9a1d-555e10108d92",
                        "ModifiedBy": "c3a9f1cd-8530-4510-9a1d-555e10108d92",
                        "Created": "2017-10-30T17:15:42.569Z",
                        "Modified": "2017-10-30T17:15:42.569Z"
                    ]
                ],
                "AgentDocs": null
                ] as [String:Any]
            
            
            
            /*     let agentInformationDict = ["UserName" : "8121969308",
             "Password" : "Amith@123",
             "MobileNumber": "8121969308",
             "Email": "abc@abc",
             
             "AgentPersonalInfo": [
             "AgentBusinessCategoryId": 14,
             "AgentRequestId": 39,
             "Id": 0,
             "AspNetUserId": "test",
             "TitleTypeId": 17,
             "FirstName": "amith",
             "MiddleName": "sai",
             "LastName": "jonnakuti",
             "Phone": "8121969202",
             "Email": "amith@gmail.com",
             "GenderTypeId": 20,
             "DOB": "2017-10-30T17:15:42.569Z",
             "Address1": "ral",
             "Address2": "ral",
             "Landmark": "ral",
             "VillageId": 1,
             "ParentAspNetUserId": null,
             "IsActive": true,
             "CreatedBy": "c3a9f1cd-8530-4510-9a1d-555e10108d92",
             "Created": "2017-10-30T17:15:42.569Z",
             "ModifiedBy": "c3a9f1cd-8530-4510-9a1d-555e10108d92",
             "Modified": "2017-10-30T17:15:42.569Z"  ]] as [String : Any]
             
             */
            
            
            print("agentPersonalInformationDict:\(agentInformationDict)")
            
            
            BankDetailsVC.paramsDict = agentInformationDict
            
            self.navigationController?.pushViewController(BankDetailsVC, animated: true)
            
            
            
        }
    
    }
    
    
    @IBAction func backClicked(_ sender: Any) {
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
}
