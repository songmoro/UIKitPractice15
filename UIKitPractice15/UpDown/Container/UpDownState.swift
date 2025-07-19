//
//  UpDownState.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

enum UpDownState {
    case ready
    case inprogress(result: UpDownResult)
    case end
    
    mutating func next() {
        self = switch self {
        case .ready: .inprogress(result: .none)
        case .inprogress: .end
        case .end: .ready
        }
    }
}

enum UpDownResult {
    case none
    case up
    case down
    case answer
}
