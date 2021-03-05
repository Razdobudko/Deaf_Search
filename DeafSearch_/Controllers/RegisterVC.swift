//
//  RegisterVC.swift
//  DeafSearch_
//
//  Created by Veranika Razdabudzka on 27.02.21.
//

import UIKit

class RegisterVC: UIViewController {
    
    static func createRegisterVC() -> RegisterVC {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let registerVC = storyboard.instantiateViewController(identifier: "RegisterVC") as! RegisterVC
        return registerVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.mauve.color
    }
}
