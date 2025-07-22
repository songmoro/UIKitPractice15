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
    
    func updateTitle(_ game: UpDownGame) {
        titleLabel.text = game.titleText
    }
    
    func updateDecription(_ game: UpDownGame) {
        descriptionLabel.text = game.descriptionText
    }
}
