//
//  SearchViewController.swift
//  GymMasterPro
//
//  Created by Rusara Kithsahan on 2023-05-18.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = "Search"
        self.navigationItem.largeTitleDisplayMode = .always
        let titleAttributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.green
                ]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
    }

}
