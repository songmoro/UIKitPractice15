//
//  UpDownTopViewController.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

class UpDownTopViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function, #fileID)
    }
    
    func updateTitle(_ state: UpDownState) {
        let newText: String = switch state {
        case .inprogress(.up): "UP"
        case .inprogress(.down): "DOWN"
        default: "UP DOWN"
        }
        
        titleLabel.text = newText
    }
}
