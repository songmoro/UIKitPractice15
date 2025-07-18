//
//  UpDownCollectionViewController.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

class UpDownCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet var collectionView: UICollectionView!
    
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpDownCell", for: indexPath)
        let itemNumber = indexPath.item + 1
        (cell as? UpDownCell)?.numberLabel.text = "\(itemNumber)"
        
        return cell
    }
}
