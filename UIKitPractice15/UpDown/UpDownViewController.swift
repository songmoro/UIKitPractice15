//
//  UpDownViewController.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

enum DataType {
    case start
}

struct WithData {
    let sender: Any
    let data: DataType
}

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
    
    @objc func bottomContainerButtonTapped(_ sender: UIButton) {
        print(#function)
        switch state {
        case .ready:
            state = .inprogress
            contentVC?.prepareInprogress()
        case .inprogress:
            if contentVC?.compareSelectedNumber() == true {
                state = .end
                contentVC?.prepareEnd()
            }
            else {
                // TODO: tryCount += 1
            }
        case .end:
            state = .ready
        }
    }
}
