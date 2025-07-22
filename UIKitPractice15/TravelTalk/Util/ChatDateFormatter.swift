//
//  ChatDateFormatter.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/20/25.
//

import Foundation

class ChatDateFormatter {
    static let shared = ChatDateFormatter()
    
    private init() {
        
    }
    
    private let inputFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        return dateFormatter
    }()
    
    private let dotDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy.MM.dd"
        
        return dateFormatter
    }()
    
    private let timeFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        return dateFormatter
    }()
    
    func toDotDateFormat(from string: String) -> String {
        dotDateFormatter.string(from: inputFormatter.date(from: string) ?? Date())
    }
    
    func toTimeFormat(from string: String) -> String {
        timeFormatter.string(from: inputFormatter.date(from: string) ?? Date())
    }
}
