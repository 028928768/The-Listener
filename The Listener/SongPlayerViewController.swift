//
//  SongPlayerViewController.swift
//  The Listener
//
//  Created by Kantachat Puagkajee on 3/10/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit
import AVFoundation


class SongPlayerViewController: UIViewController,AVAudioPlayerDelegate {
    //MARK: Properties
    var selectSongList : Song?
    var currrentSongIntex : Int = 0
    var SongLists : Song?
    var repeatClick: Int = 0
    
    //MARK: IMages
    let playButtonImage = UIImage(named: "play-buttonIMG")
    let pauseButtonImage = UIImage(named: "pause-buttonIMG")
    let restartButtonImage = UIImage(named: "restart-buttonIMG")
    let nextButtonImage = UIImage(named: "next-buttonIMG")
    let prevButtonImage = UIImage(named: "prev-buttonIMG")
    let shuffleButtonImage = UIImage(named: "shuffle-buttonIMG")
    let repeatButtonImage = UIImage(named: "repeat-buttonIMG")
    let repeatClickButtonImage = UIImage(named: "repeatClick-buttonIMG")
    //var yourArray = [Song]()
    

    
    var currentSongIndex: Int = 0
    
    //MARK: Outlets
    @IBOutlet weak var songPlayingName: UILabel!
    @IBOutlet weak var songPlayingArtist: UILabel!
    @IBOutlet weak var songPlayingAlbum: UILabel!
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var songCover: UIImageView!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var leftTime: UILabel!
    @IBOutlet weak var playButtonOutlet: UIButton!
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    //MARK: Audio Player
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Graphics
        assignBackGround()
        playButtonOutlet.setImage(playButtonImage, for: .normal)
        restartButton.setImage(restartButtonImage, for: .normal)
        repeatButton.setImage(repeatButtonImage, for: .normal)
        nextButton.setImage(nextButtonImage, for: .normal)
        prevButton.setImage(prevButtonImage, for: .normal)
        
        if let song = selectSongList {
            songPlayingName.text = song.name
            songPlayingAlbum.text = song.album
            songPlayingArtist.text = song.artist
            songCover.image = song.cover!
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: selectSongList?.name, ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            
            audioPlayer.delegate = self
            
            //Slider Code
            Slider.maximumValue = Float(audioPlayer.duration)
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSliderAndTime), userInfo: nil, repeats: true)
            
            let audioSession = AVAudioSession.sharedInstance()
            
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            } catch {
                
            }
        } catch {
            print(error)
        }
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        audioPlayer.prepareToPlay()
        playButtonOutlet.setImage(playButtonImage, for: .normal)
        // Increment song index but don't go out of bounds
   //     currentSongIndex = currentSongIndex += 1 % 
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: Button
    @IBAction func playAndPauseButton (_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
            playButtonOutlet.setImage(playButtonImage, for: .normal)
        } else {
            audioPlayer.play()
            playButtonOutlet.setImage(pauseButtonImage, for: .normal)
        }
     
    }
   
    @IBAction func Restart(_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.currentTime = 0
            audioPlayer.play()
        } else {
            audioPlayer.currentTime = 0
            audioPlayer.prepareToPlay()
            
        }
    }
    @IBAction func setRepeatMode(_ sender: Any) {
        repeatClick = repeatClick + 1
        if repeatClick == 1 {
            audioPlayer.numberOfLoops = -1
            repeatButton.setImage(repeatClickButtonImage, for: .normal)
        }
        if repeatClick == 2 {
            audioPlayer.numberOfLoops = 0
            repeatClick = 0
            repeatButton.setImage(repeatButtonImage, for: .normal)
        }
    }
    
    @IBAction func ChangeAudioTime(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.currentTime = TimeInterval(Slider.value)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }
    
    @objc func updateSliderAndTime() {
        Slider.value = Float(audioPlayer.currentTime)
        NSLog("Hi")
        
        currentTime.text = FormatTimePlay(Duration: Int(audioPlayer.currentTime))
        let timeLeft = Int(audioPlayer.duration) - Int(audioPlayer.currentTime)
        leftTime.text = FormatTimePlay(Duration: timeLeft)
        
        
    }
    
    func FormatTimePlay(Duration: Int) -> String {
        let m: Int = Int(Duration)/60
        let s: Int = Int(Duration)%60
        
        let formattedDuration = String(format: "%0d:%02d", m, s)
        return formattedDuration
        
    }
    func assignBackGround(){
        let background = UIImage(named: "OriginalBGIMG")
        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
    
    
}
