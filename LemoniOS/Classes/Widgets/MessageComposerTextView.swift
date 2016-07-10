//
//  MessageComposerTextView.swift
//  LemoniOS
//
//  Created by lucas on 16/7/9.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

// MARK: MessageComposerTextViewUX

struct MessageComposerTextViewUX {
    
    static let backgroundColor = UIColor.white()
    static let borderWidth: CGFloat = 0.5
    static let borderColor = UIColor.lightGray().cgColor
    static let cornerRadius: CGFloat = 6.0
    static let font = UIFont.systemFont(ofSize: 16.0)
    static let textColor = UIColor.black()
}

// MARK: MessageComposerTextView

class MessageComposerTextView: UITextView {
    
    private weak var heightConstraint: NSLayoutConstraint?
    
    private weak var minHeightConstraint: NSLayoutConstraint?
    
    private weak var maxHeightConstraint: NSLayoutConstraint?
    
    deinit {
        removeNotification()
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupViews()
        setupConstraints()
        addNotifications()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        setupConstraints()
        addNotifications()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var height = self.sizeThatFits(self.frame.size).height
        
        if let maxHeightConstraint = self.maxHeightConstraint {
            height = min(height, maxHeightConstraint.constant)
        }
        if let minHeightConstraint = self.minHeightConstraint {
            height = max(height, minHeightConstraint.constant)
        }
        self.heightConstraint?.constant = height
    }
    
    override var bounds: CGRect {
        
        didSet {
            if self.contentSize.height <= bounds.size.height + 1 {
                self.contentOffset = CGPoint.zero
            }
        }
    }
}

// MARK: Private methods

private extension MessageComposerTextView {
    
    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = MessageComposerTextViewUX.backgroundColor
        self.layer.borderWidth = MessageComposerTextViewUX.borderWidth
        self.layer.borderColor = MessageComposerTextViewUX.borderColor
        self.layer.cornerRadius = MessageComposerTextViewUX.cornerRadius
        
        self.font = MessageComposerTextViewUX.font
        self.textColor = MessageComposerTextViewUX.textColor
        self.textAlignment = .natural
        
        self.textContainerInset = UIEdgeInsets(top: 4.0, left: 2.0, bottom: 4.0, right: 2.0)
        self.contentInset = UIEdgeInsets(top: 1.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.scrollIndicatorInsets = UIEdgeInsets(top: MessageComposerTextViewUX.cornerRadius, left: 0.0, bottom: MessageComposerTextViewUX.cornerRadius, right: 0.0)
        
        self.isScrollEnabled = true
        self.scrollsToTop = false
        self.isUserInteractionEnabled = true
        
        self.returnKeyType = .default
        
        self.text = nil
    }
    
    private func setupConstraints() {
        self.constraints.forEach { (constraint) in
            guard constraint.firstAttribute == .height else {
                return
            }
            if constraint.relation == .equal {
                self.heightConstraint = constraint
                return
            }
            if constraint.relation == .lessThanOrEqual {
                self.maxHeightConstraint = constraint
                return
            }
            if constraint.relation == .greaterThanOrEqual {
                self.minHeightConstraint = constraint
                return
            }
        }
    }
    
    private func addNotifications() {
        NotificationCenter.default().addObserver(self, selector: #selector(MessageComposerTextView.didReceiveTextView(WithNotification:)), name: Notification.Name.UITextViewTextDidChange, object: self)
        NotificationCenter.default().addObserver(self, selector: #selector(MessageComposerTextView.didReceiveTextView(WithNotification:)), name: Notification.Name.UITextViewTextDidBeginEditing, object: self)
        NotificationCenter.default().addObserver(self, selector: #selector(MessageComposerTextView.didReceiveTextView(WithNotification:)), name: Notification.Name.UITextViewTextDidEndEditing, object: self)
    }
    
    private func removeNotification() {
        NotificationCenter.default().removeObserver(self, name: Notification.Name.UITextViewTextDidChange, object: self)
        NotificationCenter.default().removeObserver(self, name: Notification.Name.UITextViewTextDidBeginEditing, object: self)
        NotificationCenter.default().removeObserver(self, name: Notification.Name.UITextViewTextDidEndEditing, object: self)
    }
}

// MARK: Objective-C methods

extension MessageComposerTextView {
    
    @objc func didReceiveTextView(WithNotification notification: Notification) {
        self.setNeedsDisplay()
    }
}
