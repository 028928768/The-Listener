//
//  ScannerViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 23/11/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit
import AVFoundation
import Alamofire



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
        
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.blackTranslucent
        nav?.tintColor = UIColor.white
        
        
        let fileManager = FileManager()
        let documentFolderUrl = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let fileURL = documentFolderUrl?.appendingPathComponent("Recording:mp3")
        let audioSetting = [AVFormatIDKey : kAudioFormatMPEG4AAC as NSNumber,AVSampleRateKey : 16000.0 as NSNumber, AVNumberOfChannelsKey: 1 as NSNumber, AVEncoderAudioQualityKey: AVAudioQuality.low.rawValue as NSNumber]
        do {
            audioRecorder = try AVAudioRecorder(url: fileURL!, settings: audioSetting)
        } catch {
            audioRecorder = nil
        }
        //kAudioFormatMPEG4AAC
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        //1
//        let nav = self.navigationController?.navigationBar
//        nav?.barStyle = UIBarStyle.blackTranslucent
//        nav?.tintColor = UIColor.white
//
//    }
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
    @IBAction func BackToMain(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
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
//                Alamofire.upload((audioRecorder?.url)!, to: "http://192.168.64.2/audfprint-master/InputSound/").responseJSON { response in
//                    debugPrint(response)
//                }
                
            
//                Alamofire.upload(
//                    multipartFormData: { multipartFormData in
//                        multipartFormData.append((self.audioRecorder?.url)!, withName: "audio",mimeType: "audio/m4a")
//                },
//                    to: "http://192.168.64.2/audfprint-master/InputSound",
//                    encodingCompletion: { encodingResult in
//                        switch encodingResult {
//                        case .success(let upload, _, _):
//                            upload.responseJSON { response in
//                                debugPrint(response)
//                            }
//                        case .failure(let encodingError):
//                            print(encodingError)
//                        }
//                }
//                )
                
                guard let audioData: Data =  try? Data(contentsOf: (audioRecorder?.url)!) else { return }
                Alamofire.upload(
                    multipartFormData: { multipartFormData in
                        multipartFormData.append( audioData , withName: "Recording.mp3",mimeType: "audio/mpeg")
                        //**this "withName:" is it the name of the file?
                },
                    to: "http://192.168.64.2/audfprint-master/InputSound",
                    encodingCompletion: { encodingResult in
                        switch encodingResult {
                        case .success(let upload, _, _):
                            upload.responseString { response in
                                debugPrint(response)
                            }
                        case .failure(let encodingError):
                            print(encodingError)
                        }
                }
                )
                
               
            }
        }
    }
    
    @IBAction func MatcingMethod(_ sender: Any) {
//        let url = NSURL(string: "http://192.168.64.2/audfprint-master/test.py")!
//        let request = NSURLRequest(url: url as URL)
//        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.current!) { (response, data, error) -> Void in
//
//        }
        Alamofire.request("http://192.168.64.2/audfprint-master/test.py").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
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
