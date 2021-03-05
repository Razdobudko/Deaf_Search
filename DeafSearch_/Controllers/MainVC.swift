//
//  ViewController.swift
//  DeafSearch_
//
//  Created by Veranika Razdabudzka on 27.02.21.
//

import UIKit

class MainVC: UIViewController {
        
    @IBOutlet weak var logoView: UIView!    
    @IBOutlet weak var logoImage: UIImageView!
        
    @IBOutlet weak var registerBtn: CustomBtn!    
    @IBOutlet weak var logInBtn: CustomBtn!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
    }
    
    private func configureInterface() {
        view.backgroundColor = Colors.mauve.color
        
        logoView.layer.shadowColor = Colors.rebeccaPurple.color.cgColor
        logoView.layer.cornerRadius = 15
        logoView.layer.shadowRadius = 10
        logoView.layer.shadowOpacity = 5
        logoView.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        logoImage.layer.cornerRadius = 15
        
        registerBtn.layer.cornerRadius = 20
        logInBtn.layer.cornerRadius = 20
//        logoImage.layer.masksToBounds = true
    }
}

