//
//  ExploreViewController.swift
//  vTag
//
//  Created by Austin-Caleb Flores on 11/28/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {

    @IBOutlet weak var tagName: UITextField!
    @IBOutlet weak var tagPhoto: UIImageView!
    @IBOutlet weak var tagDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        
        
        // Do any additional setup after loading the view.
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

    @IBAction func setTag(_ sender: Any) {
        let date = self.tagDate.date

        let formatter = DateFormatter();
        formatter.dateFormat = "MM-dd-yyy, HH:mm:ss";
        let myString = formatter.string(from: date);
        let yourDate = formatter.date(from: myString);
        formatter.dateFormat = "MM-dd-yyyy"; // again convert your date to string
        let myDate = formatter.string(from: yourDate!);
        
        if (tagName.text == "") {
           tagName.text = "Untitiled";
        }
        
        let currTag = Tag(name: tagName.text!, photo: UIImage(named: "VTag Logo"), dateDue: myDate);
        
        
        print (SharedData.sharedDataInstance.tags[0].name)
        print (SharedData.sharedDataInstance.tags[1].name)
        print (SharedData.sharedDataInstance.tags[2].name)
        SharedData.sharedDataInstance.tags.append(currTag!);
        print (SharedData.sharedDataInstance.tags[0].name)
        print (SharedData.sharedDataInstance.tags[1].name)
        print (SharedData.sharedDataInstance.tags[2].name)
        print (SharedData.sharedDataInstance.tags[3].name)
        
        
        self.navigationController?.popViewController(animated: true);
    }
}
