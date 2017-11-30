//
//  InventoryTableViewCell.swift
//  vTag
//
//  Created by Austin-Caleb Flores on 11/29/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class InventoryTableViewCell: UITableViewCell {




    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var PhotoImageView: UIImageView!
    @IBOutlet weak var DateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none;
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if(selected){
            self.backgroundColor = UIColor(red: 251.0/255.0, green: 163.0/255.0, blue: 58.0/255.0, alpha: 1)
        } else {
            self.backgroundColor = UIColor(named: "white");
        }
        
        // Configure the view for the selected state
    }

}
