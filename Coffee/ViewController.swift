//
//  ViewController.swift
//  Coffee
//
//  Created by faisal khalid on 10/12/17.
//  Copyright © 2017 Sharjah Cooperative Society. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    
    @IBOutlet weak var beverageCollectionView: UICollectionView!
    var beveragesList:[Beverage] = []
    @IBOutlet weak var beverageImage: UIImageView!
    @IBOutlet weak var beverageDescription: UILabel!
    var selectedBeverageIndex = 0;
    @IBOutlet weak var cartCircle: UIImageView!
    @IBOutlet weak var sugarLabel: UILabel!
    @IBOutlet weak var beverageTitle: UILabel!
    @IBOutlet weak var sugarStepper: UIStepper!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantityStepper: UIStepper!
    var cartCounter = 0;
    
    @IBAction func logout(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "credentials")
        
        var controller = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        
        
        DispatchQueue.main.async {
            self.present(controller, animated: false, completion: nil)
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        cartCounter = Cart.shared.count
        DispatchQueue.main.async {
            self.addToCartLabel.text = "\(self.cartCounter)"
            if self.cartCounter > 0 {
            self.addToCartLabel.isHidden = false
               self.cartCircle.isHidden = false
                
                
            }
            
            
            let indexpath = IndexPath(row: 0, section: 0)
            self.beverageCollectionView.selectItem(at: indexpath, animated: false, scrollPosition: .top)
            self.beverageTitle.text = self.beveragesList[0].title
            
            self.beverageImage.image = self.beveragesList[0].titleImage
            
            self.beverageDescription.text = self.beveragesList[0].titleDescription
            
            
      
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        generateBeveragesList()
        
        
        
  
 
    
       


        
    }

       func generateBeveragesList(){
 
        
        let anisTea = Beverage(reviewIcon: UIImage(named: "ReviewAnisTea")!, iconSelected: UIImage(named: "SelectedAnisTea")!, icon: UIImage(named: "AnisTea")!, titleImage: UIImage(named: "TitleAniseTea")!, titleDescription: "Anise Tea is made from a sweet and scented spice that can help you deal with so many problems related with the digestive system", type: .AnisTea)
        let arabicCoffee = Beverage(reviewIcon: UIImage(named: "ReviewArabicCoffee")!,iconSelected: UIImage(named: "SelectedArabicCoffee")!, icon: UIImage(named: "ArabicCoffee")!, titleImage: UIImage(named: "TitleArabicCoffee")!, titleDescription: "Black tea is a type of tea that is more oxidized than oolong, green and white teas. Black tea is generally stronger in flavor than the less oxidized teas", type: .ArabicCoffee)
        let blackCoffee = Beverage(reviewIcon: UIImage(named: "ReviewBlackCoffee")!,iconSelected: UIImage(named: "SelectedBlackCoffee")!, icon: UIImage(named: "BlackCoffee")!, titleImage: UIImage(named: "TitleBlackCoffee")!, titleDescription: "black Coffee made up of  teabag", type: .BlackCoffee)
        let blackTea = Beverage(reviewIcon: UIImage(named: "ReviewBlackTea")!,iconSelected: UIImage(named: "SelectedBlackTea")!, icon: UIImage(named: "BlackTea")!, titleImage: UIImage(named: "blackTea")!, titleDescription: "Black tea / Sulimani - Hot water, Teabag", type: .BlackTea)
        let cappuccinoCoffee = Beverage(reviewIcon: UIImage(named: "ReviewCappuccino")!,iconSelected: UIImage(named: "SelectedCappuccino")!, icon: UIImage(named: "Cappuccino")!, titleImage: UIImage(named: "TitleCappuccino")!, titleDescription: "Cappuccino Coffee made up of  nescafe cappuccino sachet", type: .CappuccinoCoffee)
        let chamomileTea = Beverage(reviewIcon: UIImage(named: "ReviewChamomile")!,iconSelected: UIImage(named: "SelectedChamomile")!, icon: UIImage(named: "Chamomile")!, titleImage: UIImage(named: "TitleChammomileTea")!, titleDescription: "Chamomile Tea  made up of  Chamomile sachet", type: .ChamomileTea)
        let greenTea = Beverage(reviewIcon: UIImage(named: "ReviewGreenTea")!,iconSelected: UIImage(named: "SelectedGreenTea")!, icon: UIImage(named: "GreenTea")!, titleImage: UIImage(named: "TitleGreenTea")!, titleDescription: "Green Tea made up of  Green Tea Bag", type: .GreenTea)
        let hibiscusTea = Beverage(reviewIcon: UIImage(named: "ReviewHibiscus")!,iconSelected: UIImage(named: "SelectedHibiscus")!, icon: UIImage(named: "Hibiscus")!, titleImage: UIImage(named: "TitleHibiscusTea")!, titleDescription: "Hibiscus Tea made up of  hibiscus tea bag", type: .HibiscusTea)
        let nescaffeeCoffee = Beverage(reviewIcon: UIImage(named: "ReviewNescafeCoffee")!,iconSelected: UIImage(named: "SelectedNescafeCoffee")!, icon: UIImage(named: "NescafeCoffee")!, titleImage: UIImage(named: "TitleNescafeCoffee")!, titleDescription: "Cofeee", type: .NescaffeeCoffee)
        let tea = Beverage(reviewIcon: UIImage(named: "ReviewTea")!,iconSelected: UIImage(named: "SelectedTea")!, icon: UIImage(named: "Tea")!, titleImage: UIImage(named: "TitleTea")!, titleDescription: "Tea made up of Tea bags ", type: .Tea)
        let thymeTea = Beverage(reviewIcon: UIImage(named: "ReviewThyme")!,iconSelected: UIImage(named: "SelectedThyme")!, icon: UIImage(named: "Thyme")!, titleImage: UIImage(named: "TitleThymeTea")!, titleDescription: "Thyme tea made up of  thyme tea sachet", type: .ThymeTea)
        let turkishTea = Beverage(reviewIcon: UIImage(named: "ReviewTurkish")!,iconSelected: UIImage(named: "SelectedTurkish")!, icon: UIImage(named: "Turkish")!, titleImage: UIImage(named: "TitleTurkishTea")!, titleDescription: "Turkish tea made up of  thyme tea sachet", type: .TurkishTea)
        
    
        
        
        
        
        
        
        
        
        

        
        beveragesList = [tea,greenTea,blackTea,hibiscusTea,thymeTea,chamomileTea,turkishTea,anisTea,nescaffeeCoffee,arabicCoffee,blackCoffee,cappuccinoCoffee]

    
    }

    @IBAction func onSugarStepperChanged(_ sender: UIStepper) {
        DispatchQueue.main.async {
            print(sender.value)
            self.sugarLabel.text =  "\(sender.value)"

        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var addToCartLabel: UILabel!
    @IBAction func addToCard(_ sender: Any) {
      
        
    var beverageCart = BeverageCart(beverage: beveragesList[selectedBeverageIndex], beverageType: beveragesList[selectedBeverageIndex].type, sugar: Float(sugarStepper.value), quantity: Int(quantityStepper.value), notes: "")
        
    Cart.shared.beverages.append(beverageCart)
        
          cartCounter = cartCounter + 1;
        DispatchQueue.main.async {
            self.sugarStepper.value = 0.5;
               self.sugarLabel.text = "0.5"
            self.quantityLabel.text = "1.0"
            self.quantityStepper.value = 1
            self.addToCartLabel.isHidden = false;
               self.cartCircle.isHidden = false
            self.addToCartLabel.text = "\(self.cartCounter)"
            

        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beveragesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       var cell =   collectionView.dequeueReusableCell(withReuseIdentifier: "beveragecell", for: indexPath) as! BeverageCollectionViewCell
        cell.beverageName.text = beveragesList[indexPath.row].title
        cell.image.image = beveragesList[indexPath.row].icon
        cell.image.highlightedImage = beveragesList[indexPath.row].iconSelected
        
        cell.background.isHidden = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        var cell = collectionView.cellForItem(at: indexPath) as? BeverageCollectionViewCell

        DispatchQueue.main.async {
            cell?.background.isHidden = true

        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedBeverageIndex = indexPath.row
        var cell = collectionView.cellForItem(at: indexPath) as? BeverageCollectionViewCell

        DispatchQueue.main.async {
            cell?.background.isHidden = false
            
            self.beverageTitle.text = self.beveragesList[self.selectedBeverageIndex].title
            
            self.beverageImage.image = self.beveragesList[self.selectedBeverageIndex].titleImage
            
            self.beverageDescription.text = self.beveragesList[self.selectedBeverageIndex].titleDescription
        
            self.sugarLabel.text = "0.5"
            self.sugarStepper.value = 0.5
            
            self.quantityLabel.text = "1"
            self.quantityStepper.value = 1
        }
    }
    
    
    @IBAction func onQuanitityStepperChanged(_ sender: UIStepper) {
        
        DispatchQueue.main.async {
       
            self.quantityLabel.text =  "\(sender.value)"
            
        }
    }

}

