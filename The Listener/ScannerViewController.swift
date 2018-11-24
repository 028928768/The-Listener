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
    var customGreen: UIColor?
    var customRed: UIColor?
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var scanPanel: UIImageView!
    
    //MARK: Graphic Properties
    let backgroundImage = UIImage(named: "ScanWallpaperIMG")
    let scanPanelImage = UIImage(named: "scan-1")
    let scanUnRecordImage = UIImage(named: "scan-norecord")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //graphic
        assignGraphic()
         customGreen = hexStringToUIColor(hex: "#5BC78F")
         customRed = hexStringToUIColor(hex: "#FF473A")
        
        
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
    //Graphic
   func assignGraphic(){
    let background = backgroundImage
    let imageView = UIImageView(frame: view.bounds)
    imageView.contentMode = UIViewContentMode.scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = background
    imageView.center = view.center
    view.addSubview(imageView)
    self.view.sendSubview(toBack: imageView)
    
    //ScanPanel
    scanPanel.image = scanUnRecordImage
    }
    // Hex Color
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    //Actions
    
    @IBAction func recordingMethod(_ sender: Any) {
        if audioRecorder!.isRecording {
            audioRecorder!.stop()
            recordButton.setTitle("Record", for: UIControlState.normal)
            recordButton.backgroundColor = customGreen
            playButton.isEnabled = true
            scanPanel.image = scanUnRecordImage
        } else {
            audioRecorder!.record()
            recordButton.setTitle("Stop", for: UIControlState.normal)
            recordButton.backgroundColor = customRed
            playButton.isEnabled = false
            scanPanel.image = scanPanelImage
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
