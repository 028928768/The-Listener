//
//  LoginViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 25/10/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    //MARK Images
    let logoImage = UIImage(named: "LogoIMG")
    let loginPanelImage = UIImage(named: "LoginPanelIMG")
    //MARK Properties
    @IBOutlet weak var Logo: UIImageView!
    @IBOutlet weak var LoginPanelOutlet: UIImageView!
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignBackGround()
        
    }
    
    //MARK Actions
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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

    @IBAction func loginMethod(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: loginEmail.text!, password: loginPassword.text!) { (user, error) in
            if error == nil{
                self.performSegue(withIdentifier: "LoginToHome", sender: self)
            }
            else{
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        self.dismiss(animated: true, completion: nil)
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
