//
//  RegisterViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 27/10/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    //MARK Images
    let registerPanelImage = UIImage(named: "RegisterPanelIMG")
    let registerPanelDetailsImage = UIImage(named: "RegisterDetailIMG")
    //MARK Outlets
    @IBOutlet weak var registerPanel: UIImageView!
    @IBOutlet weak var registerPanelDetails: UIImageView!
    @IBOutlet weak var registEmail: UITextField!
    @IBOutlet weak var registPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        assignBackGround()
    }
    
    //MARK Actions:
    
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
    
    @IBAction func signUpMethod(_ sender: Any) {
        Auth.auth().createUser(withEmail: registEmail.text!, password: registPassword.text!){ (user, error) in
            if error == nil {
                self.performSegue(withIdentifier: "SigninSuccess", sender: self)
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
    
    @IBAction func cencelRegisterMethod(_ sender: Any) {
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

}
