//
//  TableViewCell.swift
//  XQUITestDemo
//
//  Created by WXQ on 2020/3/10.
//  Copyright © 2020 WXQ. All rights reserved.
//

import UIKit
import SVProgressHUD

class TableViewCell: UITableViewCell {
    
    let testBtn = UIButton()
    var testCount = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.contentView.addSubview(self.testBtn)
        
        self.testBtn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
        }
        
        self.testBtn.backgroundColor = UIColor.orange
        self.testBtn.setTitle("我是按钮", for: .normal)
        self.testBtn.addTarget(self, action: #selector(respondsToTestBtn), for: .touchUpInside)
            
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - responds
    
    @objc func respondsToTestBtn() {
        SVProgressHUD.showInfo(withStatus: "点击了第\(self.testCount)行Btn")
    }
    
}
