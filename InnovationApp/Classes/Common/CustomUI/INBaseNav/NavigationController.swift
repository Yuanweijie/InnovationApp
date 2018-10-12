//
//  NavigationController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/4/25.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNav()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count == 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    private func setNav() {
        navigationBar.setBackgroundImage(UIImage.color(kWhiteColor), for: UIBarPosition.any, barMetrics: .default)
        navigationBar.tintColor = kBlueColor
        navigationBar.barTintColor = kWhiteColor
        navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor : kBlackColor,
            NSAttributedStringKey.font : boldFont(size: 18)]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font : Font(size: 15)], for: .normal)
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-8, -1), for: .default)
        // 设置导航栏样式
        navigationBar.shadowImage = UIImage()
        navigationBar.backIndicatorImage = UIImage(named: "nav_return")
        navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "nav_return")
    }
    
}
