//
//  UpDownContentViewController.swift
//  UIKitPractice15
//
//  Created by 송재훈 on 7/18/25.
//

import UIKit

class UpDownContentViewController: UIViewController {
    var collectionViewController: UpDownCollectionViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function, #fileID)
        
        view.subviews.forEach {
            $0.removeFromSuperview()
        }
        
        guard let vc = Bundle.main.loadNibNamed("UpDownCollectionViewController", owner: nil)?.first as? UpDownCollectionViewController else { return }
        self.collectionViewController = vc
        print("312312")
        addChild(vc)
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        view.addSubview(collectionViewController.view)
    }

}
