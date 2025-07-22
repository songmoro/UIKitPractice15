//
//  UpDownBottomViewController.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

class UpDownBottomViewController: UIViewController {
    @IBOutlet var gameButton: UIButton!
    
    // TODO: 셀 선택되지 않았을 때, 비활성화 처리
    func updateButtonText(_ game: UpDownGame) {
        gameButton.setTitle(game.bottomButtonText, for: .normal)
    }
}
