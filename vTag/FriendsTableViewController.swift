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
    
    var friends = [Friend]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleFriends()
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "SendToFriend"){
            print("kdog is here")
            let popupViewController = segue.destination as? SendTagInformationViewController
            let cell = sender as? FriendsTableViewCell
            let buttonText = "Send tag to " + (cell?.nameLabel.text!)!
            popupViewController?.buttonText = buttonText
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    
    
    // MARK: private methods
    private func loadSampleFriends(){
        let photo1 = UIImage(named: "friend1")
        let photo2 = UIImage(named: "friend2")
        let photo3 = UIImage(named: "friend3")
        
        guard let friend1 = Friend(name: "Keaton Subjeck", photo: photo1) else{
            fatalError("Unable to instantiate friend1")
        }
        
        guard let friend2 = Friend(name: "Cole Depo", photo: photo2) else {
            fatalError("Unable to instantiate friend2")
        }
        
        guard let friend3 = Friend(name: "Austin Flores", photo: photo3) else {
            fatalError("Unable to instantiate friend3")
        }
        friends += [friend1, friend2, friend3]
    }

}
