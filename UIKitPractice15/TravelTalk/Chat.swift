//
//  Chat.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/20/25.
//

import Foundation
//채팅 화면에서 사용할 데이터 구조체
struct Chat {
    let user: User
    let date: String
    let message: String
    
    let dotDate: String
    let timeDate: String
    
    // TODO: 검색용 String 배열
    
    init(user: User, date: String, message: String) {
        self.user = user
        self.date = date
        self.message = message
        self.dotDate = ChatDateFormatter.shared.toDotDateFormat(from: date)
        self.timeDate = ChatDateFormatter.shared.toTimeFormat(from: date)
    }
}
