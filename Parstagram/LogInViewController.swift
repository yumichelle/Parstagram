//
//  LogInViewController.swift
//
//  Created by ellehcim on 4/15/19.
//  Copyright © 2019 ellehcim. All rights reserved.
//

import UIKit
import Parse

class LogInViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       view.setGradient(colorOne: UIColor(red: 94/255.0, green: 10/255.0, blue: 170/255.0, alpha: 0.60), colorTwo: UIColor(red: 215/255.0, green: 25/255.0, blue: 100/255.0, alpha: 0.60), colorThree: UIColor(red: 244/255.0, green: 179/255.0, blue: 55/255.0, alpha: 0.60));
        
        
    }
    

    @IBAction func loginButton(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        PFUser.logInWithUsername( inBackground: username, password: password){
            (user, error) in
            if user != nil { print("successful login.")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("error:  \(String(describing: error?.localizedDescription))");
            }
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
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
