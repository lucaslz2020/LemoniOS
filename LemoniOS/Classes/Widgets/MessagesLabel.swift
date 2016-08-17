//
//  MessagesLabel.swift
//  LemoniOS
//
//  Created by lucas on 16/7/17.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

class MessagesLabel: UILabel {

    var textInsets: UIEdgeInsets {
        didSet {
            if UIEdgeInsetsEqualToEdgeInsets(oldValue, textInsets) {
                return
            }
            setNeedsDisplay()
        }
    }

    override init(frame: CGRect) {
        self.textInsets = UIEdgeInsets.zero
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.textInsets = UIEdgeInsets.zero
        super.init(coder: aDecoder)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func drawText(in rect: CGRect) {
        
        super.drawText(in: CGRect(x: rect.minX + self.textInsets.left,
                                  y: rect.minY + self.textInsets.top,
                                  width: rect.width - self.textInsets.right,
                                  height: rect.height - self.textInsets.bottom))
    }
}
