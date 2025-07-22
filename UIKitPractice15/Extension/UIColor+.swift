//
//  UIColor+.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

extension UIColor {
    /**
     업다운 게임 백그라운드 컬러
     */
    static let lightBlue = #colorLiteral(red: 0.7568627451, green: 0.8549019608, blue: 1, alpha: 1)
}

extension UIColor {
    static let systems: [UIColor] = [
        .systemBlue,
        .systemBrown,
        .systemCyan,
        .systemGreen,
        .systemIndigo,
        .systemMint,
        .systemOrange,
        .systemPurple,
        .systemRed,
        .systemTeal,
        .systemYellow
    ]
    
    static var randomSystemColor: UIColor {
        systems.randomElement()!
    }
}
