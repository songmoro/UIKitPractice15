//
//  UIImage+.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/22/25.
//

import UIKit

extension UIImage {
    convenience init?(imageNamed: String) {
        self.init(named: "TravelTalk/\(imageNamed)")
    }
}
