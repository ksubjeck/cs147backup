//
//  SharedData.swift
//  vTag
//
//  Created by Cole DePasquale on 11/30/17.
//  Copyright © 2017 VTag. All rights reserved.
//
import UIKit
import ARKit

class SharedData {
    static let sharedDataInstance = SharedData();
    var tags = [Tag](); //array of tags
    var friends = ["Mom", "BFF", "Tom Petty", "Burt Reynolds", "Kdog", "Cardi B", "Abraham Lincoln"];
    var friendRequests = ["Django", "Jennifer", "Morgan Freeman"];
    var sentTags = [Tag]();
    var nodes = [SCNNode: Tag]();
    
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
    
    func loadSentTags() {
        
        let photo1 = UIImage(named: "sentTag1");
        let photo2 = UIImage(named: "sentTag2");
        let photo3 = UIImage(named: "sentTag3");
        
        guard let firstSentTag = Tag(name: "Call BFF", photo: photo1, dateDue: "12-31-2017", creator: "Me", recipient: "BFF") else {
            fatalError("Unable to instantiate firstSentTag")
        }
        guard let secondSentTag = Tag(name: "Meet me at Starbucks", photo: photo2, dateDue: "01-07-2018", creator: "Me", recipient: "Abraham Lincoln") else {
            fatalError("Unable to instantiate firstSentTag")
        }
        guard let thirdSentTag = Tag(name: "The meatloaf!", photo: photo3, dateDue: "02-16-2018", creator: "Me", recipient: "Mom") else {
            fatalError("Unable to instantiate firstSentTag")
        }
        
        self.sentTags += [firstSentTag, secondSentTag, thirdSentTag]
    }
}



