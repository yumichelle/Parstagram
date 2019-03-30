//
//  CameraViewController.swift
//  Parstagram
//  Created by ellehcim on 3/24/19.
//  Copyright © 2019 ellehcim. All rights reserved.
//
import UIKit
import AlamofireImage
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var popupView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        popupView.layer.cornerRadius = 20;
        popupView.layer.masksToBounds = true; //everything in popupview is changed with it.
        commentField.delegate = self
        
//How to Move a UITextField View When the Keyboard Appears - listen for keyboard events:
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
//How to Move a UITextField View When the Keyboard Appears - stop listening for keyboard hide/show events; unregister so app doesn't crash:
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @IBAction func onCamerabutton(_ sender: UITapGestureRecognizer) {
        
        let picker = UIImagePickerController();
        picker.delegate = self; // call function when taking photo is done.
        picker.allowsEditing = true; //2nd screen to edit photo.
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){ //check if camera is available
            picker.sourceType = .camera;
        }
        else {
            picker.sourceType = .photoLibrary;
        }
        
        present(picker, animated: true, completion: nil); // Presents a view controller modally.
        
    }
    
    @IBAction func onSubmitbutton(_ sender: Any) {
        let post = PFObject(className: "Posts") // all objects are PFObject. className is table name.
        //schema: which columns table will have.
        // parse will read dictionary and automatically create columns for you.
        post["caption"] = commentField.text!
        post["author"] = PFUser.current()! // whoever is logged in now.
        // save photos in a separate table:
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        
        post["image"] = file //"image" has URL to file.
        post.saveInBackground{ (success, error) in
            if success {
                print("saved!")
                self.dismiss(animated: true, completion: nil)
                
            }
            else{
                print("error!")
            }
            
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image: UIImage = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageAspectScaled(toFill: size)
        
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    @IBAction func onCancelButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    
    
//How to Move a UITextField View When the Keyboard Appears:
    @objc func keyboardWillChange(notification: Notification){
        print("keyboard will show: \(notification.name.rawValue) ")
        
        //finding keyboard size:
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else{
            return
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification{
            
            view.frame.origin.y = -keyboardRect.height + 100
        }
        else {
            view.frame.origin.y = 0
        }
    }
    
    
    
    
// Dismiss the UITextField Keyboard by Pressing the Return Key:
    func hideKeyboard(){
        commentField.resignFirstResponder()
    }
    //UITextFieldDelegate methods -
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return pressed")
//        commentField.resignFirstResponder()
        hideKeyboard()
        return true
    }
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
