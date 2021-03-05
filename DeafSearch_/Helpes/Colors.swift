//
//  Colors.swift
//  DeafSearch_
//
//  Created by Veranika Razdabudzka on 27.02.21.
//

import UIKit

enum Colors {
    case purple
    case lightWisteria
    case rebeccaPurple
    case mauve
    
    var color: UIColor {
        switch self {
        case .purple: return #colorLiteral(red: 0.3344689608, green: 0.09133017808, blue: 0.484734416, alpha: 1)
        case .rebeccaPurple: return #colorLiteral(red: 0.4, green: 0.2, blue: 0.6, alpha: 1)
        case .lightWisteria: return #colorLiteral(red: 0.7450980392, green: 0.5647058824, blue: 0.831372549, alpha: 1)
        case .mauve: return #colorLiteral(red: 0.8352941176, green: 0.7215686275, blue: 1, alpha: 1)
        }
    }
}
