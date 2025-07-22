//
//  UIView+.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

extension UIView {
    /**
     뷰 레이아웃 확인용 아웃라인
     */
    func border() {
        self.layer.borderColor = UIColor.randomSystemColor.cgColor
        self.layer.borderWidth = 1
        
        self.subviews.forEach {
            $0.border()
        }
    }
}
