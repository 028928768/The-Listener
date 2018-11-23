//
//  ScannerViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 23/11/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit
import AVFoundation

class ScannerViewController: UIViewController,AVAudioPlayerDelegate {
    //MARK: Properties
    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fileManager = FileManager()
        let documentFolderUrl = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let fileURL = documentFolderUrl?.appendingPathComponent("Recording:m4a")
        let audioSetting = [AVFormatIDKey : kAudioFormatMPEG4AAC as NSNumber,AVSampleRateKey : 16000.0 as NSNumber, AVNumberOfChannelsKey: 1 as NSNumber, AVEncoderAudioQualityKey: AVAudioQuality.low.rawValue as NSNumber]
        do {
            audioRecorder = try AVAudioRecorder(url: fileURL!, settings: audioSetting)
        } catch {
            audioRecorder = nil
        }
    }
    //Actions
    
    @IBAction func recordingMethod(_ sender: Any) {
        if audioRecorder!.isRecording {
            audioRecorder!.stop()
            recordButton.setTitle("Record", for: UIControlState.normal)
            playButton.isEnabled = true
        } else {
            audioRecorder!.record()
            recordButton.setTitle("Stop", for: UIControlState.normal)
            playButton.isEnabled = false
        }
    }
    
    @IBAction func playMethod(_ sender: Any) {
        if (!audioRecorder!.isRecording) {
            var error: NSError?
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: (audioRecorder?.url)!)
            } catch let error1 as NSError {
                error = error1
                audioPlayer = nil
            }
            if error != nil{
                print("An error \(String (describing: error)) occured")
            }
            else {
                audioPlayer?.play()
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
