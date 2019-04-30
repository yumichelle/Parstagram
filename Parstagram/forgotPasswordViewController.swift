//
//  forgotPasswordViewController.swift
//  ios-gp
//
//  Created by ellehcim on 4/15/19.
//  Copyright © 2019 ellehcim. All rights reserved.
//

import UIKit
import Parse

class forgotPasswordViewController: UIViewController {
    @IBOutlet weak var emailForgotPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetPasswordButton(_ sender: Any) {
        let user = PFUser()
        user.email = emailForgotPasswordTextField.text
        
        PFUser.requestPasswordResetForEmail(inBackground: user.email!) { (success, error) in
            if success{
                //show as alert:
                let successMessage = "E-mail sent to \(String(describing: user.email))"
                self.displayMessage(themessage: successMessage)
                return
            }
            else {
                //show as alert:
                let errorMessage: String = (error! as NSError).userInfo["error"] as! String
                self.displayMessage(themessage: errorMessage)
            }
        }
        
    }
    
    func displayMessage(themessage: String) {
        //alert pop up:
        let alert = UIAlertController(title: "Alert",
                                      message: themessage,
                                      preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default){
                action in self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
