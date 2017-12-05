//
//  ExploreMenuWithPopup.swift
//  vTag
//
//  Created by Cole DePasquale on 12/4/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class ExploreMenuWithPopup: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func markCompleted(_ sender: Any) {
        for (index, Tag) in SharedData.sharedDataInstance.tags.enumerated() {
            if ("tagName" == SharedData.sharedDataInstance.tags[index].name) {
                SharedData.sharedDataInstance.tags.remove(at: index) //TODO FIX "tagname" to the inherited value from the explore interface as tag
                
                
            }
        }
        
        //need to inherit the tag from the Explore interface to obtain the actual tagName
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
