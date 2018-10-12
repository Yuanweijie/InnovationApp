//
//  INBaseView.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/7/25.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import RxSwift

class INBaseView: UIView {
 
    lazy var disposeBag = DisposeBag()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = kWhiteColor
        layer.shadowColor = kShadowColor.withAlphaComponent(0.5).cgColor
        layer.shadowOffset = CGSize(width: 0, height: -2)
        layer.shadowOpacity = 0.3
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews() {
        
    }
    
}
