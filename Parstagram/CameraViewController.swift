//
//  CameraViewController.swift
//  Parstagram
//  <div>Icons made by <a href="https://www.flaticon.com/authors/zurb" title="Zurb">Zurb</a> from <a href="https://www.flaticon.com/"                 title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"                 title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
//  Created by ellehcim on 3/24/19.
//  Copyright © 2019 ellehcim. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var popupView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        popupView.layer.cornerRadius = 20;
        popupView.layer.masksToBounds = true; //everything in popupview is changed with it.
        
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
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    }


