//
//  HomeViewController.swift
//  Agent Payzan
//
//  Created by Nani Mac on 18/10/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



    @IBAction func requestsClicked(_ sender: Any) {
        
        let requestsVC = self.storyboard?.instantiateViewController(withIdentifier: "InProgressViewController") as! InProgressViewController
        
        let idd:String = "44"
        
        requestsVC.statusTypeIdd = idd
        
        self.navigationController?.pushViewController(requestsVC, animated: true)

    }
    
    
    @IBAction func newrequestsClicked(_ sender: Any) {
        
        let requestsVC = self.storyboard?.instantiateViewController(withIdentifier: "requestsVC") as! RequestsViewController
        
        let idd:String = "43,47,48"
        
        requestsVC.statusTypeIdd = idd
        
        self.navigationController?.pushViewController(requestsVC, animated: true)
        
//        let newAgentVC = self.storyboard?.instantiateViewController(withIdentifier: "newAgentVC") as? NewAgentRegistrationViewController
//        
//        newAgentVC.statusTypeIdd? = "44,48" as String
//        
//        self.navigationController?.pushViewController(newAgentVC!, animated: true)
        
        
    }
    
//    let newAgentVC = self.storyboard?.instantiateViewController(withIdentifier: "newAgentVC")
//    
//    
//    self.navigationController?.pushViewController(newAgentVC!, animated: true)

    @IBAction func newAgentAction(_ sender: Any) {
        
                let newAgentVC = self.storyboard?.instantiateViewController(withIdentifier: "newAgentVC") as? NewAgentRegistrationViewController
        
                self.navigationController?.pushViewController(newAgentVC!, animated: true)
        
    }
    
    @IBAction func aprrovedAction(_ sender: Any) {
        
        
                let newAgentVC = self.storyboard?.instantiateViewController(withIdentifier: "InProgressViewController") as! InProgressViewController
        
               let idd:String = "46"
        
                newAgentVC.statusTypeIdd = idd
        
                self.navigationController?.pushViewController(newAgentVC, animated: true)
        
    }

}
