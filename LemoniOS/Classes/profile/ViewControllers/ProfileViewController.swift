//
//  ProfileViewController.swift
//  lemon-oa-ios
//
//  Created by lucas on 15/3/25.
//  Copyright (c) 2015年 三只小猪. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {

    static let cellIdentifier = "ProfileCell"
    
    lazy var profileItems: [ProfileItem] = {
        var results = [ProfileItem]()
        
        results.append(ProfileItem(withAvatarURLString: "avatar_default", name: "lucaslee"))
        results.append(ProfileItem(withAvatarURLString: "", name: "设置"))
        results.append(ProfileItem(withAvatarURLString: "", name: "意见反馈"))
        results.append(ProfileItem(withAvatarURLString: "", name: "关于 Lemon"))

        return results
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - UITableViewDataSource

extension ProfileViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.profileItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: ProfileViewController.cellIdentifier, for: indexPath)
    }
}

// MARK: - UITableViewDelegate

extension ProfileViewController {
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let profile = self.profileItems[indexPath.row]
        cell.imageView?.image = UIImage(named: profile.avatarURLString)
        cell.textLabel?.text = profile.name
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.imageView?.image = nil;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView .deselectRow(at: indexPath, animated: true)
        }
        guard let navigationController = navigationController
            , navigationController.topViewController == self else {
                return
        }
        // dosomething.
    }
}
