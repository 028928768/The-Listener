//
//  ForgetViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 25/10/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit
import Firebase

class ForgetViewController: UIViewController {
    //MARK Images
    let backgroundImage = UIImage(named: "ForgetBackGroundIMG")
    let forgetLogoImage = UIImage(named:"ForgetLogoIMG" )
    let forgetPanelImage = UIImage(named: "forgetPanelIMG")
    //MARK outlets
    @IBOutlet weak var backgroundOutlet: UIImageView!
    @IBOutlet weak var forgetLogo: UIImageView!
    @IBOutlet weak var forgetPanelOutlet: UIImageView!
    @IBOutlet weak var forgetEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignBackGround()
    }
    
    //MARK Actions
    func assignBackGround(){
        backgroundOutlet.image = backgroundImage
        forgetLogo.image = forgetLogoImage
        forgetPanelOutlet.image = forgetPanelImage
    }

    @IBAction func resendMethod(_ sender: Any) {
        Auth.auth().sendPasswordReset(withEmail: forgetEmail.text!) { (error) in
            if error == nil{
                self.performSegue(withIdentifier: "ConfirmForget", sender: self)
            }
            else{
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    @IBAction func cancelForgetMethod(_ sender: Any) {
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
