//
//  SearchViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 3/3/2562 BE.
//  Copyright © 2562 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        assignBackGround()
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    //MARK: Actions
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func assignBackGround(){
        let background = UIImage(named: "StorageBGIMG")
        var imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }

}
