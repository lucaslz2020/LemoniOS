//
//  MessageComposerTextView.swift
//  LemoniOS
//
//  Created by lucas on 16/7/9.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

struct MessageComposerTextViewUX {
    
    static let backgroundColor = UIColor.white()
    static let borderWidth: CGFloat = 0.5
    static let borderColor = UIColor.lightGray().cgColor
    static let cornerRadius: CGFloat = 6.0
}

class MessageComposerTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
}

// MARK: - Private methods

private extension MessageComposerTextView {
    
    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = MessageComposerTextViewUX.backgroundColor
        self.layer.borderWidth = MessageComposerTextViewUX.borderWidth
        self.layer.borderColor = MessageComposerTextViewUX.borderColor
        self.layer.cornerRadius = MessageComposerTextViewUX.cornerRadius        
    }
}
