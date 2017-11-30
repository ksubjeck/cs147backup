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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
