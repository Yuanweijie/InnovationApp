//
//  FCameraCollectionViewCell.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/7/4.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import RxSwift
import Photos

class FCameraCollectionViewCell: UICollectionViewCell {

    lazy var disposeBag = DisposeBag()
    
    var tapBlock:((_ model: FImageModel) -> ())?
    
    var model: FImageModel?{
        didSet {
            imageV.image = model?.image
            if model?.isChoose == true {
                chooseV.setImage(GetImage(name: "choose_icon"), for: .normal)
                chooseLab.isHidden = false
                chooseLab.text = "\((model?.index ?? -1) + 1)"
            } else {
                chooseV.setImage(GetImage(name: "chooseno_icon"), for: .normal)
                chooseLab.isHidden = true
            }
        }
    }

    lazy var imageV: UIImageView = {
        var imageView:UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    lazy var chooseV: UIButton = {
        var button:UIButton = UIButton(type: .custom)
        button.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                self?.tapBlock?((self?.model)!)
            })
            .disposed(by: disposeBag)
        return button
    }()
    lazy var chooseLab: UILabel = {
        var lable:UILabel = UILabel()
        lable.backgroundColor = kThemeBlueColor
        lable.textColor = kThemeWhiteColor
        lable.font = Font(size: 13)
        lable.textAlignment = .center
        lable.layer.cornerRadius = 10
        lable.layer.masksToBounds = true
        lable.isHidden = true
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageV)
        imageV.snp.makeConstraints { (maker) in
            maker.edges.equalTo(self)
        }
        addSubview(chooseV)
        chooseV.snp.makeConstraints { (maker) in
            maker.top.right.equalTo(0)
            maker.width.height.equalTo(30)
        }
        addSubview(chooseLab)
        chooseLab.snp.makeConstraints { (maker) in
            maker.top.equalTo(5)
            maker.right.equalTo(-5)
            maker.height.width.equalTo(20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
