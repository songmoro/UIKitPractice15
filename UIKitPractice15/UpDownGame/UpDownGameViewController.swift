//
//  UpDownGameViewController.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

class UpDownGameViewController: UIViewController {
    @IBOutlet var topContainverView: UIView!
    @IBOutlet var contentContainerView: UIView!
    @IBOutlet var bottomContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function, #fileID)
        
//        view.border()
        
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
        guard let topVC = children.first(where: { $0 is UpDownGameTopViewController }) as? UpDownGameTopViewController else { return }
        
        print(topVC)

        
//        컨테이너 뷰 컨트롤러의 addChild(_:) 메서드를 호출하여 컨테이너 관계를 구성합니다.
//        자식의 루트 뷰를 컨테이너의 뷰 계층에 추가합니다.
//        하위 루트 뷰의 크기와 위치를 설정하기 위해 제약 조건을 추가합니다.
//        vc.didMove(toParent: self)
    }
    
    private func configureContentContainerView() {
        
    }
    
    private func configureBottomContainerView() {
        
    }
}
