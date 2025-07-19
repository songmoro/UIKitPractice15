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
    
    // TODO: 구조체 전부를 전달하고, 상태에 따른 분기 처리를 하는 게 맞을까?
    // UpDownGame struct 내부에서 상태에 따른 텍스트를 반환하는 게 낫지 않을까?
    func updateTitle(_ game: UpDownGame) {
        let newText: String = switch game.state {
        case .inprogress(let result):
            switch result {
            case .up: "UP"
            case .down: "DOWN"
            default: "UP DOWN"
            }
        case .end:
            "GOOD!"
        default: "UP DOWN"
        }
        
        titleLabel.text = newText
    }
    
    func updateDecription(_ game: UpDownGame) {
        let newText: String = switch game.state {
        case .ready: "GAME"
        case .inprogress, .end: "시도 횟수: \(game.count)"
        }
        
        descriptionLabel.text = newText
    }
}
