//
//  UpDownViewController.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

class UpDownViewController: UIViewController {
    var game = UpDownGame()
    
    @IBOutlet var topContainverView: UIView!
    @IBOutlet var contentContainerView: UIView!
    @IBOutlet var bottomContainerView: UIView!
    
    var topVC: UpDownTopViewController?
    var contentVC: UpDownContentViewController?
    var bottomVC: UpDownBottomViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.border()
        
        configureView()
        configureContainerView()
    }
    
    private func configureView() {
        self.view.backgroundColor = UIColor.lightBlue
    }
    
    private func configureContainerView() {
        configureTopContainerView()
        configureContentContainerView()
        configureBottomContainerView()
    }
}

// MARK: Top
extension UpDownViewController {
    private func configureTopContainerView() {
        guard let vc = children.first(where: { $0 is UpDownTopViewController }) as? UpDownTopViewController else { return }
        topVC = vc
    }
}

// MARK: Content
extension UpDownViewController {
    private func configureContentContainerView() {
        guard let vc = children.first(where: { $0 is UpDownContentViewController }) as? UpDownContentViewController else { return }
        contentVC = vc
    }
}

// MARK: Bottom
extension UpDownViewController {
    private func configureBottomContainerView() {
        guard let vc = children.first(where: { $0 is UpDownBottomViewController }) as? UpDownBottomViewController else { return }
        vc.gameButton.addTarget(self, action: #selector(bottomContainerButtonTapped), for: .touchUpInside)
        bottomVC = vc
    }
    
    @objc private func bottomContainerButtonTapped(_ sender: UIButton) {
        switch game.state {
        case .ready:
            guard let input = contentVC?.textFieldInput() else { return }
            guard game.startIfAvailable(mayBeNumber: input) else { return }
            guard let items = game.returnItemsIfAvailable() else { return }
            
            contentVC?.prepareInprogress(items)
        case .inprogress:
            guard let contentVC else { return }
            guard let number = contentVC.selectedNumber() else { return }
            
            if game.isCorrect(number: number)  {
                contentVC.prepareEnd()
                return
            }
            
            switch game.whyIsntItCorrect(number: number) {
            case .up:
                contentVC.removeFirstToNumber(number)
            case .down:
                contentVC.removeNumberToLast(number)
            default:
                break
            }
        case .end:
            game = UpDownGame()
            contentVC?.prepareReady()
        }
        
        topVC?.updateTitle(game)
        topVC?.updateDecription(game)
        bottomVC?.updateButtonText(game)
    }
}
