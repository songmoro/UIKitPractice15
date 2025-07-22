//
//  TravelTalkViewController.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/20/25.
//

import UIKit

class TravelTalkViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    let list = repeatElement(ChatList.list, count: 2).flatMap(\.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
}

extension TravelTalkViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: FriendCell.identifier, bundle: nil), forCellWithReuseIdentifier: FriendCell.identifier)
        
        let bounds = collectionView.bounds
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: bounds.width, height: bounds.height / 7)
        layout.minimumLineSpacing = 4
        
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendCell.identifier, for: indexPath)
        let chat = list[indexPath.row]
        
        // TODO: move to cell
        (cell as? FriendCell)?.friendImage.image = UIImage(imageNamed: chat.chatroomImage)
        (cell as? FriendCell)?.nameLabel.text = chat.chatroomName
        
        if let last = chat.chatList.last {
            (cell as? FriendCell)?.lastTalkLabel.text = last.message
            (cell as? FriendCell)?.dateLabel.text = last.dotDate
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: ChattingViewController.identifier) as? ChattingViewController else { return }
        vc.chatList = list[indexPath.row].chatList
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
