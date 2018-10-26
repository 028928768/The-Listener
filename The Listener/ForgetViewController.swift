//
//  ForgetViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 25/10/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class ForgetViewController: UIViewController {
    //MARK Images
    let backgroundImage = UIImage(named: "ForgetBackGroundIMG")
    let forgetLogoImage = UIImage(named:"ForgetLogoIMG" )
    let forgetPanelImage = UIImage(named: "forgetPanelIMG")
    //MARK outlets
    @IBOutlet weak var backgroundOutlet: UIImageView!
    @IBOutlet weak var forgetLogo: UIImageView!
    @IBOutlet weak var forgetPanelOutlet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignBackGround()
    }
    
    
    func assignBackGround(){
        backgroundOutlet.image = backgroundImage
        forgetLogo.image = forgetLogoImage
        forgetPanelOutlet.image = forgetPanelImage
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
