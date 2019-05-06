//
//  ProfileViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 6/3/2562 BE.
//  Copyright © 2562 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      //  assignBackGround()

        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.blackTranslucent
        nav?.tintColor = UIColor.white
        
    }
    
    //MARK: Actions
    @IBAction func backToHomebutton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //MARK: Graphics
    func assignBackGround(){
        //let background = UIImage(named: "OriginalBGIMG")
        let background = UIImage(named: "profileIMG")
        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
}
