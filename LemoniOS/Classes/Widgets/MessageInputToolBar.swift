//
//  MessageInputToolBar.swift
//  LemoniOS
//
//  Created by lucas on 16/7/9.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

struct MessageInputToolBarUX {
    static let sendButtonNormalTitleColor = UIColor(hue: 210.0/360, saturation: 0.94, brightness: 1.0, alpha: 1.0)
    static let sendButtonHighlightedTitleColor = UIColor(hue: 210.0/360, saturation: 0.94, brightness: 1.0, alpha: 1.0)
    static let sendButtonDisabledTitleColor = UIColor.lightGray()
    
    static let sendButtonFont = UIFont.boldSystemFont(ofSize: 17)
    static let sendButtonTintColor = sendButtonNormalTitleColor
}

class MessageInputToolBar: UIToolbar {

    var preferredDefaultHeight: CGFloat = 44.0 {
        willSet {
            assert(newValue > 0.0, "最小值必须是正数。")
        }
    }
    
    var maximumHeight: Int = NSNotFound
    
    private lazy var contentView: MessageToolbarContentView = {
        var result = Bundle.main
                        .loadNibNamed(NSStringFromClass(MessageToolbarContentView.self), owner: nil, options: nil)
                        .first as! MessageToolbarContentView
        return result
    }()
    
    private lazy var sendButton: UIButton = {
        let sendTitle = "发送"
        let result = UIButton(type: .custom)
        result.setTitle(sendTitle, for: [])
        result.setTitleColor(MessageInputToolBarUX.sendButtonNormalTitleColor, for: [])
        result.setTitleColor(MessageInputToolBarUX.sendButtonHighlightedTitleColor, for: [.highlighted])
        result.setTitleColor(MessageInputToolBarUX.sendButtonDisabledTitleColor, for: [.disabled])
        
        result.titleLabel?.font = MessageInputToolBarUX.sendButtonFont
        result.titleLabel?.adjustsFontSizeToFitWidth = true
        result.titleLabel?.minimumScaleFactor = 0.85
        
        result.contentMode = .center
        result.backgroundColor = UIColor.clear()
        result.tintColor = MessageInputToolBarUX.sendButtonTintColor
        
        let maxHeight: CGFloat = 32
        let sendTitleRect = sendTitle.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: maxHeight), options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSFontAttributeName : MessageInputToolBarUX.sendButtonFont], context: nil)
        result.frame = CGRect(x: 0.0, y: 0.0, width: sendTitleRect.integral.width, height: maxHeight)
        return result
    }()
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.white()
        
        self.addSubview(self.contentView)
        setupContentViewConstraints()
        self.setNeedsUpdateConstraints()
        
        self.contentView.leftBarButtonItem = nil
        self.contentView.rightBarButtonItem = self.sendButton
        
        toggleSendButtonEnabled()
    }
    
    private func setupContentViewConstraints() {
        self.lz_pinAllEdgesOfSubView(subView: self.contentView)
    }
    
    private func toggleSendButtonEnabled() {
        self.contentView.rightBarButtonItem?.isEnabled = self.contentView.textView.hasText()
    }
}
