//
//  MineHeaderTableViewCell.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/9/14.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class MineHeaderTableViewCell: ConfigTableViewCell {

    private lazy var iconImage: UIImageView = {
        var imageV : UIImageView = UIImageView()
        imageV.image = GetImage(name: "mineIcon")
        imageV.layer.cornerRadius = 35
        imageV.contentMode = .scaleAspectFill
        imageV.clipsToBounds = true
        return imageV
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupSubViews()
    }
    
    private func setupSubViews() {
        addSubview(iconImage)
        iconImage.snp.makeConstraints { (maker) in
            maker.left.equalTo(20)
            maker.bottom.equalTo(-50)
            maker.width.height.equalTo(70)
        }
    }
    
    override func updateWithConfig(config: TableViewCellConfig) {
        super.updateWithConfig(config: config)
//        if let cellConfig = config as? LeftLableViewCellConfig {
//
//        }
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
