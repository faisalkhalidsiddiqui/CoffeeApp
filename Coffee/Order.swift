//
//  Order.swift
//  Coffee
//
//  Created by faisal khalid on 10/17/17.
//  Copyright © 2017 Sharjah Cooperative Society. All rights reserved.
//

import Foundation
struct Order {
    
   static let shared = Order()
    var emplNo:String {
        get {
        return User.shared.empID
        }
    }
    
    
    var department:String {
    get {
    return User.shared.department
    }
    }
    
    
    func beverages()->[BeverageCart] {
  
        return Cart.shared.beverages
    }
    static func generateJson()->String {
        
        
        return "{\"emplNo\":\"\(Order.shared.emplNo)\",\"department\":\"\(Order.shared.department)\",\"name\":\"\(User.shared.name)\",\"beverages\":\(BeverageCart.getJsonArray(beverages: Cart.shared.beverages))}"
        
    }
}




