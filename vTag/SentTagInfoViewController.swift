//
//  SentTagInfoViewController.swift
//  vTag
//
//  Created by Cole DePasquale on 12/6/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class SentTagInfoViewController: UIViewController {
    @IBOutlet weak var SentTagName: UILabel!
    @IBOutlet weak var SentTagPhoto: UIImageView!
    @IBOutlet weak var SentTagRecipient: UILabel!
    @IBOutlet weak var SentTagDueDate: UILabel!
    
    var tag: Tag?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SentTagName.text = tag?.name;
        SentTagPhoto.image = tag?.photo;
        SentTagRecipient.text = tag?.recipient;
        SentTagDueDate.text = tag?.dateDue;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func Done(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
