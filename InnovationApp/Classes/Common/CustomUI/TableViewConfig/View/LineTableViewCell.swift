//
//  LineTableViewCell.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/10/12.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class LineTableViewCell: ConfigTableViewCell {

    private lazy var lineView: UIView = {
        var view = UIView()
        view.backgroundColor = kLineColor
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupSubViews()
    }
    
    private func setupSubViews() {
        addSubview(lineView)
        lineView.snp.makeConstraints { (maker) in
            maker.left.equalTo(20)
            maker.right.equalTo(-20)
            maker.centerY.equalTo(self)
            maker.height.equalTo(0.5)
        }
    }
    
    override func updateWithConfig(config: TableViewCellConfig) {
        super.updateWithConfig(config: config)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
