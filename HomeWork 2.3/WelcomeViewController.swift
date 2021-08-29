//
//  WelcomeViewController.swift
//  HomeWork 2.3
//
//  Created by Olesya Koroleva on 24.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var userNameLabel: UILabel!
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = "Welcome, \(userName)! \n🤚🏾"
    }
}

