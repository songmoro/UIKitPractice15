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
}

// MARK: state
extension UpDownContentViewController {
    func prepareInprogress() {
        removeReadyView()
        addCollectionView()
        
        guard let text = readyViewController.limitNumberTextField.text, let number = Int(text) else { return }
        // TODO: move to collectionVC
        let range = Array(1...number)
        collectionViewController.items = range
        collectionViewController.answer = range.randomElement()!
    }
    
    func prepareEnd() {
        removeCollectionView()
    }
    
    func prepareReady() {
        addReadyView()
    }
}

// MARK: inprogress
extension UpDownContentViewController {
    func compareSelectedNumber() -> UpDownGame.UpDownState.CompareState {
        return collectionViewController.compareNumber()
    }
}

// MARK: prepare
extension UpDownContentViewController {
    // TODO: 중복 감소
    private func addReadyView() {
        guard let vc = Bundle.main.loadNibNamed("UpDownReadyViewController", owner: nil)?.first as? UpDownReadyViewController else { return }
        
        addChild(vc)
        vc.view.frame = view.bounds
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        self.readyViewController = vc
    }
    
    private func addCollectionView() {
        guard let vc = Bundle.main.loadNibNamed("UpDownCollectionViewController", owner: nil)?.first as? UpDownCollectionViewController else { return }
        
        addChild(vc)
        vc.view.frame = view.bounds
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        self.collectionViewController = vc
    }
    
    private func removeReadyView() {
        readyViewController.willMove(toParent: nil)
        readyViewController.view.removeFromSuperview()
        readyViewController.removeFromParent()
    }
    
    private func removeCollectionView() {
        collectionViewController.willMove(toParent: nil)
        collectionViewController.view.removeFromSuperview()
        collectionViewController.removeFromParent()
    }
}
