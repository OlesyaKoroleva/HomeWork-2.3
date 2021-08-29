//
//  AboutMeViewController.swift
//  HomeWork 2.3
//
//  Created by Olesya Koroleva on 29.08.2021.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var aboutMeLabel: UILabel!
    
    var fullName = ""
    var imageName = ""
    var aboutMe = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = fullName
        imageView.image = UIImage(named: imageName)
        aboutMeLabel.text = aboutMe
    }
    
}
