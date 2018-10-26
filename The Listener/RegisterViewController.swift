//
//  RegisterViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 27/10/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK Images
    let registerPanelImage = UIImage(named: "RegisterPanelIMG")
    let registerPanelDetailsImage = UIImage(named: "RegisterDetailIMG")
    //MARK Outlets
    @IBOutlet weak var registerPanel: UIImageView!
    @IBOutlet weak var registerPanelDetails: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        assignBackGround()
    }
    
    func assignBackGround() {
        let background = UIImage(named: "RegisterBackGroundIMG")
        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        
        registerPanel.image = registerPanelImage
        registerPanelDetails.image = registerPanelDetailsImage
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
