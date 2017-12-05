//
//  AddFriendsListViewController.swift
//  vTag
//
//  Created by Cole DePasquale on 12/4/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit
import os.log

class AddFriendsListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData();
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
        
        return SharedData.sharedDataInstance.friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "AddFriendTableViewCell";
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AddFriendTableViewCell
            else {
                fatalError("The dequeued cell is not an instance of AddFriendTableViewCell.")
        }
        
        
        let friend = SharedData.sharedDataInstance.friends[indexPath.row];
        
        //cell.name.text = friend;
        //return cell
    }
}
