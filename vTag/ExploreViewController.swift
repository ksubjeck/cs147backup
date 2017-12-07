//
//  ExploreViewController.swift
//  vTag
//
//  Created by Austin-Caleb Flores on 11/28/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tagName: UITextField!
    @IBOutlet weak var tagPhoto: UIImageView!
    @IBOutlet weak var tagDate: UIDatePicker!
    var tag: Tag?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.tagName.delegate = self;
        tagName.text = tag?.name;
        
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tagName.resignFirstResponder();
        return true;
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func setTag(_ sender: Any) {
        let date = self.tagDate.date

        let formatter = DateFormatter();
        formatter.dateFormat = "MM-dd-yyy, HH:mm:ss";
        let myString = formatter.string(from: date);
        let yourDate = formatter.date(from: myString);
        formatter.dateFormat = "MM-dd-yyyy"; // again convert your date to string
        let myDate = formatter.string(from: yourDate!);
        
        if (tagName.text == "") {
           tagName.text = "Untitled";
        }
        
        let currTag = Tag(name: tagName.text!, photo: UIImage(named: "VTag Logo"), dateDue: myDate);
        
        SharedData.sharedDataInstance.tags.append(currTag!);

        
        dismiss(animated: true, completion: nil);
        //self.navigationController?.popViewController(animated: true);
    }
}
