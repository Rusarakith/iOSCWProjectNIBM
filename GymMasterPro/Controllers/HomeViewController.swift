//
//  HomeViewController.swift
//  GymMasterPro
//
//  Created by Rusara Kithsahan on 2023-05-18.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        
        addConstraints()
//        self.view.addSubview(profileImge)
        navigationController?.isNavigationBarHidden = true
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    let profileImge : UIImageView = {
        let profile = UIImageView(frame: CGRect(x: 50, y: 30, width: 60, height: 30))
        profile.contentMode = .scaleAspectFill
        profile.clipsToBounds = true
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.image = UIImage(named: "profilePic")
        profile.layer.cornerRadius = profile.frame.width / 2
        
        return profile
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Rusara Kithsahan"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .systemGray2
//        label.textAlignment = .center
        
        return label
    }()
    
    let welcomeLabel : UILabel = {
        let label = UILabel()
        label.text = "Welcome back!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .systemGray2
//        label.textAlignment = .center
        
        return label
    }()
    
    let newProgramLabel : UILabel = {
        let label = UILabel()
        label.text = "New Program"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
//        label.textAlignment = .center
        
        return label
    }()
    
    let seeAllLabrl : UILabel = {
        let label = UILabel()
        label.text = "See all"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .green
//        label.textAlignment = .center
        
        return label
    }()
    
    let workOutImage1 : UIImageView = {
        let profile = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        profile.contentMode = .scaleAspectFill
        profile.clipsToBounds = true
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.image = UIImage(named: "gymWorkout1")
        profile.layer.cornerRadius = profile.frame.width / 2
        
        return profile
    }()
    
    let workOutImageLabel1 : UILabel = {
        let label = UILabel()
        label.text = "Upper Body"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .white
//        label.textAlignment = .center
        
        return label
    }()
    
    let workOutImageLabel2 : UILabel = {
        let label = UILabel()
        label.text = "Simple Biceps"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textColor = .white
//        label.textAlignment = .center
        
        return label
    }()
    
    let workOutImageLabel3 : UILabel = {
        let label = UILabel()
        label.text = "Workout only 5 mins"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textColor = .white
//        label.textAlignment = .center
        
        return label
    }()
    
    let workoutProgramLabel : UILabel = {
        let label = UILabel()
        label.text = "Workout Programs"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
//        label.textAlignment = .center
        
        return label
    }()
    
    let seeAllLabrl2 : UILabel = {
        let label = UILabel()
        label.text = "See all"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .green
//        label.textAlignment = .center
        
        return label
    }()
    
    let workOutImage2 : UIImageView = {
        let profile = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        profile.contentMode = .scaleAspectFill
        profile.clipsToBounds = true
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.image = UIImage(named: "gymWorkout2")
        profile.layer.cornerRadius = profile.frame.width / 2
        
        return profile
    }()
    
    let workOutImage2Label1 : UILabel = {
        let label = UILabel()
        label.text = "Back Muscle"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .white
//        label.textAlignment = .center
        
        return label
    }()
    
    let workOutImage2Label2 : UILabel = {
        let label = UILabel()
        label.text = "7 days workout"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textColor = .white
//        label.textAlignment = .center
        
        return label
    }()
    
    let workOutImage2Label3 : UILabel = {
        let label = UILabel()
        label.text = "to strengthen the back"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textColor = .white
//        label.textAlignment = .center
        
        return label
    }()
    
    let workOutImage3 : UIImageView = {
        let profile = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        profile.contentMode = .scaleAspectFill
        profile.clipsToBounds = true
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.image = UIImage(named: "gymWorkout3")
        profile.layer.cornerRadius = profile.frame.width / 2
        
        return profile
    }()
    
    let workOutImage3Label1 : UILabel = {
        let label = UILabel()
        label.text = "Back Muscle"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .white
//        label.textAlignment = .center
        
        return label
    }()
    
    let workOutImage3Label2 : UILabel = {
        let label = UILabel()
        label.text = "7 days workout"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textColor = .white
//        label.textAlignment = .center
        
        return label
    }()
    
    let workOutImage3Label3 : UILabel = {
        let label = UILabel()
        label.text = "to strengthen the back"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textColor = .white
//        label.textAlignment = .center
        
        return label
    }()
    
    func addConstraints(){
        view.addSubview(scrollView)
        scrollView.addSubview(profileImge)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(welcomeLabel)
        scrollView.addSubview(newProgramLabel)
        scrollView.addSubview(seeAllLabrl)
        scrollView.addSubview(workOutImage1)
        scrollView.addSubview(workOutImageLabel1)
        scrollView.addSubview(workOutImageLabel2)
        scrollView.addSubview(workOutImageLabel3)
        scrollView.addSubview(workoutProgramLabel)
        scrollView.addSubview(seeAllLabrl2)
        scrollView.addSubview(workOutImage2)
        scrollView.addSubview(workOutImage2Label1)
        scrollView.addSubview(workOutImage2Label2)
        scrollView.addSubview(workOutImage2Label3)
        scrollView.addSubview(workOutImage3)
        scrollView.addSubview(workOutImage3Label1)
        scrollView.addSubview(workOutImage3Label2)
        scrollView.addSubview(workOutImage3Label3)
        
        let constraints = [
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            profileImge.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            profileImge.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -795 ),
            profileImge.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            profileImge.widthAnchor.constraint(equalToConstant: 60),
            profileImge.heightAnchor.constraint(equalToConstant: 60),
        
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.topAnchor,constant: 20),
//            nameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -775 ),
            nameLabel.leadingAnchor.constraint(equalTo: profileImge.leadingAnchor, constant: 70),
//
            welcomeLabel.topAnchor.constraint(equalTo: profileImge.topAnchor,constant: 10),
//            welcomeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -795 ),
            welcomeLabel.leadingAnchor.constraint(equalTo: profileImge.leadingAnchor, constant: 70),

            newProgramLabel.topAnchor.constraint(equalTo: profileImge.topAnchor, constant: 100),
            newProgramLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            newProgramLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -250),

            seeAllLabrl.topAnchor.constraint(equalTo: profileImge.topAnchor, constant: 100),
            seeAllLabrl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 335),
            seeAllLabrl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//
            workOutImage1.topAnchor.constraint(equalTo: newProgramLabel.topAnchor, constant: 40),
            workOutImage1.heightAnchor.constraint(equalToConstant: 250),
            workOutImage1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            workOutImage1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//
            workOutImageLabel1.topAnchor.constraint(equalTo: workOutImage1.topAnchor, constant: 180),
            workOutImageLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            workOutImageLabel1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -300),

            workOutImageLabel2.topAnchor.constraint(equalTo: workOutImageLabel1.topAnchor, constant: 20),
            workOutImageLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            workOutImageLabel2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -250),

            workOutImageLabel3.topAnchor.constraint(equalTo: workOutImageLabel2.topAnchor, constant: 20),
            workOutImageLabel3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            workOutImageLabel3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),

            workoutProgramLabel.topAnchor.constraint(equalTo: workOutImage1.topAnchor, constant: 290),
            workoutProgramLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            workoutProgramLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),

            seeAllLabrl2.topAnchor.constraint(equalTo: workOutImage1.topAnchor, constant: 290),
            seeAllLabrl2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 335),
            seeAllLabrl2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//
            workOutImage2.topAnchor.constraint(equalTo: workoutProgramLabel.topAnchor, constant: 40),
            workOutImage2.heightAnchor.constraint(equalToConstant: 220),
            workOutImage2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            workOutImage2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//
            workOutImage2Label1.topAnchor.constraint(equalTo: workOutImage2.topAnchor, constant: 120),
            workOutImage2Label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            workOutImage2Label1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -300),

            workOutImage2Label2.topAnchor.constraint(equalTo: workOutImage2Label1.topAnchor, constant: 20),
            workOutImage2Label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            workOutImage2Label2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -250),

            workOutImage2Label3.topAnchor.constraint(equalTo: workOutImage2Label2.topAnchor, constant: 20),
            workOutImage2Label3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            workOutImage2Label3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -180),
//
            workOutImage3.topAnchor.constraint(equalTo: workOutImage2.topAnchor, constant: 250),
            workOutImage3.heightAnchor.constraint(equalToConstant: 220),
            workOutImage3.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            workOutImage3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            workOutImage3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//
            workOutImage3Label1.topAnchor.constraint(equalTo: workOutImage3.topAnchor, constant: 130),
            workOutImage3Label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            workOutImage3Label1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -300),

            workOutImage3Label2.topAnchor.constraint(equalTo: workOutImage3Label1.topAnchor, constant: 20),
            workOutImage3Label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            workOutImage3Label2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -250),

            workOutImage3Label3.topAnchor.constraint(equalTo: workOutImage3Label2.topAnchor, constant: 20),
            workOutImage3Label3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            workOutImage3Label3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -180),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}
