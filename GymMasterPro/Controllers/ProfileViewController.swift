//
//  ProfileViewController.swift
//  GymMasterPro
//
//  Created by Rusara Kithsahan on 2023-05-18.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = "Profile"
        self.navigationItem.largeTitleDisplayMode = .always
        let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
            
            // Apply the appearance to the navigation bar
            navigationController?.navigationBar.standardAppearance = navigationBarAppearance
            
    }

}
