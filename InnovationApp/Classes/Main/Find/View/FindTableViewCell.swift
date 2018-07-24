//
//  FindTableViewCell.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/7/11.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class FindTableViewCell: UITableViewCell {

    lazy var imageV: UIImageView = {
        var imageView:UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(imageV)
        imageV.snp.makeConstraints { (make) in
            make.top.left.equalTo(10)
            make.bottom.right.equalTo(-10)
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
