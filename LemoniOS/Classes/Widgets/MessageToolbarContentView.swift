//
//  MessageToolbarContentView.swift
//  LemoniOS
//
//  Created by lucas on 16/7/9.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

struct MessageToolbarContentViewUX {
    
    static let messagesToolbarContentViewHorizontalSpacingDefault: CGFloat = 8.0
}

class MessageToolbarContentView: UIView {

    @IBOutlet weak var textView: MessageComposerTextView!
    
    @IBOutlet weak var leftBarButtonContainerView: UIView!
    
    @IBOutlet weak var leftBarButtonContainerViewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var rightBarButtonContainerView: UIView!
    
    @IBOutlet weak var rightBarButtonContainerViewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var leftHorizontalSpacingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var rightHorizontalSpacingConstraint: NSLayoutConstraint!
    
    override var backgroundColor: UIColor? {
        didSet {
            if let leftBarButtonContainerView = self.leftBarButtonContainerView {
                leftBarButtonContainerView.backgroundColor = backgroundColor
            }
            if let rightBarButtonContainerView = self.rightBarButtonContainerView {
                rightBarButtonContainerView.backgroundColor = backgroundColor
            }
        }
    }
    
    var leftBarButtonItemWidth: CGFloat = 0.0 {
        didSet {
            self.leftBarButtonContainerViewWidthConstraint.constant = leftBarButtonItemWidth
            self.setNeedsUpdateConstraints()
        }
        
    }
    
    var rightBarButtonItemWidth: CGFloat = 0.0 {
        didSet {
            self.rightBarButtonContainerViewWidthConstraint.constant = rightBarButtonItemWidth
            self.setNeedsUpdateConstraints()
        }
    }
    
    var rightContentPadding: CGFloat = 0.0 {
        didSet {
            self.rightBarButtonContainerViewWidthConstraint.constant = rightContentPadding
            self.setNeedsUpdateConstraints()
        }
    }
    
    var leftContentPadding: CGFloat = 0.0 {
        didSet {
            self.leftBarButtonContainerViewWidthConstraint.constant = leftContentPadding
            self.setNeedsUpdateConstraints()
        }
    }
    
    weak var leftBarButtonItem: UIButton? {
        willSet {
            if let leftBarButtonItem = leftBarButtonItem {
                leftBarButtonItem.removeFromSuperview()
            }
        }
        
        didSet {
            guard let leftBarButtonItem = leftBarButtonItem else {
                self.leftBarButtonItem = nil
                self.leftHorizontalSpacingConstraint.constant = 0.0
                self.leftBarButtonItemWidth = 0.0
                self.leftBarButtonContainerView.isHidden = true
                return
            }
            if leftBarButtonItem.frame.equalTo(CGRect.zero) {
                leftBarButtonItem.frame = self.leftBarButtonContainerView.bounds
            }
            
            self.leftBarButtonContainerView.isHidden = false
            self.leftHorizontalSpacingConstraint.constant = MessageToolbarContentViewUX.messagesToolbarContentViewHorizontalSpacingDefault
            self.leftBarButtonItemWidth = leftBarButtonItem.frame.width
            leftBarButtonItem.translatesAutoresizingMaskIntoConstraints = false
            
            self.leftBarButtonContainerView.addSubview(leftBarButtonItem)
            self.leftBarButtonContainerView.lz_pinAllEdgesOfSubView(subView: leftBarButtonItem)
            self.setNeedsUpdateConstraints()
        }
    }
    
    weak var rightBarButtonItem: UIButton? {
        willSet {
            if let rightBarButtonItem = rightBarButtonItem {
                rightBarButtonItem.removeFromSuperview()
            }
        }
        
        didSet {
            guard let rightBarButtonItem = rightBarButtonItem else {
                self.rightBarButtonItem = nil
                self.rightHorizontalSpacingConstraint.constant = 0.0
                self.rightBarButtonItemWidth = 0.0
                self.rightBarButtonContainerView.isHidden = true
                return
            }
            
            if rightBarButtonItem.frame.equalTo(CGRect.zero) {
                rightBarButtonItem.frame = self.rightBarButtonContainerView.bounds
            }
            
            self.rightBarButtonContainerView.isHidden = false
            self.rightHorizontalSpacingConstraint.constant = MessageToolbarContentViewUX.messagesToolbarContentViewHorizontalSpacingDefault
            self.rightBarButtonItemWidth = rightBarButtonItem.frame.width
            rightBarButtonItem.translatesAutoresizingMaskIntoConstraints = false
            
            self.rightBarButtonContainerView.addSubview(rightBarButtonItem)
            self.rightBarButtonContainerView.lz_pinAllEdgesOfSubView(subView: rightBarButtonItem)
            self.setNeedsUpdateConstraints()
        }
    }
    
    class func nib() -> UINib {
        return UINib(nibName: String(self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.setupConstraints()
        self.backgroundColor = UIColor.clear()

    }

    private func setupConstraints() {
        self.leftBarButtonContainerViewWidthConstraint.constant = MessageToolbarContentViewUX.messagesToolbarContentViewHorizontalSpacingDefault
        self.rightBarButtonContainerViewWidthConstraint.constant = MessageToolbarContentViewUX.messagesToolbarContentViewHorizontalSpacingDefault
    }
}
