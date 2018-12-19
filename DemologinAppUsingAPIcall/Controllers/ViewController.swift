//
//  ViewController.swift
//  DemologinAppUsingAPIcall
//
//  Created by macbook on 17/12/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField : UITextField!
    @IBOutlet weak var passwordTextField : UITextField!
    @IBOutlet weak var ForgetPasswordLabel : UILabel!
    
    let account = Account()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func signInButton(_sender:UIButton)
    {
        doClientLogin() 
    }

    func doClientLogin()
    {
        APIManager.sharedInstance.performClientLogin(with: userNameTextField.text!, password: passwordTextField.text!) { (req, responce, error) in
            DispatchQueue.main.async {
                if let error = error
                {
                    print(error.localizedDescription)
                }
                else
                {
                    if responce["status"].boolValue == true
                    {
                        let data = responce["data"].dictionaryValue
                        
                        self.account.client_name = data["client_name"]!.description
                        self.account.client_logo = data["client_logo"]!.description
                        self.account.client_email = data["client_email"]!.description
                        self.account.client_status = data["client_status"]!.description
                        self.account.client_entity_id = data["client_entity_id"]!.description
                        self.account.client_encrypt_id = data["client_encrypt_id"]!.description
                        self.account.client_bottom_banner = data["client_bottom_banner"]!.description
                        self.account.client_manage_events = data["client_manage_events"]!.description
                        self.account.client_manage_scenes = data["client_manage_scenes"]!.description
                        self.account.client_change_brand_logo = data["client_change_brand_logo"]!.description
                        self.account.client_hide_admin_branding = data["client_hide_admin_branding"]!.description
                        self.account.client_terms_and_privacy_policy = data["client_terms_and_privacy_policy"]!.description
            
                        print(self.account.client_email as Any)
                        print(self.account.client_terms_and_privacy_policy as Any)
                    }
                }
            }
        }
    }
}

