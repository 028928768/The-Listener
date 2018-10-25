//
//  LoginViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 25/10/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK Images
    let logoImage = UIImage(named: "LogoIMG")
    let loginPanelImage = UIImage(named: "LoginPanelIMG")
    //MARK Properties
    @IBOutlet weak var Logo: UIImageView!
    @IBOutlet weak var LoginPanelOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignBackGround()
        
    }
    
    
    func assignBackGround(){
        let background = UIImage(named: "LoginBackGroundIMG")
        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        Logo.image = logoImage
        LoginPanelOutlet.image = loginPanelImage
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
