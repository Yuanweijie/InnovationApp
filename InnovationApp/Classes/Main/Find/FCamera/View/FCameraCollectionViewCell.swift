//
//  FCameraCollectionViewCell.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/7/4.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class FCameraCollectionViewCell: UICollectionViewCell {

    lazy var imageV: UIImageView = {
        var imageView:UIImageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageV)
        imageV.snp.makeConstraints { (maker) in
            maker.edges.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
