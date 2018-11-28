//
//  Beverage.swift
//  Coffee
//
//  Created by faisal khalid on 10/17/17.
//  Copyright © 2017 Sharjah Cooperative Society. All rights reserved.
//

import Foundation
import UIKit
enum BeverageType {
 
    case Tea,GreenTea,BlackTea,HibiscusTea,ThymeTea,ChamomileTea,TurkishTea,AnisTea,NescaffeeCoffee,ArabicCoffee,BlackCoffee,CappuccinoCoffee
}
struct Beverage {

    var reviewIcon:UIImage
    var iconSelected:UIImage
    var icon:UIImage
    var titleImage:UIImage
    var titleDescription:String
    var type:BeverageType
    
    var title:String  {
        get {
        
            switch type {
            case .AnisTea:
                return "Anis Tea"
            case .GreenTea:
                return "Green Tea"
            case .BlackTea:
                return "Black Tea"
            case .HibiscusTea:
                return "Hibiscus Tea"
            case .ThymeTea:
                return "Thyme Tea"
            case .ChamomileTea:
                return "Chamomile Tea"
            case .TurkishTea:
                return "Turkish Tea"
            case .NescaffeeCoffee:
                return "Nescaffee Coffee"
            case .ArabicCoffee:
                return "Arabic Coffee"
            case .BlackCoffee:
                return "Black Coffee"
            case .CappuccinoCoffee:
                return "Cappuccino Coffee"
            case .Tea:
                return "Tea"
                
        }
    }
        
    

}
}
struct BeverageCart{
    
    var beverage:Beverage
    var beverageType:BeverageType
    var sugar:Float
    var quantity:Int
    var notes:String
    var title:String  {
        get {
            
            switch beverageType {
            case .AnisTea:
                return "Anis Tea"
            case .GreenTea:
                return "Green Tea"
            case .BlackTea:
                return "Black Tea"
            case .HibiscusTea:
                return "Hibiscus Tea"
            case .ThymeTea:
                return "Thyme Tea"
            case .ChamomileTea:
                return "Chamomile Tea"
            case .TurkishTea:
                return "Turkish Tea"
            case .NescaffeeCoffee:
                return "Nescaffee Coffee"
            case .ArabicCoffee:
                return "Arabic Coffee"
            case .BlackCoffee:
                return "Black Coffee"
            case .CappuccinoCoffee:
                return "Cappuccino Coffee"
            case .Tea:
                return "Tea"
                
            }
        }}
        
    
    static func getJsonArray(beverages:[BeverageCart])->String  {
        
        
        var json = ""
        
        json.append("[")
    
        
        var body = ""
        for i in 0 ..< beverages.count {
            
            body.append("{\"orderLineNo\":\(i),\"beverage\":\"\(beverages[i].beverageType)\",\"sugar\":\"\(beverages[i].sugar)\",\"quantity\":\(beverages[i].quantity),\"notes\":\"\(beverages[i].notes)\"}")
            
            if i < beverages.count - 1 {
            
                body.append(",")
            
            }
            
        
        }
        
        json.append(body)
          json.append("]")
        
        return json
    }
  
}

