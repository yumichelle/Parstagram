//
//  CameraViewController.swift
//  Parstagram
//
//  Created by ellehcim on 3/24/19.
//  Copyright © 2019 ellehcim. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func onSubmitbutton(_ sender: Any) {
    }
    
    @IBAction func onCamerabutton(_ sender: Any) {
        let picker = UIImagePickerController();
        picker.delegate=self; // call function when taking photo is done.
        picker.allowsEditing = true; //2nd screen to edit photo.
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){ //check if camera is available
            picker.sourceType = .camera;
        }
        else {
            picker.sourceType = .photoLibrary;
        }
        
        present(picker, animated: true, completion: nil); // Presents a view controller modally.
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300);
        let scaledImage = image.af_imageScaled(to: size);
        
        imageView.image = scaledImage;
        
        dismiss(animated: true, completion: nil);
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
