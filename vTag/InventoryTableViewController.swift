//
//  InventoryTableViewController.swift
//  vTag
//
//  Created by Austin-Caleb Flores on 11/29/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit
import os.log

class InventoryTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SharedData.sharedDataInstance.loadTags();
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        
        return SharedData.sharedDataInstance.tags.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "InventoryTableViewCell";
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? InventoryTableViewCell
        else {
            fatalError("The dequeued cell is not an instance of inventoryTableViewCell.")
        }
        
        
        let tag = SharedData.sharedDataInstance.tags[indexPath.row];
        
        cell.name.text = tag.name
        cell.DateLabel.text = tag.dateDue
        cell.PhotoImageView.image = tag.photo

        return cell
    }
 
    
    
    private func loadTags(){
        let photo1 = UIImage(named: "VTag Logo");
        guard let tag1 = Tag(name: "Get VTag Working", photo: photo1, dateDue: "Thursday, Nov 30") else {
            fatalError("Failed to instantiate tag1");
        }
        guard let tag2 = Tag(name: "Go to Practice", photo: photo1, dateDue: "Wednesday, Nov 29") else {
            fatalError("Failed to instantiate tag2");
        }
        guard let tag3 = Tag(name: "Eat Dinner", photo: photo1, dateDue: "Wednesday, Nov 29") else {
            fatalError("Failed to instantiate tag2");
        }
        SharedData.sharedDataInstance.tags += [tag1, tag2, tag3];
    }

    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    //Dismiss inventory and goes to explore page
    @IBAction func pressExploreButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil);
    }
    
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {

        case "Tag Information":
            
            guard let tagDetailViewController = segue.destination as? TagInformation else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedTagCell = sender as? InventoryTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedTagCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedTag = SharedData.sharedDataInstance.tags[indexPath.row]
            tagDetailViewController.tag = selectedTag
            
        default:
            os_log("Unidentified Segue", log: OSLog.default, type: .debug)
            
            
        }
    }
 

}
