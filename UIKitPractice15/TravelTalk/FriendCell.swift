//
//  FriendCell.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/20/25.
//

import UIKit

// TODO: 데이트 포맷
// TODO: 레이블
class FriendCell: UICollectionViewCell {
    @IBOutlet var friendImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var lastTalkLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        friendImage.layer.cornerRadius = friendImage.bounds.width / 2
    }
    
    override func layerWillDraw(_ layer: CALayer) {
        super.layerWillDraw(layer)
        friendImage.layer.cornerRadius = friendImage.bounds.width / 2
    }
}
