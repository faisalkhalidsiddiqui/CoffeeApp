//
//  ReviewOrderTableViewCell.swift
//  Coffee
//
//  Created by faisal khalid on 10/19/17.
//  Copyright © 2017 Sharjah Cooperative Society. All rights reserved.
//

import UIKit

class ReviewOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var sugar: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

   
    
    
}
