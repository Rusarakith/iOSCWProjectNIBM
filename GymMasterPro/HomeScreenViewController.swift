//
//  HomeScreenViewController.swift
//  GymMasterPro
//
//  Created by Rusara Kithsahan on 2023-03-21.
//

import UIKit

class HomeScreenViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addConstraints()
        
        submitButton.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
    }
    
    let submitButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.titleLabel?.font = UIFont(name: "SF Compact", size: 20)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 25
        button.layer.borderColor = UIColor.systemGreen.cgColor
        
        return button
    }()
    
    let profilePicView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.layer.cornerRadius = imageView.constraints.heightAnchor / 2
        imageView.clipsToBounds =  true
        imageView.backgroundColor = .systemGreen
        
        return imageView
    }()
    
    @objc func chooseImage(_ sender: Any){
        let imagepicker = UIImagePickerController()
        imagepicker.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Chooose", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (acttion:UIAlertAction) in
            imagepicker.sourceType = .camera
            self.present(imagepicker, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (acttion:UIAlertAction) in
            imagepicker.sourceType = .photoLibrary
            self.present(imagepicker, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            print(image)
            profilePicView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func addConstraints(){
//        self.view.addSubview(profilePicView)
        self.view.addSubview(submitButton)
        
        profilePicView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        profilePicView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -735 ).isActive = true
        profilePicView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
        profilePicView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150).isActive = true
        
        submitButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -580 ).isActive = true
        submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130).isActive = true
        submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130).isActive = true
    }

}
