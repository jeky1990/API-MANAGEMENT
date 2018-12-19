//
//  APIManager.swift
//  DemologinAppUsingAPIcall
//
//  Created by macbook on 17/12/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


enum APIResonsekeys: String {
    
    case responseMessage = "Message"
    case authToken = "AuthToken"
}

class APIManager {
    
    static let errorDomain = "com.vsnap.error"
    
    var userEmail : String?
    var userPassword : String?
    
    public static let sharedInstance = APIManager()
    private init(){
        
    }
}

extension APIManager : APIProtocol {

    func performClientLogin(with email: String, password: String, completion: @escaping (URLRequest?, JSON, NSError?) -> ()) {
        
        let request = Alamofire.request(APIRouter.clientLogin(email: email, password: password))
        startRequest(request) { (req, data, error) in
            if let data = data
            {
                do{
                    
                    let json = try JSON.init(data: data)
                    if json["status"] == true
                    {
                        completion(req,json,nil)
                    }
                    else
                    {
                        let err = NSError.init(domain: "ServerErrorDomain", code: 9855, userInfo: [NSLocalizedDescriptionKey:json["message"].description])
                        completion(req,JSON.null,err)
                    }
                    
                }catch{
                    
                    let err = NSError.init(domain: "CustomErrorDomain", code: 9855, userInfo: [NSLocalizedDescriptionKey:"CustomerrorDoman"])
                    completion(req,JSON.null,err)
                }
            }
            else
            {
                completion(req,JSON.null,error)
            }
        }
    }
    
    func forgetPassword(with emial: String, completion: @escaping (URLRequest?, JSON, NSError?) -> ()) {
        let request = Alamofire.request(APIRouter.forgetPassword(email: emial))
        startRequest(request) { (req, data, error) in
            if let data = data
            {
                do{
                    let json = try JSON.init(data: data)
                    if json["status"].boolValue == true
                    {
                        completion(req,json,error)
                    }
                    else
                    {
                        let err = NSError.init(domain: "ServerErrorDomain", code: 9855, userInfo: [NSLocalizedDescriptionKey:json["message"].description])
                        completion(req,JSON.null,err)
                    }
                    
                }catch{
                    
                    let err = NSError.init(domain: "CustomErrorDomain", code: 9855, userInfo: [NSLocalizedDescriptionKey:"CustomerrorDoman"])
                    completion(req,JSON.null,err)
                }
            }
        }
    }
    
    func startRequest(_ dataRequest:DataRequest,completion:@escaping(URLRequest?,Data?,NSError?) -> ())
    {
        dataRequest.responseData { (responce) in
            if let error = responce.error
            {
                let err = NSError.init(domain: "ResponceErrordomain", code: 9855, userInfo: [NSLocalizedDescriptionKey:error.localizedDescription])
                completion(responce.request,nil,err)
            }
            else
            {
                if let data = responce.data
                {
                    do{
                        let json = try JSON.init(data: data)
                        if json["status"].boolValue == true
                        {
                            completion(responce.request,data,nil)
                        }
                        else
                        {
                            let err = NSError.init(domain: "ServerErrorDomain", code: 9855, userInfo: [NSLocalizedDescriptionKey:json["message"].description])
                            completion(responce.request,nil,err)
                        }
                        
                    }catch let jsonErr{
                        
                        print(jsonErr.localizedDescription)
                        let err = NSError.init(domain: "CustomErrorDomain", code: 9855, userInfo: [NSLocalizedDescriptionKey:"SomethingWrong"])
                        completion(responce.request,nil,err)
                    }
                }
                else
                {
                    let err = NSError.init(domain: "CustomErrorDomain", code: 9855, userInfo: [NSLocalizedDescriptionKey:"SomethingWrong"])
                    completion(responce.request,nil,err)
                }
            }
        }
    }
    
    
}

