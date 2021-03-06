//
//  SongViewController.swift
//  The Listener
//
//  Created by Kantachat Puagkajee on 23/9/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit
import AVFoundation

class SongViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: Properties
    let arrowButtonImage = UIImage(named: "arrow-buttonIMG")
    let notification = NotificationCenter.default
   // var otherAudioPlaying = AVAudioSession.sharedInstance().isOtherAudioPlaying
    
    
    @IBOutlet weak var songTableView: UITableView!
        var songs = [Song]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier = "SongTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SongTableViewCell else {
            fatalError("The dequeed cell is not an instance of SongTableViewCell")
        }
        
        //Fetches the appropriate song for the data source layout.
        let song = songs[indexPath.row]
        
        cell.songNameLabel.text = song.name
        cell.artistSongLabel.text = song.artist
        cell.albumSongLabel.text = song.album
        cell.arrowButton.image = arrowButtonImage
        return cell
    }
  
        
    override func viewDidLoad() {
        super.viewDidLoad()
        assignBackGround()
        loadSampleSongs()
        resignFirstResponder()
        
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.blackTranslucent
        nav?.tintColor = UIColor.white
        
        //Bar button
       // let searchImage = UIImage(named: "searchIMG")
        let DiscoverButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(PerformDiscoverySongSegue))
        //let DiscoverButtonItem = UIBarButtonItem(title: "Discover", style: .done, target: self, action: nil)
        
        self.navigationItem.rightBarButtonItem  = DiscoverButtonItem
        
    }
    
   
    
    @IBAction func backToMainButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getIndexPathFor(view: UIView, tableView: UITableView) -> IndexPath? {
        let point = tableView.convert(view.bounds.origin, from:view)
        let indexPath = tableView.indexPathForRow(at: point)
        return indexPath
    }
    
    //Play and Pause function
    
    // MARK: - Navigation
    @IBAction func sessionController(_ sender: UIButton) {
           notification.post(name: Notification.Name("StopMusic"), object: nil)
            print("music stopped")
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch segue.identifier {
        case "tabToPlay":
            let secondVC: SongPlayerViewController = segue.destination as! SongPlayerViewController
            
            let selectedSongIndex = songTableView.indexPathForSelectedRow!.row
            secondVC.currentSongIndex = selectedSongIndex
            //  secondVC.selectSongList = songs[songTableView.indexPathForSelectedRow!.row]
            //   secondVC.selectSongList = songs[selectedSongIndex]
            secondVC.SongLists = songs
        case "searchSongs":
            print("Discovery!")
        default:
            break
        }
        
//        if segue.identifier == "tabToPlay" {
//        let secondVC: SongPlayerViewController = segue.destination as! SongPlayerViewController
//
//            let selectedSongIndex = songTableView.indexPathForSelectedRow!.row
//            secondVC.currentSongIndex = selectedSongIndex
//          //  secondVC.selectSongList = songs[songTableView.indexPathForSelectedRow!.row]
//         //   secondVC.selectSongList = songs[selectedSongIndex]
//            secondVC.SongLists = songs
//
//    }
    
    }
        private func loadSampleSongs(){
            
            let song0Cover = UIImage(named: "Me-Cover")
            let song1Cover = UIImage(named: "Problem-Cover")
            let song2Cover = UIImage(named: "Prism-Cover")
            let song3Cover = UIImage(named: "FirstTime-Cover")
            let song4Cover = UIImage(named: "Havana-Cover")
            guard let song0 = Song(name: "ME!",artist: "Taylor Swift",album: "Lovers",cover: song0Cover!) else {
                fatalError("Unable to instatiate song0")
            }
            guard let song1 = Song(name: "Problem",artist: "Ariana Grande",album: "My Everything",cover: song1Cover!) else {
                fatalError("Unable to instatiate song1")
            }
            guard let song2 = Song(name: "Dark Horse",artist: "Katy Perry",album: "Prism",cover:song2Cover!) else {
                fatalError("Unable to instatiate song2")
            }
            guard let song3 = Song(name: "First Time",artist: "Kygo,Ellie Goulding",album: "Stargazing",cover: song3Cover!) else {
                fatalError("Unable to instatiate song3")
            }
            guard let song4 = Song(name: "Havana",artist: "Camila Cabello;feat. Young Thug",album:"Camila",cover: song4Cover!) else {
                fatalError("Unable to instatiate song4")
            }
            songs += [song0,song1,song2,song3,song4]
        }
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
    
    @objc func PerformDiscoverySongSegue(){
        self.performSegue(withIdentifier: "searchSongs", sender: self)
    }
}

extension ViewController: UITableViewDelegate {
    
    
}
