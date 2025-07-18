//
//  UpDownGameBottomViewController.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

class UpDownGameBottomViewController: UIViewController {
    @IBOutlet var gameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function, #fileID)
        
        view.border()
    }
}
