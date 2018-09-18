//
//  LeftLableTableViewCell.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/9/14.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class LeftLableTableViewCell: ConfigTableViewCell {

    private lazy var leftLabel: UILabel = {
        var lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.textColor = kThemeBlackColor
        return lable
    }()
    private lazy var rightImg: UIImageView = {
        var imageV = UIImageView()
        imageV.image = GetImage(name: "rightRow")
        return imageV
    }()
    private lazy var lineV: UIView = {
        var view = UIView()
        view.backgroundColor = kLineColor
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
    
    private func setupSubViews() {
        addSubview(leftLabel)
        addSubview(rightImg)
        addSubview(lineV)
        leftLabel.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(self)
            maker.left.equalTo(15)
        }
        rightImg.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(leftLabel)
            maker.right.equalTo(-15)
        }
        lineV.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(self)
            maker.height.equalTo(0.5)
            maker.left.equalTo(15)
            maker.right.equalTo(-15)
        }
    }
    
    override func updateWithConfig(config: TableViewCellConfig) {
        super.updateWithConfig(config: config)
        
        if let cellConfig = config as? LeftLableViewCellConfig {
            leftLabel.text = cellConfig.leftStr
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

}
