//
//  AddFriendsTableViewController.swift
//  vTag
//
//  Created by Keaton Subjeck on 12/6/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class AddFriendsTableViewController: UITableViewController, AddFriendsTableViewCellDelegate {
    
    func didPressButton(_ sender: UIButton?, buttonLabel: UILabel, nameLabel: UILabel) {
        if let button = sender
        {
            button.setImage(UIImage(named: "sentRequest"), for: .normal)
            buttonLabel.text = "Request sent"
            for (index, contact) in SharedData.sharedDataInstance.contacts.enumerated() {
                if(contact.name == nameLabel.text){
                    SharedData.sharedDataInstance.contacts[index].accepted = true
                    break
                }
            }
        }
        else{
            print("what the fuck is going on")
        }
        
    }
    
    
    @IBOutlet weak var backButton: UIButton!
    var contacts = SharedData.sharedDataInstance.contacts

    override func viewDidLoad() {
        super.viewDidLoad()
//        loadRequests();

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "AddFriendsTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AddFriendsTableViewCell else {
            fatalError("The dequeued cell is not an instance of AddFriendsTableViewCell.")
        }

        let contact = SharedData.sharedDataInstance.contacts[indexPath.row]
        cell.nameLabel.text = contact.name
        if(!contact.accepted){
            cell.iconButton.setImage(UIImage(named: "addFriends"), for: .normal)
            cell.buttonLabel.text = "Add friend"
        }
        else {
            cell.iconButton.setImage(UIImage(named: "sentRequest"), for: .normal)
            cell.buttonLabel.text = "Request sent"
        }
        
        //Dealing with delegate shit
        cell.cellDelegate = self
        cell.tag = indexPath.row

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(contacts[indexPath.row])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
