//
//  MessagesCollectionViewCell.swift
//  LemoniOS
//
//  Created by lucas on 16/7/17.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

class MessagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellTopLabelHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var messageBubbleTopLabelHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var messageBubbleContainerWidthConstraint: NSLayoutConstraint!

    @IBOutlet weak var cellBottomLabelHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var avatarContainerViewWidthConstraint: NSLayoutConstraint!

    @IBOutlet weak var avatarContainerViewHeightConstraint: NSLayoutConstraint!

    @IBOutlet weak var textViewTopVerticalSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var textViewBottomVerticalSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var textViewAvatarHorizontalSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var textViewMarginHorizontalSpaceConstraint: NSLayoutConstraint!

    @IBOutlet weak var cellTopLabel: MessagesLabel!
    @IBOutlet weak var messageBubbleTopLabel: MessagesLabel!
    @IBOutlet weak var cellBottomLabel: MessagesLabel!

    @IBOutlet weak var messageBubbleContainerView: UIView!
    @IBOutlet weak var messageBubbleImageView: UIImageView!
    @IBOutlet weak var textView: MessagesCellTextView!
    
    @IBOutlet weak var avatarContainerView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    private(set) weak var tapGestureRecognizer: UITapGestureRecognizer!
    
    var textViewFrameInsets: UIEdgeInsets {
        didSet {
            if UIEdgeInsetsEqualToEdgeInsets(oldValue, textViewFrameInsets) {
                return
            }
            updateConstraint(constraint: textViewTopVerticalSpaceConstraint, constant: textViewFrameInsets.top)
            updateConstraint(constraint: textViewBottomVerticalSpaceConstraint, constant: textViewFrameInsets.bottom)
            updateConstraint(constraint: textViewAvatarHorizontalSpaceConstraint, constant: textViewFrameInsets.right)
            updateConstraint(constraint: textViewMarginHorizontalSpaceConstraint, constant: textViewFrameInsets.left)
        }
    }
    
    weak var mediaView: UIView? {
        didSet {
            guard let mediaView = mediaView else {
                return
            }
            self.messageBubbleImageView.removeFromSuperview()
            self.textView.removeFromSuperview()
            
            mediaView.translatesAutoresizingMaskIntoConstraints = false
            mediaView.frame = self.messageBubbleContainerView.bounds
            
            self.messageBubbleContainerView.addSubview(mediaView)
            self.messageBubbleContainerView.lz_pinAllEdgesOfSubView(subView: mediaView)
            
            DispatchQueue.main.async { 
                self.messageBubbleContainerView.subviews.forEach { (view) in
                    if view != mediaView {
                        view.removeFromSuperview()
                    }
                }
            }
        }
    }
    
    var avatarViewSize: CGSize {
        didSet {
            if oldValue.equalTo(avatarViewSize) {
               return
            }
            updateConstraint(constraint: avatarContainerViewWidthConstraint, constant: avatarViewSize.width)
            updateConstraint(constraint: avatarContainerViewHeightConstraint, constant: avatarViewSize.height)
        }
    }
    
    override var backgroundColor: UIColor? {
        didSet {
            self.cellTopLabel?.backgroundColor = backgroundColor;
            self.messageBubbleTopLabel?.backgroundColor = backgroundColor;
            self.cellBottomLabel?.backgroundColor = backgroundColor;
            
            self.messageBubbleImageView.backgroundColor = backgroundColor;
            self.avatarImageView.backgroundColor = backgroundColor;
            
            self.messageBubbleContainerView.backgroundColor = backgroundColor;
            self.avatarContainerView.backgroundColor = backgroundColor;
        }
    }
    
    deinit {
        self.cellTopLabel = nil
        self.messageBubbleTopLabel = nil
        self.cellBottomLabel = nil
        
        self.textView = nil
        self.messageBubbleImageView = nil
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.textViewFrameInsets = UIEdgeInsets.zero
        self.avatarViewSize = CGSize.zero
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = UIColor.white
        
        self.cellTopLabelHeightConstraint.constant = 0.0
        self.messageBubbleTopLabelHeightConstraint.constant = 0.0
        self.cellBottomLabelHeightConstraint.constant = 0.0
        
        self.avatarViewSize = CGSize.zero
        
        if let cellTopLabel = self.cellTopLabel {
            cellTopLabel.textAlignment = .center
            cellTopLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
            cellTopLabel.textColor = UIColor.lightGray
        }
        
        if let messageBubbleTopLabel = self.messageBubbleTopLabel {
            messageBubbleTopLabel.font = UIFont.systemFont(ofSize: 12.0)
            messageBubbleTopLabel.textColor = UIColor.lightGray
        }
        
        if let cellBottomLabel = self.cellBottomLabel {
            cellBottomLabel.font = UIFont.systemFont(ofSize: 12.0)
            cellBottomLabel.textColor = UIColor.lightGray
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(MessagesCollectionViewCell.handleTapGesture(tap:)))
        self.addGestureRecognizer(tap)
        self.tapGestureRecognizer = tap
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.cellTopLabel.text = nil;
        self.messageBubbleTopLabel.text = nil
        self.cellBottomLabel?.text = nil
        
        self.textView.dataDetectorTypes = UIDataDetectorTypes()
        self.textView.text = nil
        self.textView.attributedText = nil
        
        self.avatarImageView.image = nil
        self.avatarImageView.highlightedImage = nil
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        return layoutAttributes
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)

        guard let customAttributes = layoutAttributes as? MessagesCollectionViewLayoutAttributes else {
            return
        }
        if self.textView.font != customAttributes.messageBubbleFont {
            self.textView.font = customAttributes.messageBubbleFont
        }
        
        if !UIEdgeInsetsEqualToEdgeInsets(self.textView.textContainerInset, customAttributes.textViewTextContainerInsets) {
            self.textView.textContainerInset = customAttributes.textViewTextContainerInsets
        }

        self.textViewFrameInsets = customAttributes.textViewFrameInsets
        
        updateConstraint(constraint: messageBubbleContainerWidthConstraint, constant: customAttributes.messageBubbleContainerViewWidth)
        updateConstraint(constraint: cellTopLabelHeightConstraint, constant: customAttributes.cellTopLabelHeight)
        updateConstraint(constraint: messageBubbleTopLabelHeightConstraint, constant: customAttributes.messageBubbleContainerViewWidth)
        updateConstraint(constraint: cellBottomLabelHeightConstraint, constant: customAttributes.cellBottomLabelHeight)
 
        if self is MessagesFromCollectionViewCell {
            self.avatarViewSize = customAttributes.fromAvatarViewSize
        } else if self is MessagesToCollectionViewCell {
            self.avatarViewSize = customAttributes.toAvatarViewSize
        }
    }
}

extension MessagesCollectionViewCell {
    
    @objc func handleTapGesture(tap: UITapGestureRecognizer) {
//        let touchPoint = tap.location(in: self)
        
    }
}

extension MessagesCollectionViewCell {
    
    func updateConstraint(constraint: NSLayoutConstraint, constant: CGFloat) {
        if constraint.constant.isEqual(to: constant) {
            return
        }
        constraint.constant = constant
    }
}
