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
    
    private func configureTopContainerView() {
        guard let vc = children.first(where: { $0 is UpDownTopViewController }) as? UpDownTopViewController else { return }
        topVC = vc
        
//        컨테이너 뷰 컨트롤러의 addChild(_:) 메서드를 호출하여 컨테이너 관계를 구성합니다.
//        자식의 루트 뷰를 컨테이너의 뷰 계층에 추가합니다.
//        하위 루트 뷰의 크기와 위치를 설정하기 위해 제약 조건을 추가합니다.
//        vc.didMove(toParent: self)
    }
    
    private func configureContentContainerView() {
        guard let vc = children.first(where: { $0 is UpDownContentViewController }) as? UpDownContentViewController else { return }
        contentVC = vc
    }
    
    private func configureBottomContainerView() {
        guard let vc = children.first(where: { $0 is UpDownBottomViewController }) as? UpDownBottomViewController else { return }
        bottomVC = vc
    }
    
    func receiveFromChild(_ sender: Any) {
        guard let senderWithData = sender as? WithData else { return }
        
        switch senderWithData.data {
        case .start:
            state = .inprogress
            contentVC?.receiveFromParent(senderWithData)
        }
    }
}
