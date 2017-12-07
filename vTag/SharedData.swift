//
//  SharedData.swift
//  vTag
//
//  Created by Cole DePasquale on 11/30/17.
//  Copyright © 2017 VTag. All rights reserved.
//
import UIKit

class SharedData {
    static let sharedDataInstance = SharedData();
    var tags = [Tag](); //array of tags
    var friends = ["Mom", "BFF", "Tom Petty", "Burt Reynolds", "Kdog", "Cardi B", "Abraham Lincoln"];
    var friendRequests = ["Django", "Jennifer", "Morgan Freeman"];
    var sentTags = [Tag]();
    var contacts = [Contact]();
    
    func loadTags(){
        let photo1 = UIImage(named: "VTag Logo");
        guard let tag1 = Tag(name: "Get VTag Working", photo: photo1, dateDue: "Thursday, Nov 30") else {
            fatalError("Failed to instantiate tag1");
        }
        guard let tag2 = Tag(name: "Go to Practice", photo: photo1, dateDue: "Wednesday, Nov 29") else {
            fatalError("Failed to instantiate tag2");
        }
        guard let tag3 = Tag(name: "Eat Dinner", photo: photo1, dateDue: "Wednesday, Nov 29") else {
            fatalError("Failed to instantiate tag2");
        }
        self.tags += [tag1, tag2, tag3];
    }
    
    func loadContacts(){
        print("Loading these fucking contacts")
        guard let contact1 = Contact(name: "Elon Musk", accepted: false) else{
            fatalError("Failed to instantiate contact1");
        }
        guard let contact2 = Contact(name: "Jerry Cain", accepted: false) else{
            fatalError("Failed to instantiate contact2");
        }
        guard let contact3 = Contact(name: "James Landay", accepted: false) else{
            fatalError("Failed to instantiate contact3");
        }
        guard let contact4 = Contact(name: "Jeff Bezos", accepted: false) else{
            fatalError("Failed to instantiate contact4");
        }
        self.contacts += [contact1, contact2, contact3, contact4];
    }
}



