//
//  MusicplayerViewController.swift
//  The ListenerTests
//
//  Created by Kantachat Puagkajee on 1/10/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit
import AVFoundation

class MusicplayerViewController: UIViewController {
    //MAKR: Properties
    var receivedSong: String = ""
    
   // @IBOutlet weak var Slider: UISlider!
   // @IBOutlet weak var SongName: UILabel!
    
    //MARK: Audio Player
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //  SongName.text = receivedSong
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: receivedSong, ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            
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
    
    //MARK: Buttons
    
    @IBAction func Playbutton(_ sender: Any) {
        audioPlayer.play()
        
    }
    @IBAction func PauseButton(_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        } else {
            
        }
        
    }
    @IBAction func RestartButton(_ sender: Any) {
       if audioPlayer.isPlaying {
            audioPlayer.currentTime = 0
            audioPlayer.play()
        } else {
            
        }
        
    }
   /*
    @IBAction func ControlTimeBySlider(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.currentTime = TimeInterval(Slider.value)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }
  */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


