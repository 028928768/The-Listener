//
//  SearchViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 3/3/2562 BE.
//  Copyright © 2562 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate  {
    //MARK: Outlets
    
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var songArray = ["7 rings","Girls Like You","Never Be the Same","Paris in the rain","If I Can't Have You","ME!","Love Story","RED","End Game","I Knew You Were Trouble","Yeowooya","Shiny Boy","Counting Stars at Night","The Way To Me","Creep","House Of The Rising Sun"]
//var songArray = ["A","B","C","Abstract","Barbie","Cat"]
    var filterData = [String]()
    var isSearching = false
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.delegate = self
        searchBar.delegate = self
        assignBackGround()
        
        
        searchBar.returnKeyType = UIReturnKeyType.done
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: Search Functions
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            
            view.endEditing(true)
            searchTableView.reloadData()
        } else {
            isSearching = true
            
            filterData = songArray.filter({$0 == searchBar.text})
            searchTableView.reloadData()
        }
    }
    //MARK: Actions
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: TableviewDelegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filterData.count
        }
        return songArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellIdentifier = "searchcell"
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? searchTableViewCell else {
//            fatalError("The dequeed cell is not an instance of PlayListTableViewCell")
//        }
        if let cell = searchTableView.dequeueReusableCell(withIdentifier: "searchcell", for: indexPath) as? searchTableViewCell {
        
        var text: String!
        
        if isSearching {
            text = filterData[indexPath.row]
        } else {
            text = songArray[indexPath.row]
        }
        
            cell.songNameLabel.text = text
    
        
       // cell.songNameLabel.text = songArray[indexPath.row]
        return cell
        } else {
            return UITableViewCell()
        }
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
