//
//  SearchViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 3/3/2562 BE.
//  Copyright © 2562 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    //MARK: Outlets
    
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var songArray = ["A","B","C","D","E","F","G","H"]
    override func viewDidLoad() {
        super.viewDidLoad()

        assignBackGround()
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    //MARK: Actions
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: TableviewDelegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "searchcell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? searchTableViewCell else {
            fatalError("The dequeed cell is not an instance of PlayListTableViewCell")
        }
        
        cell.songNameLabel.text = songArray[indexPath.row]
        return cell
    }
    
    func assignBackGround(){
        let background = UIImage(named: "StorageBGIMG")
        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }

}
