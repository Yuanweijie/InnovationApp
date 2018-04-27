//
//  NavigationController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/4/25.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    //    var backgroundLayer: CAGradientLayer = {
    //        var gradientLayer = CAGradientLayer.init()
    //        gradientLayer.colors = [UIColor.hexColor(0x589EFE).cgColor, UIColor.hexColor(0x2F53D8).cgColor]
    //        gradientLayer.locations = [0 , 1.0]
    //        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
    //        gradientLayer.endPoint = CGPoint.init(x: 1, y: 0)
    //        gradientLayer.frame = CGRect(x: 0, y: -20, width: kScreenW, height: 64)
    //        return gradientLayer
    //    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.setBackgroundImage(UIImage.color(kThemeWhiteColor), for: UIBarPosition.any, barMetrics: .default)
        navigationBar.tintColor = kThemeBlueColor
        navigationBar.barTintColor = kThemeWhiteColor
        navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor : kThemeBlackColor,
            NSAttributedStringKey.font : boldFont(size: 18)]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font : Font(size: 15)], for: .normal)
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-10, -1), for: .default)
        // 设置导航栏样式
        navigationBar.shadowImage = UIImage()
        navigationBar.backIndicatorImage = UIImage(named: "nav_return")
        navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "nav_return")
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count == 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    
    
}
