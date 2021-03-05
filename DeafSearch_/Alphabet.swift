//
//  Alphabet.swift
//  DeafSearch_
//
//  Created by Veranika Razdabudzka on 4.03.21.
//

import UIKit

enum AlphabetString {
    case а
    case б
    case в
    case г
    case е
    case и
    case л
    case м
    case н
    case о
    case п
    case р
    case с
    case у
    case ч
    case ы
    case ю
    case э
    case я
    
    var alphabetString: String {
        switch self {
        case .а: return "а"
        case .б: return "б"
        case .в: return "в"
        case .г: return "г"
        case .е: return "е"
        case .и: return "и"
        case .л: return "л"
        case .м: return "м"
        case .н: return "н"
        case .о: return "о"
        case .п: return "п"
        case .р: return "р"
        case .с: return "с"
        case .у: return "у"
        case .ч: return "ч"
        case .ы: return "ы"
        case .ю: return "ю"
        case .э: return "э"
        case .я: return "я"
        }
    }
}

enum AlphabetImage {
    case а
    case б
    case в
    case г
    case е
    case и
    case л
    case м
    case н
    case о
    case п
    case р
    case с
    case у
    case ч
    case ы
    case ю
    case э
    case я
    
    var alphabetImage: UIImage {
        switch self {
        case .а: return #imageLiteral(resourceName: "а")
        case .б: return #imageLiteral(resourceName: "б")
        case .в: return #imageLiteral(resourceName: "в")
        case .г: return #imageLiteral(resourceName: "г")
        case .е: return #imageLiteral(resourceName: "е")
        case .и: return #imageLiteral(resourceName: "и")
        case .л: return #imageLiteral(resourceName: "л")
        case .м: return #imageLiteral(resourceName: "м")
        case .н: return #imageLiteral(resourceName: "н")
        case .о: return #imageLiteral(resourceName: "о")
        case .п: return #imageLiteral(resourceName: "п")
        case .р: return #imageLiteral(resourceName: "р")
        case .с: return #imageLiteral(resourceName: "с")
        case .у: return #imageLiteral(resourceName: "у")
        case .ч: return #imageLiteral(resourceName: "ч")
        case .ы: return #imageLiteral(resourceName: "ы")
        case .ю: return #imageLiteral(resourceName: "ю")
        case .э: return #imageLiteral(resourceName: "э")
        case .я: return #imageLiteral(resourceName: "я")
        }
    }
}

struct Alphabet {
    var letter: AlphabetString
    var image: AlphabetImage
}

