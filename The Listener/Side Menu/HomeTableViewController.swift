//
//  HomeTableViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 4/3/2562 BE.
//  Copyright © 2562 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    //MARK: Properties
     var PopPlaylist = [Home]()
    
    @IBOutlet weak var sideMenuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPlayLists()
        setNavigationBarTransparents()
        
       //sidemenu target
        sideMenuButton.target = self.revealViewController()
        sideMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
      //Gesture Pan
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        
    }
    
    //Top bar setting
    override func viewDidAppear(_ animated: Bool) {
        //1
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.blackTranslucent
        nav?.tintColor = UIColor.white

    }
    func setNavigationBarTransparents(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PopPlaylist.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "playListCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HomeTableViewCell else {
            fatalError("The dequeued cell is not an instance of HomeTableViewCell")
        }

        let pop_playlist = PopPlaylist[indexPath.row]
        //assign data to cell
        cell.playListCoverView.image = pop_playlist.playListCover
        cell.playListIconView.image = pop_playlist.playListIcon
        cell.playListName.text = pop_playlist.playListName
        cell.playListDescription.text = pop_playlist.playListDiscription

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Private Method
    func loadPlayLists(){
        //Assign Icon UIImages
        let playListIcon = UIImage(named: "play-buttonIMG")
        let playList1_cover = UIImage(named: "PopCoverIMG")
        let playList2_cover = UIImage(named: "ReputationIMG")
        let playList3_cover = UIImage(named: "GuitarIMG")
        let playList4_cover = UIImage(named: "OriginalIMG")
        let playList5_cover = UIImage(named: "JazzIMG")
        let playList6_cover = UIImage(named: "CountryIMG")
        let playList2Cover = UIImage(named: "FirstTime-Cover")
        
        guard let playList1 = Home(playListName: "Pop Musics", playListCover: playList1_cover, playListDiscription: "pop big hits music compilations", playListIcon: playListIcon) else {
            fatalError("Playlist 1 error!!")
        }
        
        guard let playList2 = Home(playListName: "Reputation", playListCover: playList2_cover, playListDiscription: "Taylor Swift - latest album is out!", playListIcon: playListIcon) else {
            fatalError("Playlist 2 error!!")
        }
        guard let playList3 = Home(playListName: "Peaceful Guitar", playListCover: playList3_cover, playListDiscription: "Study and Relax Guitar Instrument", playListIcon: playListIcon) else {
            fatalError("Playlist 3 error!!")
        }
        guard let playList4 = Home(playListName: "Original Soundtrack", playListCover: playList4_cover, playListDiscription: "Korean drama ost - The Liar and his lovers", playListIcon: playListIcon) else {
            fatalError("Playlist 4 error!!")
        }
        guard let playList5 = Home(playListName: "Jazz Latenight", playListCover: playList5_cover, playListDiscription: "Enjoy listening jazz music", playListIcon: playListIcon) else {
            fatalError("Playlist 5 error!!")
        }
        guard let playList6 = Home(playListName: "Country Songs", playListCover: playList6_cover, playListDiscription: "Listen to peaceful and relaxing country musics", playListIcon: playListIcon) else {
            fatalError("Playlist 6 error!!")
        }
        
        PopPlaylist += [playList1,playList2,playList3,playList4,playList5,playList6]
        
    }
    //MARK: Graphics
    func assignBackGround(){
        let background = UIImage(named: "homeWallpaperIMG")
        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
    
//    @objc func handleMenuToggle(){
//        print("Toggle Menu")
//    }
    
    //MARK: Side Menu
//    func configureNavigationBar(){
//        let menuIcon = UIImage(named: "menuIMG")
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuIcon?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
//    }
    
    

}
