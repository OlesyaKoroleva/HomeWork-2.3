//
//  ViewController.swift
//  HomeWork 2.4
//
//  Created by Olesya Koroleva on 24.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    // MARK: - Private properties
    private let user = User.getUser()
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        
        for viewController in tabBarController.viewControllers ?? [] {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = user.person.firstName
            }
            if let navigationController = viewController as? UINavigationController,
               let aboutMeVC = navigationController.viewControllers.first as? AboutMeViewController {
                aboutMeVC.imageName = user.person.photo
                aboutMeVC.aboutMe = user.person.aboutMe
                aboutMeVC.fullName = user.person.firstName + " " + user.person.lastName
            }
        }
    }
    
    // MARK: IBActions
    @IBAction func loginButtonPressed() {
        if userNameTF.text != user.login || passwordTF.text != user.password {
            showAlert(
                title: "Invalid Login or Password",
                message: "Please, enter correct Login and Password",
                textField: passwordTF
            )
        }
    }
    
    @IBAction func forgotUserButtonPressed(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Oops!", message: "Your name is \(user.login) \n😊")
            : showAlert(title: "Oops!", message: "Your Password is \(user.password)")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
}

// MARK: - Privite Methods
extension ViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginButtonPressed()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}

