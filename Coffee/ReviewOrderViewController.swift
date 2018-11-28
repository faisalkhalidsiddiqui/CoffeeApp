//
//  ReviewOrderTableViewController.swift
//  Coffee
//
//  Created by faisal khalid on 10/19/17.
//  Copyright © 2017 Sharjah Cooperative Society. All rights reserved.
//

import UIKit

class ReviewOrderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Cart.shared.beverages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell  = tableView.dequeueReusableCell(withIdentifier: "reviewcell", for: indexPath) as! ReviewOrderTableViewCell
        let row = indexPath.section
        cell.sugar.text = "\(Cart.shared.beverages[row].sugar)"
        cell.quantity.text = "\(Cart.shared.beverages[row].quantity)"
        cell.title.text = "\(Cart.shared.beverages[row].title)"
cell.icon.image = Cart.shared.beverages[row].beverage.reviewIcon
        cell.deleteButton.tag = row
        
        cell.selectionStyle = .none
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.layer.shadowRadius = 1
        
   
        return cell
    }
    
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    
    @IBAction func onDeleteButtonPressed(_ sender: UIButton) {
        
        
        
        var row = sender.tag
        Cart.shared.beverages.remove(at: row)
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
    
    @IBAction func placeOrder(_ sender: UIButton) {
        if Cart.shared.beverages.count < 1 {
            
            var alert = UIAlertController(title: "Cart Empty", message: "You have not added any drinks yet!", preferredStyle: .alert)
            var ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(ok)
            DispatchQueue.main.async {
                self.present(alert, animated: false, completion: nil)
            }
            
            return
        }
        
        Networking.shared.makeOrder { errors in
            
            if errors == nil {
                Cart.shared.beverages = []

                DispatchQueue.main.async {
                 
                    let controller = self.storyboard?.instantiateViewController(withIdentifier: "dialog")
                    self.present(controller!, animated: false, completion: { _ in })

                 
                }
                
                
            }
            else {
                let alert = UIAlertController(title: "Failure", message: "Failed to place Order!", preferredStyle: .alert)
                let ok = UIAlertAction(title: "ok", style: .cancel, handler: nil)
                alert.addAction(ok)
                DispatchQueue.main.async {
                    self.present(alert, animated: false, completion: nil)
                }
            }
            
        }
    }

    
}
