//
//  FCameraCollectionViewCell.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/7/4.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class FCameraCollectionViewCell: UICollectionViewCell {

    
    var model: FImageModel?{
        didSet {
            imageV.image = model?.image
            if model?.isChoose == true {
                chooseV.image = GetImage(name: "choose_icon")
            } else {
                chooseV.image = GetImage(name: "chooseno_icon")
            }
        }
    }

    lazy var imageV: UIImageView = {
        var imageView:UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    lazy var chooseV: UIImageView = {
        var imageView:UIImageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageV)
        imageV.snp.makeConstraints { (maker) in
            maker.edges.equalTo(self)
        }
        imageV.addSubview(chooseV)
        chooseV.snp.makeConstraints { (maker) in
            maker.right.bottom.equalTo(-3)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
