//
//  FriendsTableViewCell.swift
//  vTag
//
//  Created by Keaton Subjeck on 12/3/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none;
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        if(selected){
            self.backgroundColor = UIColor(red:251.0/255.0, green: 163.0/255.0, blue: 58.0/255.0, alpha: 1)
        } else {
            self.backgroundColor = UIColor(named: "white");
        }
    }
}
