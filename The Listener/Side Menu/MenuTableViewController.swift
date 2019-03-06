//
//  MenuTableViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 6/3/2562 BE.
//  Copyright © 2562 Kantachat Puagkajee. All rights reserved.
//

import UIKit
import FirebaseAuth

class MenuTableViewController: UITableViewController {
    //MARK: Properties
    var CommandArray = [String]()
    var SelectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //assignBackGround()
        CommandArray = ["Main","Profile","Discover","Storage","Scanner","Sign-out"]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CommandArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as UITableViewCell

        cell.textLabel?.text = CommandArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.white

        return cell
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectedIndex = indexPath.row
        switch SelectedIndex {
        case 0:
          // Main
          //  dismiss(animated: true, completion: nil)
          //  self.performSegue(withIdentifier: "menuCell", sender: self)
           #selector(SWRevealViewController.revealToggle(_:))
            
        case 1:
            //Profile
            dismiss(animated: true, completion: nil)
            self.performSegue(withIdentifier: "profileSegue", sender: self)
            
        case 2:
            //Search
            dismiss(animated: true, completion: nil)
            performSegue(withIdentifier: "discoverSegue", sender: self)
        case 3:
            //Storage
            dismiss(animated: true, completion: nil)
            performSegue(withIdentifier: "storageSegue", sender: self)
        case 4:
            //Scanner
            dismiss(animated: true, completion: nil)
            performSegue(withIdentifier: "scannerSegue", sender: self)
        case 5:
            //Sign-out
            dismiss(animated: true, completion: nil)
           // performSegue(withIdentifier: "signoutSegue", sender: self)
//            let SignoutAction = UIAlertAction(title: "Sign Out!", style: .destructive) { (SignoutAction) in
            var Alert: UIAlertView = UIAlertView(title: "Sign Out", message: "Sign out from The Listener", delegate: self, cancelButtonTitle: "OK")
                Alert.show()
                do {
                    try Auth.auth().signOut()
                    print("Signed Out")
                    self.performSegue(withIdentifier: "signoutSegue", sender: self)
                } catch let err {
                    print("Signout Error!")
                }
            
        default:
            print("no selected cell.")
        }
        
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
    
    //MARK: Graphics
    func assignBackGround(){
        let background = UIImage(named: "StorageBGIMG")
        var imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }

}
