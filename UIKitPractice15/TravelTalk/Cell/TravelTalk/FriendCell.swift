//
//  FriendCell.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/20/25.
//

import UIKit

// TODO: 데이트 포맷
// TODO: 레이블
class FriendCell: UICollectionViewCell, IsIdentifiable {
    @IBOutlet var friendImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var lastTalkLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    // TODO: 어느 위치에서 코너를 설정하는 게 좋은가?
    // - image.bounds가 바뀌는 시점 중 여러 번 수행되지 않는 메서드
    //   -> layerWillDraw에서 수행
    //     - 근데, draw는 오버라이드하는 것 만으로도 오버헤드 발생해서 사용 지양 권장
    //   - 다른 방법: 다른 메서드에서 수행 | collectionView(willDisplay:)에서 cell.layoutIfNeeded()
    override func layerWillDraw(_ layer: CALayer) {
        super.layerWillDraw(layer)
        friendImage.layer.cornerRadius = friendImage.bounds.width / 2
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
}
