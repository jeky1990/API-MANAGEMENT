//
//  APIProtocol.swift
//  DemologinAppUsingAPIcall
//
//  Created by macbook on 17/12/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol APIProtocol {
    
    func performClientLogin(with email:String,password:String,completion: @escaping (_ request:URLRequest?,
        _ result:JSON,_ error: NSError?) -> ())
    
    func forgetPassword(with emial:String,completion:@escaping (URLRequest?, _ result:JSON, _ error: NSError?) -> ())
}
