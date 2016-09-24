//
//  ApiController.swift
//  Cashoop
//
//  Created by Isgi Arriza on 9/21/16.
//  Copyright © 2016 Isgi Arriza. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum KeyFields : String {
    case key = "key"
}

class ApiController {
    
    var manager : Alamofire.Manager
    let keys : NSDictionary?
    
    required init(){
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        manager = Alamofire.Manager(configuration : configuration)
        if let path = NSBundle.mainBundle().pathForResource("keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        } else{
            keys = nil
        }
    }
    
    func postLogin(completionHandler : (Result<JSON, NSError>) -> Void, usernm : String, password : String) {
        let key = keys?[KeyFields.key.rawValue] as? String
        
        if key == nil {
            let error = NSError(domain: "parseAPICall", code: 200, userInfo: [NSLocalizedDescriptionKey: "Could not load API keys from keys.plist"])
            completionHandler(.Failure(error))
            return
        }
        
   
        let param : [String : AnyObject] = [
            "email" : usernm,
            "password" : password
        ]
        
        let header : [String : String] = [
            "key" : key!
        ]
        
        manager.request(.POST, "http://cashoop.digitalagung.id/api/auth/login", parameters: param, encoding: .JSON, headers: header)
        .responseLoginArray { response in
            completionHandler(response.result)
        }
    }
}

extension Alamofire.Request {
    func responseLoginArray(completionHandler: (Response<JSON, NSError>) -> Void) -> Self {
        let serializer = ResponseSerializer<JSON, NSError> { request, response, data, error in
            guard let responseData = data else {
                let failureReason = "Array could not be serialized because input data was nil."
                let error = Error.errorWithCode(.DataSerializationFailed, failureReason: failureReason)
                return .Failure(error)
            }
            
            let JSONResponseSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
            let result = JSONResponseSerializer.serializeResponse(request, response, responseData, error)
            
            if result.isSuccess {
                if let value = result.value {
                    let json = SwiftyJSON.JSON(value)
                    return .Success(json)
                }
            }
            
            guard error == nil else {
                return .Failure(error!)
            }
            
            let error = Error.errorWithCode(.JSONSerializationFailed, failureReason: "JSON could not be converted to object")
            return .Failure(error)
        }
        return response(responseSerializer:serializer, completionHandler: completionHandler)
    }
}

