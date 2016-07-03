//
//  SessionsCell.swift
//  LemoniOS
//
//  Created by lucas on 16/7/3.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

class SessionsCell: UITableViewCell {

    static let identifier = "SessionsCell"
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    private var session: Session?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(withSession session: Session) {
        self.session = session
        if let avatarURLString = session.avatarURLString {
            self.avatarImageView.image = UIImage(named: avatarURLString)
        }
        self.nameLabel.text = session.name
        self.contentLabel.text = session.content
        self.timeLabel.text = "\(session.createdTime)"
    }
}
