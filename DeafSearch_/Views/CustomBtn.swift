//
//  CustomBtn.swift
//  DeafSearch_
//
//  Created by Veranika Razdabudzka on 27.02.21.
//

import UIKit

class CustomBtn: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.backgroundColor = Colors.purple.color.cgColor
        layer.shadowColor = Colors.rebeccaPurple.color.cgColor
//        layer.borderWidth = 2
//        layer.borderColor = Colors.rebeccaPurple.color.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 5
        layer.shadowOffset = CGSize(width: 10, height: 10)
    }
}
