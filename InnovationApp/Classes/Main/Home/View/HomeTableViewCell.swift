//
//  HomeTableViewCell.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/4/27.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    lazy var chooseImg: UIImageView = {
        let chooseImg = UIImageView()
        chooseImg.image = UIImage(named: "weixuan")
        return chooseImg
    }()
    
    lazy var titleLab: UILabel = {
        let titleLab = UILabel()
        titleLab.text = "女装"
        titleLab.textColor = UIColor.hexColor(0x333333)
        titleLab.font = UIFont.systemFont(ofSize: 17.0)
        return titleLab
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(chooseImg)
        contentView.addSubview(titleLab)
        chooseImg.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.centerY.equalTo(self)
        }
        titleLab.snp.makeConstraints { (make) in
            make.left.equalTo(chooseImg.snp.right).offset(16)
            make.centerY.equalTo(contentView)
        }
        
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
