//
//  ViewController.swift
//  HomeWork 2.3
//
//  Created by Olesya Koroleva on 24.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController
        else { return }
        welcomeVC.userName = userNameTF.text
    }
    
    @IBAction func loginButtonPressed() {
        if let name = userNameTF.text,
           let password = passwordTF.text, name == "User", password == "Password" {
            performSegue(withIdentifier: "detailUser", sender: self)
            
            
        } else {
            showAlert(with: "Invalid Login or Password", and: "Please, enter correct Login and Password")
        }
    }
    
    @IBAction func forgotUserButtonPressed() {
        showAlert(with: "Oops!", and: "Your name is User \n😊")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(with: "Oops!", and: "Your Password is Password")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    
}

// MARK: - Privite Methods

extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        }
        if textField == passwordTF {
            loginButtonPressed()
        }
        return true
    }
}
