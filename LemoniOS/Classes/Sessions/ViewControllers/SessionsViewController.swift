//
//  SessionsViewController.swift
//  lemon-oa-ios
//
//  Created by lucas on 15/3/25.
//  Copyright (c) 2015年 三只小猪. All rights reserved.
//

import UIKit

class SessionsViewController: UITableViewController {

    lazy var sessions: [Session] = {
        var results = [Session]()
        results.append(Session(name: "张三", content: "今天天气不错哦！"))
        results.append(Session(name: "李四", content: "今天天气不错哦！"))
        results.append(Session(name: "王五", content: "今天天气不错哦！"))
        results.append(Session(name: "小六子", content: "今天天气不错哦！"))
        results.append(Session(name: "张三", content: "今天天气不错哦！"))
        results.append(Session(name: "李四", content: "今天天气不错哦！"))
        results.append(Session(name: "张三", content: "今天天气不错哦！"))
        results.append(Session(name: "李四", content: "今天天气不错哦！"))
        results.append(Session(name: "小六子", content: "今天天气不错哦！"))
        results.append(Session(name: "张三", content: "今天天气不错哦！"))
        results.append(Session(name: "李四", content: "今天天气不错哦！"))
        results.append(Session(name: "小六子", content: "今天天气不错哦！"))
        results.append(Session(name: "张三", content: "今天天气不错哦！"))
        results.append(Session(name: "李四", content: "今天天气不错哦！"))
        results.append(Session(name: "小六子", content: "今天天气不错哦！"))
        results.append(Session(name: "张三", content: "今天天气不错哦！"))
        return results
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupViews()
    }
    
    private func setupViews() {
        self.tableView.rowHeight = 66;
    }
}

// MARK: - UITableViewDataSource

extension SessionsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sessions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = tableView.dequeueReusableCell(withIdentifier: SessionsCell.identifier, for: indexPath) as! SessionsCell
        result.configure(withSession: self.sessions[indexPath.row])
        return result
    }
}

// MARK: - UITableViewDelegate

extension SessionsViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView .deselectRow(at: indexPath, animated: true)
        }
        
        guard let navigationController = navigationController
            where navigationController.topViewController == self else {
            return
        }
        // do something.
    }
}
