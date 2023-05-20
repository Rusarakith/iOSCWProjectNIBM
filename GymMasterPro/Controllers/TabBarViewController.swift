//
//  TabBarViewController.swift
//  GymMasterPro
//
//  Created by Rusara Kithsahan on 2023-05-18.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true

        let vc1 = HomeViewController()
//        let vc2 = SearchViewController()
        let vc3 = ActivityViewController()
        let vc4 = ProfileViewController()
        
        
        let nav1  = UINavigationController(rootViewController: vc1)
//        let nav2  = UINavigationController(rootViewController: vc2)
        let nav3  = UINavigationController(rootViewController: vc3)
        let nav4  = UINavigationController(rootViewController: vc4)
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill")?.withRenderingMode(.alwaysTemplate), tag: 1)
//        nav2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Activity", image: UIImage(systemName: "waveform.path.ecg")?.withRenderingMode(.alwaysTemplate), tag: 1)
        nav4.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle.fill")?.withRenderingMode(.alwaysTemplate), tag: 1)
        tabBar.tintColor = .green
        
        nav1.navigationBar.prefersLargeTitles = true
//        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        nav4.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1, nav3, nav4], animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    

}
