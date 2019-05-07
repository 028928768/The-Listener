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
     var HomePlayList = [Home]()
     // Home-playlist
     var pop_PlayList = [Song]()
     var me_PlayList =  [Song]()
     var guitar_PlayList = [Song]()
     var korean_PlayList = [Song]()
     var jazz_PlayList = [Song]()
     var country_PlayList = [Song]()
     var reputation_PlayList = [Song]()
     var thai_PlayList = [Song]()
    
    @IBOutlet weak var sideMenuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPlayLists()
        setNavigationBarTransparents()
        //set navigation bar
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.blackTranslucent
        nav?.tintColor = UIColor.white
        
       //sidemenu target
        sideMenuButton.target = self.revealViewController()
        sideMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
      //Gesture Pan
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
    

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
        return HomePlayList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "playListCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HomeTableViewCell else {
            fatalError("The dequeued cell is not an instance of HomeTableViewCell")
        }

        let pop_playlist = HomePlayList[indexPath.row]
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier {
        case "selectPlayListSegue":
            let playListVC: PlaylistViewController = segue.destination as! PlaylistViewController
            
            let selectedSongIndex = tableView.indexPathForSelectedRow!.row
            playListVC.selectedPlayList = HomePlayList[selectedSongIndex]
            playListVC.SongLists = HomePlayList[selectedSongIndex].songsInPlaylist
        case "searchSongs":
            print("Discovery!")
        default:
            break
        }
    }
    
    //Unwind Segue
    @IBAction func unwindToHome(sender: UIStoryboard){
        
    }
    
    //MARK: Private Method
    func loadPlayLists(){
        
        // Input songs into pop-playlists
        let song1Cover = UIImage(named: "7ringCoverIMG")
        let song2Cover = UIImage(named: "GirlCoverIMG")
        let song3Cover = UIImage(named: "neverCoverIMG")
        let song4Cover = UIImage(named: "parisCoverIMG")
        let song5Cover = UIImage(named: "IfCantCoverIMG")
        guard let song1 = Song(name: "7 rings",artist: "Ariana Grande",album: "Thanks U, Next",cover: song1Cover!) else {
            fatalError("Unable to instatiate song1")
        }
        guard let song2 = Song(name: "Girls Like You",artist: "Maroon 5 - Adam levine,ft Cardi B",album: "Red Pill Blues",cover: song2Cover!) else {
            fatalError("Unable to instatiate song2")
        }
        guard let song3 = Song(name: "Never Be the Same",artist: "Camila Cabello",album: "Camila",cover:song3Cover!) else {
            fatalError("Unable to instatiate song3")
        }
        guard let song4 = Song(name: "Paris in the Rain",artist: "Lauv",album: "Like Me Better",cover: song4Cover!) else {
            fatalError("Unable to instatiate song4")
        }
        guard let song5 = Song(name: "If I Can't Have You",artist: "Shawn Mendes",album:"Shawn Mendes",cover: song5Cover!) else {
            fatalError("Unable to instatiate song5")
        }
        pop_PlayList += [song1,song2,song3,song4,song5]
        
        //Input songs into taylor-playlists
        let meCover1 = UIImage(named: "7ringCoverIMG")
        let meCover2 = UIImage(named: "GirlCoverIMG")
        let meCover3 = UIImage(named: "neverCoverIMG")
        let meCover4 = UIImage(named: "parisCoverIMG")
        let meCover5 = UIImage(named: "IfCantCoverIMG")
        guard let me_song1 = Song(name: "7 rings",artist: "Ariana Grande",album: "Thanks U, Next",cover: meCover1!) else {
            fatalError("Unable to instatiate song1")
        }
        guard let me_song2 = Song(name: "Girls Like You",artist: "Maroon 5 - Adam levine,ft Cardi B",album: "Red Pill Blues",cover: meCover2!) else {
            fatalError("Unable to instatiate song2")
        }
        guard let me_song3 = Song(name: "Never Be the Same",artist: "Camila Cabello",album: "Camila",cover:meCover3!) else {
            fatalError("Unable to instatiate song3")
        }
        guard let me_song4 = Song(name: "Paris in the Rain",artist: "Lauv",album: "Like Me Better",cover: meCover4!) else {
            fatalError("Unable to instatiate song4")
        }
        guard let me_song5 = Song(name: "If I Can't Have You",artist: "Shawn Mendes",album:"Shawn Mendes",cover: meCover5!) else {
            fatalError("Unable to instatiate song5")
        }
        me_PlayList += [me_song1,me_song2,me_song3,me_song4,me_song5]
        
        //Input songs into GuitarPlaylist
        let guitarCover1 = UIImage(named: "7ringCoverIMG")
        let guitarCover2 = UIImage(named: "GirlCoverIMG")
        let guitarCover3 = UIImage(named: "neverCoverIMG")
        let guitarCover4 = UIImage(named: "parisCoverIMG")
        let guitarCover5 = UIImage(named: "IfCantCoverIMG")
        guard let guitar_song1 = Song(name: "7 rings",artist: "Ariana Grande",album: "Thanks U, Next",cover: guitarCover1!) else {
            fatalError("Unable to instatiate song1")
        }
        guard let guitar_song2 = Song(name: "Girls Like You",artist: "Maroon 5 - Adam levine,ft Cardi B",album: "Red Pill Blues",cover: guitarCover2!) else {
            fatalError("Unable to instatiate song2")
        }
        guard let guitar_song3 = Song(name: "Never Be the Same",artist: "Camila Cabello",album: "Camila",cover:guitarCover3!) else {
            fatalError("Unable to instatiate song3")
        }
        guard let guitar_song4 = Song(name: "Paris in the Rain",artist: "Lauv",album: "Like Me Better",cover: guitarCover4!) else {
            fatalError("Unable to instatiate song4")
        }
        guard let guitar_song5 = Song(name: "If I Can't Have You",artist: "Shawn Mendes",album:"Shawn Mendes",cover: guitarCover5!) else {
            fatalError("Unable to instatiate song5")
        }
        guitar_PlayList += [guitar_song1,guitar_song2,guitar_song3,guitar_song4,guitar_song5]
        
        //Input songs into KoreanOst PlayList
        let KoreanCover1 = UIImage(named: "7ringCoverIMG")
        let KoreanCover2 = UIImage(named: "GirlCoverIMG")
        let KoreanCover3 = UIImage(named: "neverCoverIMG")
        let KoreanCover4 = UIImage(named: "parisCoverIMG")
        let KoreanCover5 = UIImage(named: "IfCantCoverIMG")
        guard let korean_song1 = Song(name: "7 rings",artist: "Ariana Grande",album: "Thanks U, Next",cover: KoreanCover1!) else {
            fatalError("Unable to instatiate song1")
        }
        guard let korean_song2 = Song(name: "Girls Like You",artist: "Maroon 5 - Adam levine,ft Cardi B",album: "Red Pill Blues",cover: KoreanCover2!) else {
            fatalError("Unable to instatiate song2")
        }
        guard let korean_song3 = Song(name: "Never Be the Same",artist: "Camila Cabello",album: "Camila",cover:KoreanCover3!) else {
            fatalError("Unable to instatiate song3")
        }
        guard let korean_song4 = Song(name: "Paris in the Rain",artist: "Lauv",album: "Like Me Better",cover: KoreanCover4!) else {
            fatalError("Unable to instatiate song4")
        }
        guard let korean_song5 = Song(name: "If I Can't Have You",artist: "Shawn Mendes",album:"Shawn Mendes",cover: KoreanCover5!) else {
            fatalError("Unable to instatiate song5")
        }
        korean_PlayList += [korean_song1,korean_song2,korean_song3,korean_song4,korean_song5]
        
        //Input songs into Jazz PlayList
        let jazzCover = UIImage(named: "7ringCoverIMG")
    
        guard let jazz_song1 = Song(name: "7 rings",artist: "Ariana Grande",album: "Thanks U, Next",cover: jazzCover!) else {
            fatalError("Unable to instatiate song1")
        }
        guard let jazz_song2 = Song(name: "Girls Like You",artist: "Maroon 5 - Adam levine,ft Cardi B",album: "Red Pill Blues",cover: jazzCover!) else {
            fatalError("Unable to instatiate song2")
        }
        guard let jazz_song3 = Song(name: "Never Be the Same",artist: "Camila Cabello",album: "Camila",cover:jazzCover!) else {
            fatalError("Unable to instatiate song3")
        }
        guard let jazz_song4 = Song(name: "Paris in the Rain",artist: "Lauv",album: "Like Me Better",cover: jazzCover!) else {
            fatalError("Unable to instatiate song4")
        }
        guard let jazz_song5 = Song(name: "If I Can't Have You",artist: "Shawn Mendes",album:"Shawn Mendes",cover: jazzCover!) else {
            fatalError("Unable to instatiate song5")
        }
        jazz_PlayList += [jazz_song1,jazz_song2,jazz_song3,jazz_song4,jazz_song5]
        
        //Input songs into Country-Playlists
        let CountryCover1 = UIImage(named: "7ringCoverIMG")
        let CountryCover2 = UIImage(named: "GirlCoverIMG")
        let CountryCover3 = UIImage(named: "neverCoverIMG")
        let CountryCover4 = UIImage(named: "parisCoverIMG")
        let CountryCover5 = UIImage(named: "IfCantCoverIMG")
        guard let cover_song1 = Song(name: "7 rings",artist: "Ariana Grande",album: "Thanks U, Next",cover: CountryCover1!) else {
            fatalError("Unable to instatiate song1")
        }
        guard let cover_song2 = Song(name: "Girls Like You",artist: "Maroon 5 - Adam levine,ft Cardi B",album: "Red Pill Blues",cover: CountryCover2!) else {
            fatalError("Unable to instatiate song2")
        }
        guard let cover_song3 = Song(name: "Never Be the Same",artist: "Camila Cabello",album: "Camila",cover:CountryCover3!) else {
            fatalError("Unable to instatiate song3")
        }
        guard let cover_song4 = Song(name: "Paris in the Rain",artist: "Lauv",album: "Like Me Better",cover: CountryCover4!) else {
            fatalError("Unable to instatiate song4")
        }
        guard let cover_song5 = Song(name: "If I Can't Have You",artist: "Shawn Mendes",album:"Shawn Mendes",cover: CountryCover5!) else {
            fatalError("Unable to instatiate song5")
        }
        country_PlayList += [cover_song1,cover_song2,cover_song3,cover_song4,cover_song5]
        
        //Input songs into Reputation-PlayList
        let repCover1 = UIImage(named: "7ringCoverIMG")
        let repCover2 = UIImage(named: "GirlCoverIMG")
        let repCover3 = UIImage(named: "neverCoverIMG")
        let repCover4 = UIImage(named: "parisCoverIMG")
        let repCover5 = UIImage(named: "IfCantCoverIMG")
        guard let rep_song1 = Song(name: "7 rings",artist: "Ariana Grande",album: "Thanks U, Next",cover: repCover1!) else {
            fatalError("Unable to instatiate song1")
        }
        guard let rep_song2 = Song(name: "Girls Like You",artist: "Maroon 5 - Adam levine,ft Cardi B",album: "Red Pill Blues",cover: repCover2!) else {
            fatalError("Unable to instatiate song2")
        }
        guard let rep_song3 = Song(name: "Never Be the Same",artist: "Camila Cabello",album: "Camila",cover:repCover3!) else {
            fatalError("Unable to instatiate song3")
        }
        guard let rep_song4 = Song(name: "Paris in the Rain",artist: "Lauv",album: "Like Me Better",cover: repCover4!) else {
            fatalError("Unable to instatiate song4")
        }
        guard let rep_song5 = Song(name: "If I Can't Have You",artist: "Shawn Mendes",album:"Shawn Mendes",cover: repCover5!) else {
            fatalError("Unable to instatiate song5")
        }
        reputation_PlayList += [rep_song1,rep_song2,rep_song3,rep_song4,rep_song5]
        
        // input songs into Thai-pop Playlist
        let thaiCover1 = UIImage(named: "7ringCoverIMG")
        let thaiCover2 = UIImage(named: "GirlCoverIMG")
        let thaiCover3 = UIImage(named: "neverCoverIMG")
        let thaiCover4 = UIImage(named: "parisCoverIMG")
        let thaiCover5 = UIImage(named: "IfCantCoverIMG")
        guard let thai_song1 = Song(name: "7 rings",artist: "Ariana Grande",album: "Thanks U, Next",cover: repCover1!) else {
            fatalError("Unable to instatiate song1")
        }
        guard let thai_song2 = Song(name: "Girls Like You",artist: "Maroon 5 - Adam levine,ft Cardi B",album: "Red Pill Blues",cover: repCover2!) else {
            fatalError("Unable to instatiate song2")
        }
        guard let thai_song3 = Song(name: "Never Be the Same",artist: "Camila Cabello",album: "Camila",cover:repCover3!) else {
            fatalError("Unable to instatiate song3")
        }
        guard let thai_song4 = Song(name: "Paris in the Rain",artist: "Lauv",album: "Like Me Better",cover: repCover4!) else {
            fatalError("Unable to instatiate song4")
        }
        guard let thai_song5 = Song(name: "If I Can't Have You",artist: "Shawn Mendes",album:"Shawn Mendes",cover: repCover5!) else {
            fatalError("Unable to instatiate song5")
        }
        thai_PlayList += [thai_song1,thai_song2,thai_song3,thai_song4,thai_song5]
        
        //Assign Icon UIImages
        let playListIcon = UIImage(named: "play-buttonIMG")
        let playList1_cover = UIImage(named: "PopCoverIMG")
        let playList2_cover = UIImage(named: "MeIMG")
        let playList3_cover = UIImage(named: "GuitarIMG")
        let playList4_cover = UIImage(named: "OriginalIMG")
        let playList5_cover = UIImage(named: "JazzIMG")
        let playList6_cover = UIImage(named: "CountryIMG")
        let playList7_cover = UIImage(named: "ReputationIMG")
        let playList8_cover = UIImage(named: "ThaipopIMG")
       // let playList2Cover = UIImage(named: "FirstTime-Cover")
        
        guard let playList1 = Home(playListName: "Pop Musics", playListCover: playList1_cover, playListDiscription: "pop big hits music compilations", playListIcon: playListIcon, songsInPlaylist: pop_PlayList) else {
            fatalError("Playlist 1 error!!")
        }
        
        guard let playList2 = Home(playListName: "Lover", playListCover: playList2_cover, playListDiscription: "Taylor Swift - latest album is out!", playListIcon: playListIcon, songsInPlaylist: me_PlayList) else {
            fatalError("Playlist 2 error!!")
        }
        guard let playList3 = Home(playListName: "Peaceful Guitar", playListCover: playList3_cover, playListDiscription: "Study and Relax Guitar Instrument", playListIcon: playListIcon, songsInPlaylist: guitar_PlayList) else {
            fatalError("Playlist 3 error!!")
        }
        guard let playList4 = Home(playListName: "Original Soundtrack", playListCover: playList4_cover, playListDiscription: "Korean drama ost - The Liar and his lovers", playListIcon: playListIcon, songsInPlaylist: korean_PlayList) else {
            fatalError("Playlist 4 error!!")
        }
        guard let playList5 = Home(playListName: "Jazz Latenight", playListCover: playList5_cover, playListDiscription: "Enjoy listening jazz music", playListIcon: playListIcon, songsInPlaylist: jazz_PlayList) else {
            fatalError("Playlist 5 error!!")
        }
        guard let playList6 = Home(playListName: "Country Songs", playListCover: playList6_cover, playListDiscription: "Listen to peaceful and relaxing country musics", playListIcon: playListIcon, songsInPlaylist: country_PlayList) else {
            fatalError("Playlist 6 error!!")
        }
        guard let playList7 = Home(playListName: "Reputation", playListCover: playList7_cover, playListDiscription: "Listen to taylor swift reputation release!", playListIcon: playListIcon, songsInPlaylist: reputation_PlayList) else {
            fatalError("Playlist 7 error!!")
        }
        guard let playList8 = Home(playListName: "Thai-Pops", playListCover: playList8_cover, playListDiscription: "Let's listen to top hit thai songs in 2019!", playListIcon: playListIcon, songsInPlaylist: thai_PlayList) else {
            fatalError("Playlist 7 error!!")
        }
        
        HomePlayList += [playList1,playList2,playList3,playList4,playList5,playList6,playList7,playList8]
        
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
    

    
    

}
