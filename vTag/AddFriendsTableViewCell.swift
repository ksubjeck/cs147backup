//
//  AddFriendsTableViewCell.swift
//  vTag
//
//  Created by Keaton Subjeck on 12/6/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class AddFriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func addFriend(_ sender: UIButton) {
        print("kdog")
    }
}
