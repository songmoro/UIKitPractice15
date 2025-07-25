//
//  IsIdentifiable.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/22/25.
//

protocol IsIdentifiable {
    static var identifier: String { get }
}

extension IsIdentifiable {
    static var identifier: String {
        String(describing: Self.self)
    }
}
