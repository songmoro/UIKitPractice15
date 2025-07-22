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


// TODO: 채팅창
/** 채팅창
 1. 메시지 보내기
 1-1. 텍스트 뷰 동적 크기
 1-2. 전송 버튼
 2. 랜덤 응답
 3. 날짜 바뀌면 섹션 바꾸기
 */

// TODO: 채팅목록
/** 채팅목록
 1. 검색 기능
 */
