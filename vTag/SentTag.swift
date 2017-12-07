//
//  SentTag.swift
//  vTag
//
//  Created by Cole DePasquale on 12/6/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class SentTag {
    
    var name: String
    var photo: UIImage?
    var recipient: String? //I ADDED A ? HERE
    
    init?(name: String, photo: UIImage?, recipient: String){
        if(name.isEmpty){
            return nil
        }
        if(recipient.isEmpty){
            return nil
        }
        self.name = name
        self.photo = photo
        self.recipient = recipient
    }
}
