//
//  SongDetailsViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 24/11/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class SongDetailsViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var resultTextView: UITextView!
    let backgroundImage = UIImage(named: "detailBackGroundIMG")
    override func viewDidLoad() {
        super.viewDidLoad()
        //assignGraphic
        assignGraphic()
        
        //Read Match.out file from Local Server
        let url = NSURL(string: "http://192.168.64.2/audfprint-master/Match.out")!
        let request = NSURLRequest(url: url as URL)
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.current!) { (response, data, error) -> Void in
            if error != nil {
                print(error!)
            } else {
                if let textFile = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
                    //print(textFile)
                    self.resultTextView.text = textFile as String
                }
            }
        }

    }
    
    func assignGraphic (){
        let background = backgroundImage
        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }

    @IBAction func backMethod(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        }
    
    
    
    }
    


