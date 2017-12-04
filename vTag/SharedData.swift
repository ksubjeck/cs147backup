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
}



