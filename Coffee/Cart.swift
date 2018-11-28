//
//  Cart.swift
//  Coffee
//
//  Created by faisal khalid on 10/17/17.
//  Copyright © 2017 Sharjah Cooperative Society. All rights reserved.
//

import Foundation

class Cart: NSObject {
    static let shared = Cart()
    var beverages:[BeverageCart] = []
    var count:Int {
        get {
        return beverages.count
        }
    }

    
}
