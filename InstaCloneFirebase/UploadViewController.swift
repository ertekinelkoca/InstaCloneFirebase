//
//  UploadViewController.swift
//  InstaCloneFirebase
//
//  Created by mac on 2.11.2020.
//

import UIKit
import Firebase

class UploadViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var commentText: UITextField!
    
    @IBOutlet weak var uploadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    
    @objc func chooseImage(){
        
        // this makes imageView selectable
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
        
    }
    
    
    //what will happen when the user selects image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func actionButtonClicked(_ sender: Any) {
        
        let storage = Storage.storage()
        //we define below , which folder are we going to use.
        let storageReference = storage.reference()
        
        
        //child means go to the subfolder by adding child().child()
        let mediaFolder = storageReference.child("media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
 
            let imageReference = mediaFolder.child("image.jpg")
            imageReference.putData(data, metadata: nil) { (metadata, error) in
                if error != nil {
                    print(error?.localizedDescription)
                    
                }else {
                    imageReference.downloadURL { (url, error) in
                        if error == nil {
                            let imageURL = url?.absoluteURL
                            print(imageURL)
                        }
                    }
                }
            }
        }
    }
}
