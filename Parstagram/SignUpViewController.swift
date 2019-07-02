//
//  SignUpViewController.swift
//
//  Created by ellehcim on 4/15/19.
//  Copyright © 2019 ellehcim. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
        messageLabel.alpha = 0
    }
    

    @IBAction func signupButton(_ sender: Any) {

//        let user = PFUser(className: "_User")
        let newUser = PFUser()
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        newUser.email = emailTextField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
//            if ((error) != nil) {
//                let errorString = (error! as NSError).userInfo["error"] as? NSString
//                // Show the errorString somewhere and let the user try again.
            
            
            if let error = error {
                self.messageLabel.text = "\((error.localizedDescription))"
                self.animateText(label: self.messageLabel)
                print(error.localizedDescription)

                /*
                 let error = error
                 if (error != nil) {
                                 print(error?.localizedDescription as Any)
                 */

//                self.displayExistAlert()
                
                
            } else {
                // Hooray! Let them use the app now.
//                self.performSegue(withIdentifier: "signupToLogin", sender: nil)
                let main = UIStoryboard(name: "Main", bundle: nil)
                let FeedNavigationController = main.instantiateViewController(withIdentifier: "FeedNavigationController") as UIViewController
                self.present(FeedNavigationController, animated: true, completion: nil)
                print("sign up success")
            }
            }

    }

    func animateText(label : UILabel){
        UIView.animate(withDuration: 1.0, animations: {
            label.alpha = 1.0
//        }, completion: {
//            (completed : Bool) -> Void in
//            UIView.animate(withDuration: 0.0, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {
//                label.alpha = 0
            }, completion: nil
//                {
//                (completed : Bool) -> Void in
//                completed
//            }
            )
//        })
    }
    
    @IBAction func backToLoginViewButton(_ sender: Any) {
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
