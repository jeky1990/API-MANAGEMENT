
//
//  Account.swift
//  DemologinAppUsingAPIcall
//
//  Created by macbook on 18/12/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import Foundation
import Alamofire

class Account : NSObject,NSCoding
{
    
    static let sharedInstance = Account()
    
    var client_email : String?
    var client_manage_scenes = ""
    var client_logo = ""
    var client_encrypt_id = ""
    var client_status = ""
    var client_terms_and_privacy_policy = ""
    var client_change_brand_logo = ""
    var client_hide_admin_branding = ""
    var client_entity_id = ""
    var client_name = ""
    var client_bottom_banner = ""
    var client_manage_events = ""
    
    required init?(coder aDecoder: NSCoder) {
        
        if let client_email = aDecoder.decodeObject(forKey: "client_email")
        {
            self.client_email = (client_email as! String)
        }
        if let client_manage_scenes = aDecoder.decodeObject(forKey: "client_manage_scenes")
        {
            self.client_manage_scenes = (client_manage_scenes as! String)
        }
        if let client_logo = aDecoder.decodeObject(forKey: "client_logo")
        {
            self.client_logo = (client_logo as! String)
        }
        if let client_encrypt_id = aDecoder.decodeObject(forKey: "client_encrypt_id")
        {
            self.client_encrypt_id = (client_encrypt_id as! String)
        }
        if let client_status = aDecoder.decodeObject(forKey: "client_staus")
        {
            self.client_status = (client_status as! String)
        }
        if let client_terms_and_privacy_policy = aDecoder.decodeObject(forKey: "client_terms_and_privacy_policy")
        {
            self.client_terms_and_privacy_policy = (client_terms_and_privacy_policy as! String)
        }
        if let client_change_brand_logo = aDecoder.decodeObject(forKey: "client_change_brand_logo")
        {
            self.client_change_brand_logo = (client_change_brand_logo as! String)
        }
        if let client_hide_admin_branding = aDecoder.decodeObject(forKey: "client_hide_admin_branding")
        {
            self.client_hide_admin_branding = (client_hide_admin_branding as! String)
        }
        if let client_entity_id = aDecoder.decodeObject(forKey: "client_entity_id")
        {
            self.client_entity_id  = (client_entity_id as! String)
        }
        if let client_name = aDecoder.decodeObject(forKey: "client_name")
        {
            self.client_name = (client_name as! String)
        }
        if let client_bottom_banner = aDecoder.decodeObject(forKey: "client_bottom_banner")
        {
            self.client_bottom_banner = (client_bottom_banner as! String)
        }
        if let client_manage_events = aDecoder.decodeObject(forKey: "client_manage_events")
        {
            self.client_manage_events = (client_manage_events as! String)
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(client_email, forKey: "client_email")
        aCoder.encode(client_manage_scenes, forKey: "client_manage_scenes")
        aCoder.encode(client_logo, forKey: "client_logo")
        aCoder.encode(client_encrypt_id, forKey: "client_encrypt_id")
        aCoder.encode(client_status, forKey: "client_status")
        aCoder.encode(client_terms_and_privacy_policy, forKey: "client_terms_and_privacy_policy")
        aCoder.encode(client_change_brand_logo, forKey: "client_change_brand_logo")
        aCoder.encode(client_hide_admin_branding, forKey: "client_hide_admin_branding")
        aCoder.encode(client_entity_id, forKey: "client_entity_id")
        aCoder.encode(client_name, forKey: "client_name")
        aCoder.encode(client_bottom_banner, forKey: "client_bottom_banner")
        aCoder.encode(client_manage_events, forKey: "client_manage_events")
    }
    
    override init() {
        super.init()
    }
    
}
