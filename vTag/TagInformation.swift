//
//  TagInformation.swift
//  vTag
//
//  Created by Austin-Caleb Flores on 11/29/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class TagInformation: UIViewController {

    var tag : Tag
    var name: String
    var photo: UIImage?
    var dueDate: NSDate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        name.text = tag.name;
        photo = tag.photo;
        dueDate = t;
        
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
