//
//  MessagesCollectionView.swift
//  LemoniOS
//
//  Created by lucas on 16/7/17.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

class MessagesCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = UIColor.white
        self.keyboardDismissMode = .interactive
        self.alwaysBounceVertical = true
        self.bounces = true
        
        self.register(MessagesFromCollectionViewCell.nib(), forCellWithReuseIdentifier: MessagesFromCollectionViewCell.identifier)
    }
}
