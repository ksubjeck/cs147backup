//
//  Contact.swift
//  vTag
//
//  Created by Keaton Subjeck on 12/6/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import Foundation

class Contact {
    var name: String
    var accepted: Bool
    
    init?(name: String, accepted: Bool){
        if(name.isEmpty){
            return nil
        }
        self.name = name
        self.accepted = accepted
    }
}
