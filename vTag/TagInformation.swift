//
//  TagInformation.swift
//  vTag
//
//  Created by Austin-Caleb Flores on 11/29/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class TagInformation: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var dueDate: UIDatePicker!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var takePhoto: UIButton!
    @IBOutlet weak var camerRollButton: UIButton!
    @IBOutlet weak var editAndSaveButton: UIBarButtonItem!
    
    @IBOutlet weak var markCompletedButton: UIButton!
    
    
    var tag: Tag?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //No interactions
        name.isUserInteractionEnabled = false;
        takePhoto.isEnabled = false;
        takePhoto.isHidden = true;
        camerRollButton.isEnabled = false;
        camerRollButton.isHidden = true;
        dueDate.isUserInteractionEnabled = false;
        
        
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        name.text = tag?.name;
        photo.image = tag?.photo;
        
        //dueDate = ;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func EditButtonPressed(_ sender: Any) {
        if(editAndSaveButton.title == "Edit"){
            editAndSaveButton.title = "Save";
            name.isUserInteractionEnabled = true;
            takePhoto.isEnabled = true;
            takePhoto.isHidden = false;
            camerRollButton.isEnabled = true;
            camerRollButton.isHidden = false;
            dueDate.isUserInteractionEnabled = true;
            markCompletedButton.isHidden = true;
            markCompletedButton.isEnabled = false;
            
            name.placeholder = name.text;
            name.text = "";
        } else {
            editAndSaveButton.title = "Edit";
            name.isUserInteractionEnabled = false;
            takePhoto.isEnabled = false;
            takePhoto.isHidden = true;
            camerRollButton.isEnabled = false;
            camerRollButton.isHidden = true;
            dueDate.isUserInteractionEnabled = false;
            markCompletedButton.isHidden = false;
            markCompletedButton.isEnabled = true;
            
            if(name.text == ""){
                name.text = name.placeholder;
            }
        }
        
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
