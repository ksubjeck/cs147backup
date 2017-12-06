//
//  Tag.swift
//  vTag
//
//  Created by Austin-Caleb Flores on 11/29/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class Tag {
    
    var name: String
    var photo: UIImage?
    var dateDue: String
    var dateMade: String
    var creator: String
    
    init?(name: String, photo: UIImage?, dateDue: String){
        if(name.isEmpty){
           self.name = "Untitled";
        } else {
            self.name = name;
        }
        self.photo = photo;
        self.dateDue = dateDue;
        self.dateMade = "Today" //Fix This later
        self.creator = "Me" //Fix this later
        
    }
}
