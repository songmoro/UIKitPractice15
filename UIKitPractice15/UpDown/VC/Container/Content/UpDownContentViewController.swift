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
        prepareReady()
    }
}

// MARK: state
extension UpDownContentViewController {
    func textFieldInput() -> String {
        return readyViewController.limitNumberTextField.text!
    }
    
    func prepareInprogress(_ items: Int) {
        remove(readyViewController)
        
        guard let vc = Bundle.main.loadNibNamed("UpDownCollectionViewController", owner: nil)?.first as? UpDownCollectionViewController else { return }
        
        vc.items = Array(1...items)
        add(vc)
        
        self.collectionViewController = vc
    }
    
    func prepareEnd() {
        remove(collectionViewController)
    }
    
    func prepareReady() {
        guard let vc = Bundle.main.loadNibNamed("UpDownReadyViewController", owner: nil)?.first as? UpDownReadyViewController else { return }
        
        add(vc)
        
        self.readyViewController = vc
    }
    
    func selectedNumber() -> Int? {
        return collectionViewController.selectedNumber()
    }
    
    func removeFirstToNumber(_ number: Int) {
        collectionViewController.removeFirstToNumber(number)
    }
    
    func removeNumberToLast(_ number: Int) {
        collectionViewController.removeNumberToLast(number)
    }
}

// MARK: VC
extension UpDownContentViewController {
    private func remove(_ vc: UIViewController) {
        vc.willMove(toParent: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParent()
    }
    
    private func add(_ vc: UIViewController) {
        addChild(vc)
        vc.view.frame = view.bounds
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
}
