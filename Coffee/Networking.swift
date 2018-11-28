//
//  Networking.swift
//  Coffee
//
//  Created by faisal khalid on 10/17/17.
//  Copyright © 2017 Sharjah Cooperative Society. All rights reserved.
//

import Foundation

class Networking: NSObject {

    static let shared = Networking()
    
    let session = URLSession.shared
    let APIBasePath = "https://mobileapi.shjcoop.ae/MobileAppServices/Beverage/api/"
    
    
    func makeOrder(completionHandler:@escaping (_ error:Error?)->Void){
        
        let url = URL(string: "\(APIBasePath)order/")
    
        var request = NSMutableURLRequest(url: url!, cachePolicy:
            NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData,
                                          timeoutInterval: 30.0)
        
        let jsonHeader =  Order.generateJson()
        request.httpMethod = "POST"
        request.addValue(jsonHeader, forHTTPHeaderField: "data")
        let task = self.session.dataTask(with: request as URLRequest, completionHandler: {
            data, response, error in
            
            
            
            
            if let error = error {
                print(error.localizedDescription)
                completionHandler(error)
            }
            
            
            if let data = data {
                completionHandler(nil)
                
            }
            
        })
        
        task.resume()
        
        
        
        
        
        
    }
    

    
    func auth(username:String,password:String,completionHandler:@escaping (_ error:Error?)->Void){
        
        let url = URL(string: "\(APIBasePath)auth")
        
        var request = NSMutableURLRequest(url: url!, cachePolicy:
            NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData,
                                          timeoutInterval: 30.0)
        
        let jsonHeader =  "{\"username\":\"\(username)\",\"password\":\"\(password)\"}";

        request.httpMethod = "POST"
        request.addValue(jsonHeader, forHTTPHeaderField: "data")
        let task = self.session.dataTask(with: request as URLRequest, completionHandler: {
            data, response, error in
            
            
            
            
            if let error = error {
                print(error.localizedDescription)
                completionHandler(error)
            }
            
            
            if let data = data {
                
                
                
                do {
                    let string1 = String(data: data, encoding: String.Encoding.utf8) ?? "Data could not be printed"
                    print(string1)
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                    
                    
                    
                    
                    let result = (json["Result"] as! Bool)  == true
                    
                    if result {
                        
                        
                        User.shared.department = json["department"] as! String
                        User.shared.name = json["fullName"] as! String
                        User.shared.empID = json["ID"] as! String
                        
                      
                        completionHandler(nil)
                    }
                        
                    else {
                        let userInfo: [NSObject : AnyObject] =
                            [
                                NSLocalizedDescriptionKey as NSObject :  NSLocalizedString("Unauthorized", value: "Invalid username or password", comment: "") as AnyObject,
                                
                                ]
                        var error = NSError(domain: "Auth Error", code: 401, userInfo: userInfo)
                        completionHandler(error)
                    }
                    
                    
                }
                catch {
                    print("error parsing \(error)")
                    completionHandler(error)
                    
                    
                    
                }
                
            }
            
        })
        
        task.resume()
        
        
        
        
    }

    
    

}
