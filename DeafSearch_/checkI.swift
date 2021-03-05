//
//  checkI.swift
//  DeafSearch_
//
//  Created by Veranika Razdabudzka on 2.03.21.
//

import UIKit

class checkI: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    let alf = [ #imageLiteral(resourceName: "о"), #imageLiteral(resourceName: "р"), #imageLiteral(resourceName: "у"), #imageLiteral(resourceName: "г"), #imageLiteral(resourceName: "с"), #imageLiteral(resourceName: "а"), #imageLiteral(resourceName: "ы")]
    
    var aplph = [Alphabet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    
    func tfandImage() {
        
    }
    
    func alert1(){
        let alert = UIAlertController(title: "DA", message: "", preferredStyle: .alert)
        let alertOK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertOK)
        present(alert, animated: true, completion: nil)
    }
    
    func alert2() {
        let alert = UIAlertController(title: "NO", message: "", preferredStyle: .alert)
        let alertOK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertOK)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func pressed(_ sender: UIButton) {
        imageView.image = alf[Int.random(in: 0..<alf.count)]
        
//        imageView.image = alpabet[Int.random(in: 0..<alpabet.count)]
    }
    
    @IBAction func Go(_ sender: UIButton) {
        tfandImage()
    }

}

extension checkI: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let max = 1
        let current: NSString = (textField.text ?? "") as NSString
        let newString: NSString = current.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= max
    }
}
