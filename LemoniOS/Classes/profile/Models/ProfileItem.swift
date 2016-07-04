//
//  ProfileItem.swift
//  LemoniOS
//
//  Created by lucas on 16/7/4.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

class ProfileItem: NSObject {

    private(set) var avatarURLString: String
    
    private(set) var name: String;

    init(withAvatarURLString avatarURLString: String, name: String) {
        self.avatarURLString = avatarURLString
        self.name = name
    }
}
