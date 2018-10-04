//
//  SongPlayerViewController.swift
//  The Listener
//
//  Created by Kantachat Puagkajee on 3/10/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit
import AVFoundation


class SongPlayerViewController: UIViewController {
    //MARK: Properties
    var selectedSongName: String = ""
    var selectedSongArtist: String = ""
    var selectedSongAlbum: String = ""
    var selectedSongImage: UIImage = #imageLiteral(resourceName: "Havana-Cover")
 
    
    //MARK: Outlets
    @IBOutlet weak var songPlayingName: UILabel!
    @IBOutlet weak var songPlayingArtist: UILabel!
    @IBOutlet weak var songPlayingAlbum: UILabel!
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var songCover: UIImageView!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var leftTime: UILabel!
    //MARK: Audio Player
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songPlayingName.text = selectedSongName
        songPlayingAlbum.text = selectedSongAlbum
        songPlayingArtist.text = selectedSongArtist
        songCover.image = selectedSongImage
        
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: selectedSongName, ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            
            
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
    @IBAction func PlayButton(_ sender: Any) {
        audioPlayer.play()
    }
    @IBAction func PauseButton(_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        } else {
            
        }
    }
    @IBAction func Restart(_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.currentTime = 0
            audioPlayer.play()
        } else {
            
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
    
    
}
