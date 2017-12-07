//
//  FriendsTableViewController.swift
//  vTag
//
//  Created by Keaton Subjeck on 12/5/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    //MARK: Properties
    
    var friends = SharedData.sharedDataInstance.friends;

    @IBAction func backToExplore(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FriendsTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FriendsTableViewCell else {
            fatalError("The dequeued cell is not an instance of FriendsTableViewCell.")
        }
        
        //Fetches the appropriate friend for the data source layout
        let friend = friends[indexPath.row]
        cell.nameLabel.text = friend.name
        cell.photoImageView.image = friend.photo
        cell.photoImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        cell.photoImageView.contentMode = UIViewContentMode.scaleAspectFit
        cell.photoImageView.clipsToBounds = true
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "SendToFriend"){
            let popupViewController = segue.destination as? SendTagInformationViewController
            let cell = sender as? FriendsTableViewCell
            let recipient = (cell?.nameLabel.text!)!
            popupViewController?.recipient = recipient
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
}
