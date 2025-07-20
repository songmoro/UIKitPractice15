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
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
//        print(#function, friendImage.bounds)
    }
    
    override func setNeedsDisplay(_ rect: CGRect) {
        super.setNeedsDisplay(rect)
//        print(#function, friendImage.bounds)
    }
    
    // TODO: drawing cycle
    override func layerWillDraw(_ layer: CALayer) {
        super.layerWillDraw(layer)
//        print(#function, friendImage.bounds)
        friendImage.layer.cornerRadius = friendImage.bounds.width / 2
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
//        print(#function, friendImage.bounds)
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
//        print(#function, friendImage.bounds)
    }
}
