//
//  UpDownGame.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

class UpDownGame {
    private(set) var state: UpDownState
    private(set) var count: Int
    private(set) var items: Int?
    private(set) var answer: Int?
    
    init() {
        self.state = .ready
        self.count = 0
    }
    
    var titleText: String {
        return switch state {
        case .inprogress(.up): "UP"
        case .inprogress(.down): "DOWN"
        case .end: "GOOD!"
        default: "UP DOWN"
        }
    }
    
    var descriptionText: String {
        return switch state {
        case .ready: "GAME"
        default: "시도 횟수: \(count)"
        }
    }
    
    var bottomButtonText: String {
        return switch state {
        case .ready: "시작하기"
        case .inprogress: "결과 확인하기"
        case .end: "다음 게임하기"
        }
    }
    
    private func next() {
        state.next()
    }
    
    private func update(_ compareState: CompareState) {
        state.update(from: compareState)
    }
    
    func startIfAvailable(mayBeNumber text: String) -> Bool {
        guard let number = Int(text) else { return false }
        guard 1...1000 ~= number else { return false }
        
        items = number
        answer = Int.random(in: 1...number)
        
        next()
        return true
    }
    
    func returnItemsIfAvailable() -> Int? {
        guard let items else { return nil }
        return items
    }
    
    func isCorrect(number: Int) -> Bool {
        guard let answer else { return false }
        count += 1
        
        if number == answer {
            next()
        }
        else if number < answer {
            update(.up)
        }
        else if number > answer {
            update(.down)
        }
        
        return number == answer
    }
    
    func whyIsntItCorrect(number: Int) -> CompareState {
        guard case .inprogress(let result) = state else { return .none }
        return result
    }
    
    // MARK: State
    // TODO: 외부/내부에서 다르게 표현
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
    }

    // MARK: Compare
    enum CompareState {
        case none
        case answer
        case up
        case down
    }
}
