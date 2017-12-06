//
//  Friend.swift
//  vTag
//
//  Created by Keaton Subjeck on 12/5/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class Friend {
    
    var name: String
    var photo: UIImage?
    
    init?(name: String, photo: UIImage?){
        if(name.isEmpty){
            return nil
        }
        self.name = name
        self.photo = photo
    }
}
