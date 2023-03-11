//
//  DataFormViewController.swift
//  GymMasterPro
//
//  Created by Rusara Kithsahan on 2023-03-12.
//

import UIKit

class DataFormViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addConstraints()
    }
    
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
    
    let emailLabel : UILabel = {
        let label = UILabel()
        label.text = "Your email address"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
//        label.textAlignment = .center
        
        return label
    }()
    
    let emailTextField : UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.systemGray3.cgColor
        text.layer.cornerRadius = 25
        text.placeholder = "Enter your email here"
        text.leftView = UIView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: 20,
                                             height: 60))
        text.leftViewMode = .always
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    let lineSeperator : UILabel = {
        let line = UILabel()
        line.translatesAutoresizingMaskIntoConstraints = false
        //line.text = "Hi"
        line.layer.borderWidth = 1
        line.layer.borderColor = UIColor.systemGray3.cgColor
        
        return line
    }()
    
    let continueButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = UIFont(name: "SF Compact", size: 20)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 25
        button.layer.borderColor = UIColor.systemGreen.cgColor
        
        return button
    }()
    
    let seperatorText : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "or"
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray3
        
        return label
    }()
    
    let googleButton : UIButton = {
        let button = leftIconButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configure(with: LeftIconButtonViewModel(primaryText: "Sign up with Google",
                                                   icon: UIImage(named: "googleIcon"),
                                                   backgroundColor: .white,
                                                   iconSpace: 15))
        
        return button
    }()
    
    let appleButton : UIButton = {
        let button = leftIconButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configure(with: LeftIconButtonViewModel(primaryText: "Sign up with Apple",
                                                   icon: UIImage(named: "appleIcon"),
                                                   backgroundColor: .white,
                                                   iconSpace: 15))
        
        return button
    }()
    
    func addConstraints(){
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(logoImage)
        self.scrollView.addSubview(nameImage)
        self.scrollView.addSubview(emailLabel)
        self.scrollView.addSubview(emailTextField)
        self.scrollView.addSubview(continueButton)
        self.scrollView.addSubview(lineSeperator)
        self.scrollView.addSubview(seperatorText)
        self.scrollView.addSubview(googleButton)
        self.scrollView.addSubview(appleButton)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        logoImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -710 ).isActive = true
        logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 145).isActive = true
        logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -145).isActive = true
        
        nameImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 165).isActive = true
        nameImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -712 ).isActive = true
        nameImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130).isActive = true
        nameImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        emailLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -630 ).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 260).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -585 ).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        continueButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 330).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -510 ).isActive = true
        continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        lineSeperator.topAnchor.constraint(equalTo: view.topAnchor, constant: 425).isActive = true
        lineSeperator.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -470 ).isActive = true
        lineSeperator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        lineSeperator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        seperatorText.topAnchor.constraint(equalTo: view.topAnchor, constant: 415).isActive = true
        seperatorText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -465 ).isActive = true
        seperatorText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 170).isActive = true
        seperatorText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -170).isActive = true
        
        googleButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 460).isActive = true
        googleButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -370 ).isActive = true
        googleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        googleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        appleButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 540).isActive = true
        appleButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -290 ).isActive = true
        appleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        appleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
    }

}
