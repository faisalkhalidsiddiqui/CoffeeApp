//
//  ViewController.swift
//  DriverApp
//
//  Created by faisal khalid on 6/1/17.
//  Copyright © 2017 Sharjah Cooperative Society. All rights reserved.
//

import UIKit
import CoreLocation

extension UIViewController {
    
    func showErrorDialog(error:Error){
        
        
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alert.addAction(action)
        
        DispatchQueue.main.async {
            self.present(alert, animated: false, completion: nil)
        }
    }
}

class LoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var username: UITextField!
    
    @IBOutlet var password: UITextField!
    
    @IBOutlet weak var networkIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        print("current:\(currentVersion)")
        
        
        AppUpdater.isNewVersionAvailable(appName: "Drinks"){
            isAvailable in
            print("isNewVersionAvailable ")
            if let isAvailable = isAvailable {
                
                if isAvailable {
                    let alert = UIAlertController(title: "Update Available", message: "New Version Available.Please click on Update Now Button", preferredStyle: .alert)
                    let updateNow = UIAlertAction(title: "Update Now", style: .cancel, handler: {
                        action in
                        
                        let urlString = "itms-services://?action=download-manifest&url=https://mobileapi.shjcoop.ae/MobileAppFileServices/Store/IOS/Drinks/manifest.plist"
                        UIApplication.shared.openURL(URL(string: urlString)!)
                        
                        
                        
                    })
                    
                    
                    alert.addAction(updateNow)
                    DispatchQueue.main.async {
                        //   print("error")
                        self.present(alert, animated: false, completion: nil)
                    }
                    
                }
            }
        }
        
        
        
        
        
        
        let credentials = UserDefaults.standard.value(forKey: "credentials") as? [String:String]
        if let credentials = credentials {
            
            
            DispatchQueue.main.async {
                
                self.username.text = credentials["username"]
                self.password.text = credentials["password"]
                self.login(credentials)
            }
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 10 {
            
            login(textField)
            return true
        }
        else {
            return false
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func login(_ sender: Any) {
        DispatchQueue.main.async {
            
            self.networkIndicator.startAnimating()
        }
        Networking.shared.auth(username: username.text!  , password: password.text!){ error in
            print("username:\(self.username.text!) password:\(self.password.text!)")
            DispatchQueue.main.async {
                
                self.networkIndicator.stopAnimating()
            }
            if let error = error {
                
                print(error.localizedDescription)
                self.showErrorDialog(error: error)
            }
            else {
                
                
                let credentials = ["username":self.username.text!,"password":self.password.text!]
                
                UserDefaults.standard.set(credentials, forKey: "credentials")
                
                var controller = self.storyboard?.instantiateViewController(withIdentifier: "main") as! ViewController
                
                
                DispatchQueue.main.async {
                    self.present(controller, animated: false, completion: nil)
                }
                
                
            }
        }
        
    }
    
    
}

