//
//  ChatViewController.swift
//  LemoniOS
//
//  Created by lucas on 16/7/9.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var inputToolbar: MessageInputToolBar!
    @IBOutlet weak var toolbarBottomLayoutGuide: NSLayoutConstraint!
    
    deinit {
        removeNotification()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removeInputToolbar()
        
        addNotification()
    }
}

// MARK: - InputToolbar

/**
 
    使用inputAccessoryView
    
    分三步：
        重写inputAccessoryView 提供自定义的view。这里是inputToolbar
        必须能够成为第一响应者。即重写canBecomeFirstResponder， 不然inputToolbar不显示。
        inputToolbar不能在其他的视图中，所以要从其他的视图中移除。 不然会直接报错。
 */
extension ChatViewController {
    
    override var inputAccessoryView: UIView? {
        return self.inputToolbar
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    private func removeInputToolbar() {
        self.inputToolbar.removeFromSuperview()
    }
}

// MARK: - Private methods

private extension ChatViewController {
    
    private func addNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.didReceiveKeyboardWillChangeFromNotification(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    private func removeNotification() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc private func didReceiveKeyboardWillChangeFromNotification(notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        guard let keyboardEndFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect
        where keyboardEndFrame.equalTo(CGRect.zero)  else {
            return
        }
        
        let animationDuration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval) ?? 3.0
        
        let animationCurve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? Int ?? 0
        let animationCurveOption = UIViewAnimationOptions(rawValue: UInt(animationCurve << 16))
        
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: [animationCurveOption], animations: {
            
        }, completion: nil)
    }
}

// MARK: - UITableViewDataSource
//
//extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
//}
