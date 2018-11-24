//
//  SongDetailsViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 24/11/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class SongDetailsViewController: UIViewController {
    let backgroundImage = UIImage(named: "detailBackGroundIMG")
    override func viewDidLoad() {
        super.viewDidLoad()
        //assignGraphic
        assignGraphic()
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
    


