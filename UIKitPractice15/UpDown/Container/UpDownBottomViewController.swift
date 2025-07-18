//
//  UpDownBottomViewController.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

class UpDownBottomViewController: UIViewController {
    @IBOutlet var gameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function, #fileID)
        
        gameButton.addTarget(self, action: #selector(gameButtonTapped), for: .touchUpInside)
    }
    
    @objc func gameButtonTapped(_ sender: UIButton) {
        sendToParent(sender)
    }
    
    func sendToParent(_ sender: Any) {
        (parent as? UpDownViewController)?.receiveFromChild(WithData(sender: sender, data: .start))
    }
}
