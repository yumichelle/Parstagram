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
        
        // See if e-mail exists.
        let query = PFQuery(className: "_User")
        query.whereKey("email", equalTo: user.email!)
        query.findObjectsInBackground {
            (objects:[PFObject]?, error: Error?) in
            
//            if let error = error {
//                // Log details of the failure
//                let noAcctMessage = "email doesn't exist"
//                self.displayMessage(themessage: noAcctMessage)
//                print(error.localizedDescription)
//            } else if let objects = objects {
//                // The find succeeded.
//                PFUser.requestPasswordResetForEmail(inBackground: user.email!) { (success, error) in
//                    if success {
//                        let successMessage = "E-mail sent to \(user.email!)"
//                        self.displayMessage(themessage: successMessage)
//                        print("e-mail sent") }
//                    else {
//                        let errorMessage: String = (error! as NSError).userInfo["error"] as! String
//                        self.displayMessage(themessage: errorMessage)
//                        print("e-mail NOT sent") }
//                }
//                // Do something with the found objects
//                for object in objects {
//                    print(object.objectId as Any)
//                }
//            }
//        }
//    }


            if (objects?.isEmpty == false) {
                PFUser.requestPasswordResetForEmail(inBackground: user.email!) { (success, error) in
                    if success{
                        let successMessage = "E-mail sent to \(user.email!)"
                        self.displayMessage(themessage: successMessage)
                        print("e-mail sent")
                    }
                    else {
                        let errorMessage: String = (error! as NSError).userInfo["error"] as! String
                        self.displayMessage(themessage: errorMessage)
                        print("e-mail NOT sent")
                    }
                }
            }
                else {
                    let noAcctMessage = "E-mail doesn't exist"
                    self.displayMessage(themessage: noAcctMessage)
                    print("e-mail doesn't exist")

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
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
       dismiss(animated: true, completion: nil)
    }
    

}
