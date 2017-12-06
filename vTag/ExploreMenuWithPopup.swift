//
//  ExploreMenuWithPopup.swift
//  vTag
//
//  Created by Cole DePasquale on 12/4/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class ExploreMenuWithPopup: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tagTitle: UITextField!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    //private instance variables
    var newTag = false;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tagTitle.delegate = self;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(newTag){
            leftButton.setTitle("More Info", for: .normal);
            leftButton.frame.size.width = 110;
            rightButton.setTitle("Set Tag", for: .normal);
            rightButton.frame.size.width = 110;
            rightButton.frame.origin = CGPoint(x: 120, y: 257)
                
        }
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    
    @IBAction func pressedX(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tagTitle.resignFirstResponder();
        return true;
    }
    
    /**
    * More Info to edit
    * Tag info to see more about it
    */
    @IBAction func leftButtonPress(_ sender: Any) {
        
    }
    
    
    /**
    * Pressed set tag or marked as completed
    */
    @IBAction func rightButtonPress(_ sender: Any) {
        if let navigation = presentingViewController as? UINavigationController {
            if let presenter = navigation.viewControllers.first as? ViewController{
                if(newTag){ // Creating a new Tag!
                    
                    presenter.placeObject();
                    let tag = Tag(name: tagTitle.text!, photo: #imageLiteral(resourceName: "VTag Logo"), dateDue: "")
                    SharedData.sharedDataInstance.tags.append(tag!);
                } else { //Deleting Tag!
                    
                    presenter.deletingObject();
                }
            }
        }
        dismiss(animated: true, completion: nil);
    }
    
    
    
//    @IBAction func markCompleted(_ sender: Any) {
//        for (index, Tag) in SharedData.sharedDataInstance.tags.enumerated() {
//            if ("tagName" == SharedData.sharedDataInstance.tags[index].name) {
//                SharedData.sharedDataInstance.tags.remove(at: index) //TODO FIX "tagname" to the inherited value from the explore interface as tag
//                
//                
//                
//            }
//        }
//        
//        //need to inherit the tag from the Explore interface to obtain the actual tagName
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
