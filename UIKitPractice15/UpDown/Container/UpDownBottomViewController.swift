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
    }
    
    // TODO: 셀 선택되지 않았을 때, 비활성화 처리
    func updateButtonText(_ game: UpDownGame) {
        let newText = switch game.state {
        case .ready: "시작하기"
        case .inprogress: "결과 확인하기"
        case .end: "다음 게임하기"
        }
        
        gameButton.setTitle(newText, for: .normal)
    }
}
