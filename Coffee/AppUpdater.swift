//
//  AppUpdater.swift
//  AppUpdater
//
//  Created by faisal khalid on 2/27/17.
//  Copyright © 2017 Sharjah Cooperative Society. All rights reserved.
//

import UIKit

class AppUpdater: NSObject {
    
    
    
    
    
    static func isNewVersionAvailable(appName:String, _ completionHandler: (_ isAvailable:Bool?)->Void) {
        
        
        let path = "https://mobileapi.shjcoop.ae/MobileAppFileServices/Store/IOS/\(appName)/manifest.plist"
        
        if let dic = NSMutableDictionary(contentsOf: URL(string:path)!) {
            let items = dic.object(forKey: "items") as! NSArray
            let metadata = (items[0] as! NSDictionary).object(forKey: "metadata") as! [String:String]
            let fileBundleID = metadata["bundle-identifier"]!
            let fileVersion = metadata["bundle-version"]!
            
            
            let currentBundleID = Bundle.main.bundleIdentifier!
            let currentVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
            print("current version is \(currentVersion) and file version is \(fileVersion)")
            
            if currentBundleID == fileBundleID {
                
                
                print(fileVersion)
                print(currentVersion)
                if currentVersion  < fileVersion {
                    print("<")
                    completionHandler(true)
                    
                }
                else {
                    print(">")
                    completionHandler(false)
                }
            }
            else {
                completionHandler(nil)
            }
            
        }
        else {
            completionHandler(nil)
        }
    }
    
    
    
}
