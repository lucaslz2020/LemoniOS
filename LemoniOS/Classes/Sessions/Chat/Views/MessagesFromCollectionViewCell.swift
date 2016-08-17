//
//  MessagesFromCollectionViewCell.swift
//  LemoniOS
//
//  Created by lucas on 16/7/17.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

class MessagesFromCollectionViewCell: MessagesCollectionViewCell {

    
    
    static let identifier = NSStringFromClass(MessagesFromCollectionViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.messageBubbleTopLabel.textAlignment = .left
        self.cellBottomLabel.textAlignment = .left
    }
    
    class func nib() -> UINib {
        return UINib(nibName: NSStringFromClass(MessagesFromCollectionViewCell.self), bundle: nil)
    }
}
