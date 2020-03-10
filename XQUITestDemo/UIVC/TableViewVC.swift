//
//  TableViewVC.swift
//  XQUITestDemo
//
//  Created by WXQ on 2020/3/9.
//  Copyright © 2020 WXQ. All rights reserved.
//

import UIKit
import SnapKit
import SVProgressHUD
import MJRefresh

class TableViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let result = "cell"
    var tableView: UITableView!
    var dataArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "TableView"
        self.view.backgroundColor = UIColor.white
        
        self.initTableView()
        
    }
    
    func initTableView() {
        self.tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottomMargin.equalToSuperview()
        }
        
        self.tableView.register(TableViewCell.classForCoder(), forCellReuseIdentifier: result)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        for item in 0..<100 {
            self.dataArr.append("测试: \(item)")
        }
        
        weak var weakSelf = self
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            SVProgressHUD.showSuccess(withStatus: "下拉刷新成功")
            weakSelf?.tableView.mj_header?.endRefreshing()
        })
        
        
        self.tableView.mj_footer = MJRefreshBackNormalFooter.init(refreshingBlock: {
            SVProgressHUD.showSuccess(withStatus: "上拉刷新成功")
            weakSelf?.tableView.mj_footer?.endRefreshing()
        })
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: result, for: indexPath) as! TableViewCell
        cell.textLabel?.text = self.dataArr[indexPath.row]
        cell.imageView?.image = UIImage.init(named: "back")
        cell.testCount = indexPath.row
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SVProgressHUD.showInfo(withStatus: "点击了\(indexPath.row)行")
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // 这个 13.0 后过期了，要换方法, 不过测试 demo 就先这样写着吧
        
        weak var weakSelf = self
        let deletAction = UITableViewRowAction.init(style: .destructive, title: "删除") { (tableViewRowAction, indexPath) in
            weakSelf?.dataArr.remove(at: indexPath.row)
            weakSelf?.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return [deletAction]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

}
