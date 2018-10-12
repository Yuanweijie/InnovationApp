//
//  UIBarButtonItem+Touch.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/5/19.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

private var disposeBag = DisposeBag()

extension UIBarButtonItem {
    
    static func item(title: String?, tapAction:(()->())?) -> UIBarButtonItem {
        
        let button = UIButton()
        if let title = title {
            let font = UIFont.systemFont(ofSize: 16)
            let react = title.boundingRect(with: CGSize.init(width: 100, height: 50) , options:[NSStringDrawingOptions.usesFontLeading], attributes: [NSAttributedStringKey.font : font], context: nil)
            button.frame = CGRect(x: 0, y: 0, width: min(react.size.width, 44), height: 50)
            button.setTitle(title, for: .normal)
            button.setTitleColor(kBlueColor, for: .normal)
            button.titleLabel?.font = font
            button.contentHorizontalAlignment = .right
        }
        button.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { 
                tapAction?()
            })
            .disposed(by: disposeBag)
    
        let item = UIBarButtonItem()
        item.customView = button
        return item
        
    }
        
}
