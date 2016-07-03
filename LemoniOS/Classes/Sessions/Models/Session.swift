//
//  Session.swift
//  LemoniOS
//
//  Created by lucas on 16/7/3.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

class Session: NSObject {

    var avatarURLString: String?
    
    var name: String
    
    var content: String
    
    var createdTime: TimeInterval
 
    init(name: String, content: String) {
        self.name = name
        self.content = content
        self.createdTime = Date().timeIntervalSince1970
        super.init()
    }
}
