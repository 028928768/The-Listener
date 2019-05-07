//
//  PlaylistViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 6/3/2562 BE.
//  Copyright © 2562 Kantachat Puagkajee. All rights reserved.
//

import UIKit
import AVFoundation

class PlaylistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    //MARK: Properties
    let notification = NotificationCenter.default
    @IBOutlet weak var playListCover: UIImageView!
    @IBOutlet weak var playListName: UILabel!
    @IBOutlet weak var playListDiscription: UILabel!
    let arrowButtonImage = UIImage(named: "arrow-buttonIMG")
    var SongLists : [Song] = []
    //button
    @IBOutlet weak var PlayListTableView: UITableView!
    
    
    var selectedPlayList : Home?
    
    //TableView Delegate and Protocol
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SongLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "tracksIdentifier"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PlayListTableViewCell else {
             fatalError("The dequeed cell is not an instance of PlayListTableViewCell")
        }
        //Fetches the appropriate song for the data source layout.
        let song = SongLists[indexPath.row]
        
        cell.trackName.text = song.name
        cell.trackArtist.text = song.artist
        cell.trackAlbum.text = song.album
        cell.trackArrow.image = arrowButtonImage
        return cell
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        playListCover.image = selectedPlayList?.playListCover
        playListName.text = selectedPlayList?.playListName
        playListDiscription.text = selectedPlayList?.playListDiscription
        //SongLists = selectedPlayList!.songsInPlaylist
    }
    
    //MARK: Actions
    
    @IBAction func playSession(_ sender: UIButton) {
      notification.post(name: Notification.Name("StopMusic"), object: nil)
    }
    
    
    

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch segue.identifier {
        case "playList_play":
            let secondVC: SongPlayerViewController = segue.destination as! SongPlayerViewController
            
            let selectedSongIndex = PlayListTableView.indexPathForSelectedRow!.row
            secondVC.currentSongIndex = selectedSongIndex
            //  secondVC.selectSongList = songs[songTableView.indexPathForSelectedRow!.row]
            //   secondVC.selectSongList = songs[selectedSongIndex]
            secondVC.SongLists = SongLists
        case "searchSongs":
            print("Discovery!")
        default:
            break
        }
    }
    
    

}

