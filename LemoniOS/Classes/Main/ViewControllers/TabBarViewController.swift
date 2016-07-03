//
//  TabBarViewController.swift
//  lemon-oa-ios
//
//  Created by lucas on 15/3/25.
//  Copyright (c) 2015年 三只小猪. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initAllChildrenViewControllers()
    }
    
    func initAllChildrenViewControllers() {
        self.initChildViewController(MessagesViewController(), title: "消息", imageName: "", selectedImageName: "")
        self.initChildViewController(ContactsViewController(), title: "通讯录", imageName: "", selectedImageName: "")
        self.initChildViewController(DiscoverViewController(), title: "广场", imageName: "", selectedImageName: "")
        self.initChildViewController(MeViewController(), title: "我", imageName: "", selectedImageName: "")
    }
    
    func initChildViewController(_ viewController:UIViewController,title:String, imageName: String, selectedImageName:String) {
        viewController.title = title;
        viewController.tabBarItem.image = UIImage(named:imageName)
        viewController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        self.addChildViewController(UINavigationController(rootViewController: viewController))
    }
}
