//
//  BaseViewController.swift
//  Shinto
//
//  Created by Hitarth Bhatt on 13/07/21.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        
    }
    

    func setupNavigationBar() {
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = .white
        self.title = "Home"
        
        
        let profileImage = UIButton(type: .system)
        profileImage.setBackgroundImage(UIImage(named: "Profile")?.withRenderingMode(.alwaysOriginal), for: .normal)
        profileImage.layer.cornerRadius = 10
        profileImage.contentMode = .scaleToFill
        
        NSLayoutConstraint.activate([
        
            profileImage.heightAnchor.constraint(equalToConstant: 40),
            profileImage.widthAnchor.constraint(equalToConstant: 40),
        
        ])
        
        let rightBarButtonItem = UIBarButtonItem()
        rightBarButtonItem.customView = profileImage
        
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        
    }
    
    

}
