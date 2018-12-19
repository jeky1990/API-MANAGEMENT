//
//  APIRouter.swift
//  DemologinAppUsingAPIcall
//
//  Created by macbook on 17/12/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public enum APIRouter : URLRequestConvertible {
    
    
    
    static let baseURLString  = "http://devstree.in/projects/vsnap-new/web-api/"
    
    case clientLogin(email: String,password:String)
    case forgetPassword(email:String)
    
    // HTTP METHOD APPLY
    private var htttpMethod : HTTPMethod
    {
        switch self {
            case .clientLogin,
                 .forgetPassword :
                    return .post
        }
    }
    
    // API ENDING PATH
    private var apiPath : String
    {
        switch self {
                case .clientLogin:
                    return "client/login"
                case .forgetPassword:
                    return "client/forgetpassword"
        }
    }
    
    // PARAMETERS APPLIED
    
    private var parameter : Dictionary<String,Any> {
        switch self {
        case .clientLogin(email: let email, password: let password):
            return["email":email,"password":password]
        case .forgetPassword(email: let email):
            return ["emial":email]
        }
    }
    //URL REQUEST
    public func asURLRequest() throws -> URLRequest {
        let parameters = self.parameter
        let url = try APIRouter.baseURLString.asURL()
        var request = URLRequest(url: url.appendingPathComponent(self.apiPath))
        request.httpMethod = self.htttpMethod.rawValue
        let boundary = generateBoundaryString()
        let contentType = "multipart/form-data; boundary=" + boundary
        request.setValue(contentType, forHTTPHeaderField: "content-Type")
        request.httpBody = createBody(withBoundary: boundary, parameters: parameters)
        return try request.asURLRequest()
    }
    
    public func generateBoundaryString() -> String {
        return "Boundary-" + NSUUID().uuidString
    }
    
    public func createBody(withBoundary boundary: String?, parameters: [String : Any]?) -> Data? {
        var httpBody = Data()
        
        // add params (all params are strings)
        
        for (key, Value) in parameters! {
            if let anEncoding = "--\(boundary ?? "")\r\n".data(using: String.Encoding.utf8) {
                httpBody.append(anEncoding)
            }
            if let anEncoding = "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: String.Encoding.utf8) {
                httpBody.append(anEncoding)
            }
            if let anEncoding = "\(Value)\r\n".data(using: String.Encoding.utf8) {
                httpBody.append(anEncoding)
            }
        }
        if let anEncoding = "--\(boundary ?? "")--\r\n".data(using: String.Encoding.utf8) {
            httpBody.append(anEncoding)
        }
        return httpBody
    }
    
    
}
