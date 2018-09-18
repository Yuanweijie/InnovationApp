//
//  FCameraBottomView.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/7/25.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class FCameraBottomView: INBaseView {
    
    var doneBlock:(() -> ())?

    private lazy var doneBtn: UIButton = {
        var btn:UIButton = UIButton()
        btn.backgroundColor = kThemeBlueColor
        btn.setTitle("完成", for: .normal)
        btn.setTitleColor(kThemeWhiteColor, for: .normal)
        btn.titleLabel?.font = Font(size: 14)
        btn.layer.cornerRadius = 2
        btn.layer.masksToBounds = true
        btn.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                self?.doneBlock?()
            })
            .disposed(by: disposeBag)
        return btn
    }()

    override func setupSubViews() {
        super.setupSubViews()
        addSubview(doneBtn)
        doneBtn.snp.makeConstraints { (make) in
            make.top.equalTo(7)
            make.right.equalTo(-15)
            make.width.equalTo(72)
            make.height.equalTo(30)
        }
    }

}
