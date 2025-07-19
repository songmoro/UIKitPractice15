//
//  UpDownCell.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

class UpDownCell: UICollectionViewCell {
    @IBOutlet var numberLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            updateColors()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        isSelected = false
    }
    
    private func updateColors() {
        self.numberLabel.textColor = isSelected ? .systemBackground : .label
        self.numberLabel.backgroundColor = isSelected ? .label : .systemBackground
    }
    
    func configureView() {
        layer.cornerRadius = self.bounds.height / 2
    }
}
