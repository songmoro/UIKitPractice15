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
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function, indexPath)
        removeSelcted()
        selected = indexPath
        updateSelected()
    }
    
    // TODO: move to cell
    func updateSelected() {
        guard let selected else { return }
        guard let cell = collectionView.cellForItem(at: selected) as? UpDownCell else { return }
        
        cell.numberLabel.textColor = .systemBackground
        cell.numberLabel.backgroundColor = .label
    }
    
    func removeSelcted() {
        guard let selected else { return }
        guard let cell = collectionView.cellForItem(at: selected) as? UpDownCell else { return }
        
        cell.numberLabel.textColor = .label
        cell.numberLabel.backgroundColor = .systemBackground
    }
}

// MARK: inprogress
extension UpDownCollectionViewController {
    func compareNumber() -> Bool {
        guard let selected else { return false }
        let number = items[selected.item]
        print(answer)
        
        if answer == number {
            return true
        }
        else if answer > number {
            items.removeAll(where: { (...number) ~= $0 })
            self.selected = nil
            collectionView.reloadData()
            return false
        }
        else if answer < number {
            items.removeAll(where: { (number...) ~= $0 })
            self.selected = nil
            collectionView.reloadData()
            return false
        }
        
        return true
    }
}
