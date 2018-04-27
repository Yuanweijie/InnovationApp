//
//  HomeNavView.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/4/27.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class HomeNavView: UIView {

    lazy var titleLab: UILabel = {
        var titleLab : UILabel = UILabel()
        titleLab.text = "首页"
        titleLab.textColor = kThemeWhiteColor
        titleLab.font = boldFont(size: 20)
        return titleLab
    }()
    lazy var addBtn: UIButton = {
        var addBtn : UIButton = UIButton(type: .custom)
        addBtn.setImage(UIImage(named: "home_add"), for: .normal)
        return addBtn
    }()
    lazy var searchBtn: UIButton = {
        var searchBtn : UIButton = UIButton(type: .custom)
        searchBtn.setImage(UIImage(named: "home_search"), for: .normal)
        return searchBtn
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        backgroundColor = UIColor.hexColor(0x589EFE)
        setupSubViews()
    }
    
    private func setupSubViews() {
        addSubview(titleLab)
        addSubview(searchBtn)
        addSubview(addBtn)
        titleLab.snp.makeConstraints { (maker) in
            maker.left.equalTo(15)
            maker.bottom.equalTo(-6)
        }
        searchBtn.snp.makeConstraints { (maker) in
            maker.right.equalTo(-15)
            maker.bottom.equalToSuperview()
            maker.height.equalTo(35)
            maker.width.equalTo(35)
        }
        addBtn.snp.makeConstraints { (maker) in
            maker.right.equalTo(searchBtn.snp.left)
            maker.bottom.width.height.equalTo(searchBtn)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
