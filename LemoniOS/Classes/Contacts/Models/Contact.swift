//
//  Contact.swift
//  LemoniOS
//
//  Created by lucas on 16/7/4.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import Foundation

class Contact: NSObject {
    
    private(set) var avatarURLString: String?
    
    private(set) var name: String;
    
    init(name: String) {
        self.name = name;
    }
}
