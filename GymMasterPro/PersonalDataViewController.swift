//
//  PersonalDataViewController.swift
//  GymMasterPro
//
//  Created by Rusara Kithsahan on 2023-03-17.
//

import UIKit

class PersonalDataViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        view.backgroundColor = .white
        
        addConstraints()
        
        createDatePicker()
        
        submitButton.addTarget(self, action: #selector(saveUserData), for: .touchUpInside)
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @objc func saveUserData() async{
        var uuid: String = NSUUID().uuidString
        let data = UserDataModel(
            uid: uuid,
            email: "",
            firstName:
                firstNameTextField.text ?? "",
            lastName: lastNameTextField.text ?? "",
            dob: dobTextField.text ?? "",
            age: ageTextField.text ?? "",
            height: heightTextField.text ?? "",
            weight: weightTextField.text ?? "")
        Task{
            do{
                let result: () = try await UserManager.shared.createNewUser(user: data)
                print(result)
            }
        }
        
    }
    
    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    
    func createDatePicker(){
        dateofbirthPicker.preferredDatePickerStyle = .wheels
        dateofbirthPicker.datePickerMode = .date
        
        dobTextField.inputView = dateofbirthPicker
        dobTextField.inputAccessoryView = createToolbar()
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        let bdDate = dateofbirthPicker.date
        let now = Date()
        
        let calender: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        
        let calAge = calender.components(.year, from: bdDate, to: now, options: [])
        
        let age = calAge.year
        
        self.dobTextField.text = dateFormatter.string(from: dateofbirthPicker.date)
        self.ageTextField.text = age?.codingKey.stringValue
        self.view.endEditing(true)
    }
    
    let dobTextField : UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.systemGray3.cgColor
        text.layer.cornerRadius = 25
        text.placeholder = "Pick date"
        text.leftView = UIView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: 20,
                                             height: 60))
        text.leftViewMode = .always
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    let dateofbirthPicker = UIDatePicker()
    
    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    let logoImage : UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logoBlack")
        logo.setRounded()
        
        return logo
    }()
    
    let nameImage : UIImageView = {
        let name = UIImageView()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.image = UIImage(named: "nameLogoBlack")
        
        return name
    }()
    
    let firstNameLabel : UILabel = {
        let label = UILabel()
        label.text = "First Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .systemGray2
        
        return label
    }()
    
    let firstNameTextField : UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.systemGray3.cgColor
        text.layer.cornerRadius = 25
        text.placeholder = "Enter first name here"
        text.leftView = UIView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: 20,
                                             height: 60))
        text.leftViewMode = .always
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    let lastNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Last Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .systemGray2
        
        return label
    }()
    
    let lastNameTextField : UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.systemGray3.cgColor
        text.layer.cornerRadius = 25
        text.placeholder = "Enter last name here"
        text.leftView = UIView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: 20,
                                             height: 60))
        text.leftViewMode = .always
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    let heightLabel : UILabel = {
        let label = UILabel()
        label.text = "Height"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .systemGray2
        
        return label
    }()
    
    let heightTextField : UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.systemGray3.cgColor
        text.layer.cornerRadius = 25
        text.placeholder = "Your height"
        text.leftView = UIView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: 20,
                                             height: 60))
        text.leftViewMode = .always
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    let weightLabel : UILabel = {
        let label = UILabel()
        label.text = "Weight"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .systemGray2
        
        return label
    }()
    
    let weightTextField : UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.systemGray3.cgColor
        text.layer.cornerRadius = 25
        text.placeholder = "Your weight"
        text.leftView = UIView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: 20,
                                             height: 60))
        text.leftViewMode = .always
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    let dobLabel : UILabel = {
        let label = UILabel()
        label.text = "DOB"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .systemGray2
        
        return label
    }()
    
    let ageLabel : UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .systemGray2
        
        return label
    }()
    
    let ageTextField : UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.systemGray3.cgColor
        text.layer.cornerRadius = 25
        text.placeholder = "Your age"
        text.leftView = UIView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: 20,
                                             height: 60))
        text.leftViewMode = .always
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
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
        imageView.layer.cornerRadius = 50
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
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImageControllerOriginalImage")] as? UIImage{
            profilePicView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    func addConstraints(){
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(logoImage)
        self.scrollView.addSubview(nameImage)
        self.scrollView.addSubview(firstNameLabel)
        self.scrollView.addSubview(firstNameTextField)
        self.scrollView.addSubview(lastNameLabel)
        self.scrollView.addSubview(lastNameTextField)
        self.scrollView.addSubview(dobLabel)
        self.scrollView.addSubview(dobTextField)
        self.scrollView.addSubview(ageLabel)
        self.scrollView.addSubview(ageTextField)
        self.scrollView.addSubview(weightLabel)
        self.scrollView.addSubview(weightTextField)
        self.scrollView.addSubview(heightLabel)
        self.scrollView.addSubview(heightTextField)
        self.scrollView.addSubview(submitButton)
//        self.scrollView.addSubview(profilePicView)
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
//        profilePicView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
//        profilePicView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -710 ).isActive = true
//        profilePicView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 145).isActive = true
//        profilePicView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -145).isActive = true
        
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        logoImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -710 ).isActive = true
        logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 145).isActive = true
        logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -145).isActive = true
        
        nameImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 165).isActive = true
        nameImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -712 ).isActive = true
        nameImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130).isActive = true
        nameImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130).isActive = true
        
        firstNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 207).isActive = true
        firstNameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -623 ).isActive = true
        firstNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        firstNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        firstNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 255).isActive = true
        firstNameTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -590 ).isActive = true
        firstNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        firstNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        lastNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 305).isActive = true
        lastNameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -520 ).isActive = true
        lastNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        lastNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        lastNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 358).isActive = true
        lastNameTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -488 ).isActive = true
        lastNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        lastNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        dobLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 390).isActive = true
        dobLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -395 ).isActive = true
        dobLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        dobLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        dobTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 460).isActive = true
        dobTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -385 ).isActive = true
        dobTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        dobTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -225).isActive = true
        
        ageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 390).isActive = true
        ageLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -395 ).isActive = true
        ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 230).isActive = true
        ageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        ageTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 460).isActive = true
        ageTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -385 ).isActive = true
        ageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 225).isActive = true
        ageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        heightLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 490).isActive = true
        heightLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -290 ).isActive = true
        heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        heightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        heightTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 565).isActive = true
        heightTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -280 ).isActive = true
        heightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        heightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -225).isActive = true
        
        weightLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 490).isActive = true
        weightLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -290 ).isActive = true
        weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 230).isActive = true
        weightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        weightTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 565).isActive = true
        weightTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -280 ).isActive = true
        weightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 220).isActive = true
        weightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        submitButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 645).isActive = true
        submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200 ).isActive = true
        submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
    }
}
