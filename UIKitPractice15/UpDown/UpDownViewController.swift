//
//  UpDownViewController.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

class UpDownViewController: UIViewController {
    var state: UpDownState = .ready
    
    @IBOutlet var topContainverView: UIView!
    @IBOutlet var contentContainerView: UIView!
    @IBOutlet var bottomContainerView: UIView!
    
    var topVC: UpDownTopViewController?
    var contentVC: UpDownContentViewController?
    var bottomVC: UpDownBottomViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function, #fileID)
        
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
        print(#function)
        switch state {
        case .ready:
            state.next()
            contentVC?.prepareInprogress()
        case .inprogress:
            guard let contentVC else { return }
            let result = contentVC.compareSelectedNumber()
            
            switch result {
            case .answer:
                state.next()
                contentVC.prepareEnd()
            case .up:
                state = .inprogress(result: .up)
            case .down:
                state = .inprogress(result: .down)
            case .none:
                break
            }
        case .end:
            state.next()
        }
        
        topVC?.updateTitle(state)
    }
}
