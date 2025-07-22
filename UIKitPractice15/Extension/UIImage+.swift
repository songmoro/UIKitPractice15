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
 2. 랜덤 응답
 3. 날짜 바뀌면 섹션 바꾸기
 4. 뷰 진입 시 바텀 포지션
 */

// TODO: 채팅목록
/** 채팅목록
 1. 검색 기능
 */
