//
//  MessagesCollectionViewLayoutAttributes.swift
//  LemoniOS
//
//  Created by lucas on 16/7/17.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

class MessagesCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {

    var messageBubbleFont: UIFont
    
    var messageBubbleContainerViewWidth: CGFloat {
        willSet {
            assert(newValue > 0.0)
        }
    }
    
    var fromAvatarViewSize: CGSize = CGSize.zero {
        willSet {
            assert(newValue.width >= 0.0)
            assert(newValue.height >= 0.0)
            self.fromAvatarViewSize = correctedAvatarSizeFrom(size: newValue)
        }
    }
    
    var toAvatarViewSize: CGSize = CGSize.zero {
        willSet {
            assert(newValue.width >= 0.0)
            assert(newValue.height >= 0.0)
            self.toAvatarViewSize = correctedAvatarSizeFrom(size: newValue)
        }
    }
    
    var cellTopLabelHeight: CGFloat = 0.0 {
        willSet {
            assert(newValue >= 0.0)
            self.cellTopLabelHeight = correctedLabelHeightFrom(height: newValue)
        }
    }
    
    var messageBubbleTopLabelHeight: CGFloat = 0.0 {
        willSet {
            assert(newValue >= 0.0)
            self.messageBubbleTopLabelHeight = correctedLabelHeightFrom(height: newValue)
        }
    }
    
    var cellBottomLabelHeight: CGFloat = 0.0 {
        willSet {
            assert(newValue >= 0.0)
            self.cellBottomLabelHeight = correctedLabelHeightFrom(height: newValue)
        }
    }
    
    var textViewFrameInsets: UIEdgeInsets!
    
    var textViewTextContainerInsets: UIEdgeInsets!

    override init() {
        messageBubbleFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        messageBubbleContainerViewWidth = 320.0
        super.init()
    }
}

extension MessagesCollectionViewLayoutAttributes {
    
    func correctedAvatarSizeFrom(size: CGSize) -> CGSize {
        return CGSize(width: CGFloat(ceilf(Float(size.width))), height: CGFloat(ceilf(Float(size.height))))
    }
    
    func correctedLabelHeightFrom(height: CGFloat) -> CGFloat {
        return CGFloat(ceilf(Float(height)))
    }
}

extension MessagesCollectionViewLayoutAttributes {
    
    override var hashValue: Int {
        return self.indexPath.hashValue
    }
    
    override func copy() -> Any {
        let copy = super.copy() as! MessagesCollectionViewLayoutAttributes
        
        if (copy.representedElementCategory != UICollectionElementCategory.cell) {
            return copy;
        }
        
        copy.messageBubbleFont = self.messageBubbleFont;
        copy.messageBubbleContainerViewWidth = self.messageBubbleContainerViewWidth;
        copy.textViewFrameInsets = self.textViewFrameInsets;
        copy.textViewTextContainerInsets = self.textViewTextContainerInsets;
        copy.fromAvatarViewSize = self.fromAvatarViewSize;
        copy.toAvatarViewSize = self.toAvatarViewSize;
        copy.cellTopLabelHeight = self.cellTopLabelHeight;
        copy.messageBubbleTopLabelHeight = self.messageBubbleTopLabelHeight;
        copy.cellBottomLabelHeight = self.cellBottomLabelHeight;
        
        return copy;
    }
}

func ==(lhs: MessagesCollectionViewLayoutAttributes, rhs: MessagesCollectionViewLayoutAttributes) -> Bool {
    if !lhs.messageBubbleFont.isEqual(lhs.messageBubbleFont)
       || !UIEdgeInsetsEqualToEdgeInsets(lhs.textViewFrameInsets, rhs.textViewFrameInsets)
       || !UIEdgeInsetsEqualToEdgeInsets(lhs.textViewTextContainerInsets, rhs.textViewTextContainerInsets)
       || !lhs.fromAvatarViewSize.equalTo(rhs.fromAvatarViewSize)
       || !lhs.toAvatarViewSize.equalTo(rhs.toAvatarViewSize)
       || (lhs.messageBubbleContainerViewWidth != rhs.messageBubbleContainerViewWidth)
       || (lhs.cellTopLabelHeight != rhs.cellTopLabelHeight)
       || (lhs.messageBubbleTopLabelHeight != rhs.messageBubbleTopLabelHeight)
       || (lhs.cellBottomLabelHeight != rhs.cellBottomLabelHeight) {
        return false
    }
    return true
}
