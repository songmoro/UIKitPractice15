//
//  UpDownGame.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
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

struct UpDownGame {
    var state = UpDownState.ready
    @UpDownCount var count
    
    enum UpDownState {
        case ready
        case inprogress(_ result: CompareState)
        case end
        
        mutating func next() {
            self = switch self {
            case .ready:
                    .inprogress(.none)
            case .inprogress:
                    .end
            case .end:
                    .ready
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

//enum UpDownState {
//    case ready
//    case inprogress(result: UpDownResult)
//    case end(count: Int)
//    
//    mutating func next() {
//        self = switch self {
//        case .ready:
//                .inprogress(result: .none(count: 0))
//        case .inprogress(let result):
//            switch result {
//            case .none(let count), .up(let count), .down(let count), .answer(let count):
//                    .end(count: count)
//            }
//        case .end:
//                .ready
//        }
//    }
//}
//
//enum UpDownResult {
//    case none(count: Int)
//    case up(count: Int)
//    case down(count: Int)
//    case answer(count: Int)
//}
