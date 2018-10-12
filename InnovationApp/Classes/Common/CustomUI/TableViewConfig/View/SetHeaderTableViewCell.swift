//
//  SetHeaderTableViewCell.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/10/12.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class SetHeaderTableViewCell: ConfigTableViewCell {

    private lazy var nameLabel: UILabel = {
        var lable = UILabel()
        lable.font = boldFont(size: 25)
        lable.textColor = kBlackColor
        lable.text = "大头"
        return lable
    }()
    
    private lazy var infoLabel: UILabel = {
        var lable = UILabel()
        lable.font = Font(size: 16)
        lable.textColor = kDarkColor
        lable.text = "点击编辑昵称"
        return lable
    }()
    
    private lazy var iconImage: UIImageView = {
        var imageV : UIImageView = UIImageView()
        imageV.image = GetImage(name: "mineIcon")
        imageV.layer.cornerRadius = 35
        imageV.contentMode = .scaleAspectFill
        imageV.clipsToBounds = true
        return imageV
    }()
    
    private lazy var lineView: UIView = {
        var view = UIView()
        view.backgroundColor = kLineColor
        return view
    }()
    
    private lazy var myPageBtn: UIButton = {
        var btn = UIButton()
        btn.backgroundColor = kBlueColor
        btn.setTitle("我的主页", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = Font(size: 13)
        btn.layer.cornerRadius = 15
        btn.layer.masksToBounds = true
        return btn
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupSubViews()
    }
    
    private func setupSubViews() {
        addSubview(nameLabel)
        addSubview(infoLabel)
        addSubview(iconImage)
        addSubview(lineView)
        addSubview(myPageBtn)
        nameLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(15)
            maker.top.equalTo(35)
        }
        infoLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(nameLabel)
            maker.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        iconImage.snp.makeConstraints { (maker) in
            maker.right.equalTo(-20)
            maker.top.equalTo(30)
            maker.width.height.equalTo(70)
        }
        lineView.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(-15)
            maker.height.equalTo(0.5)
            maker.left.equalTo(20)
            maker.right.equalTo(-80)
        }
        myPageBtn.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(lineView)
            maker.height.equalTo(30)
            maker.width.equalTo(100)
            maker.right.equalTo(15)
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
