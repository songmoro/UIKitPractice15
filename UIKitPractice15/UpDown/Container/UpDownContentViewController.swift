//
//  UpDownContentViewController.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

class UpDownContentViewController: UIViewController {
    var collectionViewController: UpDownCollectionViewController!
    var readyViewController: UpDownReadyViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function, #fileID)
        
        addReadyView()
    }
    
    func addReadyView() {
        guard let vc = Bundle.main.loadNibNamed("UpDownReadyViewController", owner: nil)?.first as? UpDownReadyViewController else { return }
        
        addChild(vc)
        vc.view.frame = view.bounds
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        self.readyViewController = vc
    }
    
    func addCollectionView() {
        guard let vc = Bundle.main.loadNibNamed("UpDownCollectionViewController", owner: nil)?.first as? UpDownCollectionViewController else { return }
        
        addChild(vc)
        vc.view.frame = view.bounds
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        self.collectionViewController = vc
    }
    
    func removeReadyView() {
        readyViewController.willMove(toParent: nil)
        readyViewController.view.removeFromSuperview()
        readyViewController.removeFromParent()
    }
    
    func removeCollectionView() {
        
    }
    
    func receiveFromParent(_ sender: Any) {
        guard let senderWithData = sender as? WithData else { return }
        
        switch senderWithData.data {
        case .start:
            removeReadyView()
            addCollectionView()
        }
    }
}
