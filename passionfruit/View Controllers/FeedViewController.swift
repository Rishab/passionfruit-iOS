//
//  FeedViewController.swift
//  passionfruit
//
//  Created by Rishab Chawla on 4/8/19.
//  Copyright © 2019 Rishab Chawla. All rights reserved.
//

import UIKit

protocol UserDelegate {
    func didTapUserCell(user: User)
}

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let api = APIClient.sharedInstance
    var users = [User]()
    var userDelegate: UserDelegate?
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.backgroundColor = UIColor(named: "#F0F1F2")
        super.viewDidLoad()
        api.getUsers { (userData) in
            self.users = userData.users
            print("Count: \(userData.count)")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("This cell from the chat list was selected: \(users[indexPath.row].name)")
        //        popup.popupNameLabel.text = users[indexPath.row].name
        //        print(popup.popupView)
        let user = users[indexPath.row]
        print(user.name)
        userDelegate?.didTapUserCell(user: user)
        //popup.setupPopup(user: users[indexPath.row])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - Table view data source    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? FeedCell {
            //cell.textLabel?.text = users[indexPath.row].name
            cell.setupCell(user: users[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 202
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue prep")
        guard let popupViewController = segue.destination as? PopupViewController,
            let currentUser = tableView.indexPathForSelectedRow?.row
            else {
                return
            }
        popupViewController.user = users[currentUser]
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
