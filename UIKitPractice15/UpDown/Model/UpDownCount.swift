//
//  UpDownCount.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/20/25.
//


@propertyWrapper struct UpDownCount {
    private var value: Int = 0
    var wrappedValue: Int {
        get {
            self.value
        }
        set {
            self.value = newValue
        }
    }
    
    init() {
        self.wrappedValue = 0
    }
}