//
//  UpDownGame.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

struct UpDownGame {
    var state = UpDownState.ready
    @UpDownCount var count
    
    enum UpDownState {
        case ready
        case inprogress(_ result: CompareState)
        case end
        
        mutating func next() {
            self = switch self {
            case .ready: .inprogress(.none)
            case .inprogress: .end
            case .end: .ready
            }
        }
        
        mutating func update(from compareResult: CompareState) {
            if case .up = compareResult {
                self = .inprogress(compareResult)
            }
            else if case .down = compareResult {
                self = .inprogress(compareResult)
            }
        }
        
        enum CompareState {
            case none
            case answer
            case up
            case down
        }
    }
}
