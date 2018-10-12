//
//  INBaseLoadingView.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/4/25.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class INBaseLoadingView: UIView {
    
    lazy var indeiView: NVActivityIndicatorView = {
        var indeiView : NVActivityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero,  type: .ballClipRotate, color: kBlueColor, padding: 0)
        return indeiView
    }()

    override init(frame:CGRect){
        super.init(frame: frame)
        backgroundColor = kBgColor
        setupSubViews()
    }
    
    func setupSubViews() {
        addSubview(indeiView)
        indeiView.snp.makeConstraints { (maker) in
            maker.centerX.centerY.equalToSuperview()
            maker.width.height.equalTo(45)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
