//
//  UpDownCollectionViewController.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

class UpDownCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet var collectionView: UICollectionView!

    var items: [Int] = []
    var selected: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
}

// MARK: CollectionView
extension UpDownCollectionViewController {
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: UpDownCell.identifier, bundle: nil), forCellWithReuseIdentifier: UpDownCell.identifier)
        
        let layout = UICollectionViewFlowLayout()
        let height = collectionView.bounds.height
        
        // TODO: 분리
        let horizontalSpacing = height * 0.05
        let itemSpacing = height * 0.05
        let numberOfItems = 5.0
        let numberOfInsets = numberOfItems - 1
        let totalItemSize = (height - (horizontalSpacing + horizontalSpacing) - (itemSpacing * numberOfInsets))
        let itemSize = totalItemSize / numberOfItems
        
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = itemSpacing
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.sectionInset = UIEdgeInsets(top: 0, left: horizontalSpacing, bottom: 0, right: horizontalSpacing)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpDownCell.identifier, for: indexPath)
        let itemNumber = items[indexPath.item]
        
        (cell as? UpDownCell)?.numberLabel.text = "\(itemNumber)"
        (cell as? UpDownCell)?.configureView()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selected {
            collectionView.cellForItem(at: selected)?.isSelected = false
        }
        
        collectionView.cellForItem(at: indexPath)?.isSelected = true
        selected = indexPath
    }
}

// MARK: inprogress
extension UpDownCollectionViewController {
    func selectedNumber() -> Int? {
        guard let selected else { return nil }
        self.selected = nil
        
        return items[selected.item]
    }
    
    func removeFirstToNumber(_ number: Int) {
        items.removeAll { (...number) ~= $0 }
        collectionView.reloadData()
    }
    
    func removeNumberToLast(_ number: Int) {
        items.removeAll { (number...) ~= $0 }
        collectionView.reloadData()
    }
}
