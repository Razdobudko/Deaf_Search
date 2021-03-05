//
//  TestingVC.swift
//  DeafSearch_
//
//  Created by Veranika Razdabudzka on 27.02.21.
//

import UIKit

class TestingVC: UIViewController {
        
    @IBOutlet weak var customNavigationBar: NavigationBar!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var viewScl: UIView!
    
    @IBOutlet weak var startBtn: CustomBtn!
    @IBOutlet weak var goBtn: UIButton!
        
    @IBOutlet weak var timerLbl: UILabel!
    
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet var textFields: [UITextField]!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!    
    @IBOutlet weak var imageView5: UIImageView!
    
    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var tf5: UITextField!
    
    let alphabet = [#imageLiteral(resourceName: "а"), #imageLiteral(resourceName: "б"), #imageLiteral(resourceName: "в"), #imageLiteral(resourceName: "г"), #imageLiteral(resourceName: "е"), #imageLiteral(resourceName: "и"), #imageLiteral(resourceName: "л"), #imageLiteral(resourceName: "м"), #imageLiteral(resourceName: "н"), #imageLiteral(resourceName: "о"), #imageLiteral(resourceName: "п"), #imageLiteral(resourceName: "р"), #imageLiteral(resourceName: "с"), #imageLiteral(resourceName: "у"), #imageLiteral(resourceName: "ч"), #imageLiteral(resourceName: "ы"), #imageLiteral(resourceName: "э"), #imageLiteral(resourceName: "ю"), #imageLiteral(resourceName: "я")]
    //    ["А", "Б", "В", "Г", "Е", "И", "Л", "М", "Н", "О", "П", "Р", "С","У","Ч","Ы","Э","Ю","Я"]
    var time = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()        
    }
    
// MARK: - View
    private func configureView() {
        view.backgroundColor = Colors.mauve.color
        viewScl.backgroundColor = Colors.mauve.color
        
        startBtn.layer.cornerRadius = 75
        
        customNavigationBar.rightBtn.isHidden = true
        customNavigationBar.delegate = self
        
        NotificationCenter.default.addObserver(forName: UIApplication.keyboardWillShowNotification,
                                               object: nil,
                                               queue: nil)
        { notification in
            if let keyboard = notification.userInfo?[UIApplication.keyboardFrameEndUserInfoKey] as? CGRect {
                self.scrollView.contentInset = UIEdgeInsets(top: 0,
                                                            left: 0,
                                                            bottom: keyboard.height + 30,
                                                            right: 0)
            }
        }
        
        for textField in textFields {
            textField.isHidden = true
            textField.delegate = self
        }
        
        for imageView in imageViews {
            imageView.isHidden = true
        }
        
        timerLbl.isHidden = true
        goBtn.isHidden = true
    }
    
//    MARK: - UIAlert
    private func showAlertBack(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func showAlertForward(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { _ in
            let vc = RegisterVC.createRegisterVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func showAlertEmpty() {
        let alert = UIAlertController(title: "Заполните Поля", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
//    MARK: - Timer
    @objc func configureTimer() {
        time -= 1
        timerLbl.text = String(time)
        
        if time == 0 {
            timer.invalidate()
            showAlertBack(title: "Время истекло", message: nil)
        }
    }
    
    private func time60sec() {
        time = 60
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(configureTimer), userInfo: nil, repeats: true)
    }
    
//    MARK: - Configure TextField
    private func configureTF() {
        
        for textField in textFields {
            let character = textField.text!
            guard character != nil && character != "" else {
                showAlertEmpty()
                return
            }

            let images = UIImage(named: character)
            if let imageName = images {
                showAlertForward(title: "ПОЗДРАВЛЯЕМ", message: "ВЫ справились!")
            } else  {
                showAlertBack(title: "УППС", message: "похоже вы не справились")
            }
        }
    }
    
//    MARK: - Action Btns
        
    @IBAction func pressedStartBtn(_ sender: UIButton) {
        startBtn.isHidden = true
        time60sec()
        timerLbl.isHidden = false
        goBtn.isHidden = false
        
        for textField in textFields {
            textField.isHidden = false
        }
        
        for imageView in imageViews {
            imageView.isHidden = false
            imageView.image = alphabet[Int.random(in: 0..<alphabet.count)]
        }
    }
    
    @IBAction func pressedGoBtn(_ sender: UIButton) {
        configureTF()
    }
}

//    MARK: - UITextFieldDelegate
extension TestingVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case tf1: tf2.becomeFirstResponder()
        case tf2: tf3.becomeFirstResponder()
        case tf3: tf4.becomeFirstResponder()
        case tf4: tf5.becomeFirstResponder()
        case tf5: tf5.resignFirstResponder()
        default:
            break
        }
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let max = 1
        let current: NSString = (textField.text ?? "") as NSString
        let newString: NSString = current.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= max
    }
}

extension TestingVC: NavigationBarDelegate {
    func leftAction() {
        self.navigationController?.popViewController(animated: true)
    }    
}
