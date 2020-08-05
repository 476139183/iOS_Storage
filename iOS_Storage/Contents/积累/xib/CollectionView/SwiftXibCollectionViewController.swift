//
//  SwiftXibCollectionViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SwiftXibCollectionViewController: CQBaseViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var topConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.topConstraint.constant = kNavigationBarHeight
        
        collectionView.register(UINib.init(nibName: "SwiftXibRedCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }

}
