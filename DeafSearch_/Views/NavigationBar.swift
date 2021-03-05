//
//  NavigationLogo.swift
//  DeafSearch_
//
//  Created by Veranika Razdabudzka on 1.03.21.
//

import UIKit

@objc protocol NavigationBarDelegate: class {
    @objc optional func leftAction()
    @objc optional func rightAction()
}

class NavigationBar: UIView {
        
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    
    weak var delegate: NavigationBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("NavigationBar", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//        contentView.backgroundColor = .yellow
        contentView.layer.shadowColor = Colors.rebeccaPurple.color.cgColor
        contentView.layer.shadowRadius = 10
        contentView.layer.shadowOpacity = 5
        contentView.layer.shadowOffset = CGSize(width: 10, height: 10)
    }
        
    @IBAction func pressedLeftBtn(_ sender: UIButton) {
        delegate?.leftAction?()
    }
        
    @IBAction func pressedRightBtn(_ sender: UIButton) {
        delegate?.rightAction?()
    }
}


