//
//  ContactsViewController.swift
//  LemoniOS
//
//  Created by lucas on 15/3/25.
//  Copyright (c) 2015年 三只小猪. All rights reserved.
//

import UIKit

class ContactsViewController: UITableViewController {

    open static let cellIdentifier = "ContactCell"
    
    lazy var contacts: [Contact] = {
        var results = [Contact]()
        results.append(Contact(name: "公司高层"))
        results.append(Contact(name: "总经办"))
        results.append(Contact(name: "人事行政部"))
        results.append(Contact(name: "财务部"))
        results.append(Contact(name: "市场部"))
        results.append(Contact(name: "技术部"))
        return results
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDataSource

extension ContactsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: ContactsViewController.cellIdentifier, for: indexPath)
    }
}

// MARK: - UITableViewDelegate

extension ContactsViewController {
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let contact = self.contacts[indexPath.row]
        cell.imageView?.image = UIImage(named: "avatar_default")
        cell.textLabel?.text = contact.name
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
