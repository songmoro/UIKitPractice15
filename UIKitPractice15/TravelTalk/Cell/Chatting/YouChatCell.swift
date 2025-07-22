//
//  YouChatCell.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/20/25.
//

import UIKit

class YouChatCell: UITableViewCell, IsIdentifiable {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var chatLabelBackground: UIView!
    @IBOutlet var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        chatLabelBackground.layer.borderColor = UIColor.label.cgColor
        chatLabelBackground.layer.borderWidth = 1
        chatLabelBackground.layer.cornerRadius = 8
    }
}
