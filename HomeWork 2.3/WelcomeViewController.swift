//
//  WelcomeViewController.swift
//  HomeWork 2.3
//
//  Created by Olesya Koroleva on 24.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var logOutButton: UIButton!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = "Welcome, \(userName ?? "")! \n🤚🏾"
    }
    
    @IBAction func logOutButtonPressed() {
        dismiss(animated: true)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let loginVC = segue.source as?
                ViewController else { return }
        loginVC.userNameTF.text = nil
        loginVC.passwordTF.text = nil
    }
}
