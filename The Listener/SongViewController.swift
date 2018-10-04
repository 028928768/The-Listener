//
//  SongViewController.swift
//  The Listener
//
//  Created by Kantachat Puagkajee on 23/9/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class SongViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
        
        return cell
    }
  
        
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleSongs()
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
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "tabToPlay" {
        var secondVC: SongPlayerViewController = segue.destination as! SongPlayerViewController
        
        /*    guard let selectedSongCell = sender as? SongTableViewCell else {
                fatalError("Select song error!")
            } */
            
            let selectedSongRow = songTableView.indexPathForSelectedRow!.row


           secondVC.selectedSongName = songs[selectedSongRow].name
           secondVC.selectedSongArtist = songs[selectedSongRow].artist
            secondVC.selectedSongAlbum = songs[selectedSongRow].album
        }
        
    }
    
        
        private func loadSampleSongs(){
            guard let song1 = Song(name: "Problem",artist: "Ariana Grande",album: "My Everything") else {
                fatalError("Unable to instatiate song1")
            }
            guard let song2 = Song(name: "Dark Horse",artist: "Katy Perry",album: "Prism") else {
                fatalError("Unable to instatiate song2")
            }
            guard let song3 = Song(name: "First Time",artist: "Kygo,Ellie Goulding",album: "Stargazing") else {
                fatalError("Unable to instatiate song3")
            }
            guard let song4 = Song(name: "Havana",artist: "Camila Cabello;feat. Young Thug",album:"Camila") else {
                fatalError("Unable to instatiate song4")
            }
            songs += [song1,song2,song3,song4]
        }
}

extension ViewController: UITableViewDelegate {
    
    
}
