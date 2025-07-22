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
    var answer: Int = 0
    var selected: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function, #fileID)
        
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "UpDownCell", bundle: nil), forCellWithReuseIdentifier: "UpDownCell")
        
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
}

// MARK: CollectionView
extension UpDownCollectionViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpDownCell", for: indexPath)
        let itemNumber = items[indexPath.item]
        (cell as? UpDownCell)?.numberLabel.text = "\(itemNumber)"
        (cell as? UpDownCell)?.configureView()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function, indexPath)
        
        if let selected {
            collectionView.cellForItem(at: selected)?.isSelected = false
        }
        
        collectionView.cellForItem(at: indexPath)?.isSelected = true
        selected = indexPath
    }
}

// MARK: inprogress
extension UpDownCollectionViewController {
    func compareNumber() -> UpDownGame.UpDownState.CompareState {
        guard let selected else { return .none }
        self.selected = nil
        
        let number = items[selected.item]
        let result: UpDownGame.UpDownState.CompareState
        
        print(answer)
        
        if answer == number {
            result = .answer
        }
        else if answer > number {
            result = .up
            items.removeAll { (...number) ~= $0 }
        }
        else {
            result = .down
            items.removeAll { (number...) ~= $0 }
        }
        
        collectionView.reloadData()
        
        return result
    }
}
