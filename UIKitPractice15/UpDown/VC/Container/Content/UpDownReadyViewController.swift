//
//  UpDownReadyViewController.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

class UpDownReadyViewController: UIViewController, IsIdentifiable {
    @IBOutlet var limitNumberTextField: UITextField!
    @IBOutlet var textFieldView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        view.keyboardLayoutGuide.topAnchor.constraint(equalTo: textFieldView.bottomAnchor).isActive = true
    }
    
    // TODO: 화면 터치 입력 종료
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
        
    }
    
    @IBAction func dismissKeyboard() {
//        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        textFieldView.resignFirstResponder()
    }
}
