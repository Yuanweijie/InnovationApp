//
//  InputTextView.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/5/9.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class InputTextView: UIView {
    
    var tapBlock:(() -> ())?
    
    private lazy var disposeBag = DisposeBag()
    
    lazy var inpuView : UITextView = {
        var inpuView : UITextView = UITextView()
        inpuView.layer.borderWidth = 1
        inpuView.layer.borderColor = kThemeBgColor.cgColor
        inpuView.font = Font(size: 16)
        inpuView.toolbarPlaceholder = "输入话术"
        return inpuView
    }()
    
    lazy var okBtn : UIButton = {
        var okBtn : UIButton = UIButton()
        okBtn.layer.cornerRadius = 3
        okBtn.layer.masksToBounds = true
        okBtn.setTitle("发送", for: .normal)
        okBtn.titleLabel?.font = Font(size: 15.0)
        okBtn.setTitleColor(kThemeWhiteColor, for: .normal)
        okBtn.backgroundColor = kThemeBlueColor
        okBtn.rx.controlEvent(.touchUpInside)
            .subscribe( onNext: {[weak self] in
                self?.tapBlock?()
                }
            ).disposed(by: disposeBag)
        return okBtn
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        backgroundColor = kThemeWhiteColor
        setupSubViews()
    }
    
    private func setupSubViews() {
        
        addSubview(okBtn)
        addSubview(inpuView)
        okBtn.snp.makeConstraints { (maker) in
            maker.width.equalTo(65)
            maker.right.equalTo(-15)
            maker.top.equalTo(5)
            maker.height.equalTo(30)
        }
        inpuView.snp.makeConstraints { (maker) in
            maker.left.equalTo(10)
            maker.right.equalTo(-10)
            maker.bottom.equalTo(-10)
            maker.height.equalTo(100)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}






