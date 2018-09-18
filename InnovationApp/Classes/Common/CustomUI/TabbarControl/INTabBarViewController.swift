//
//  INTabBarViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/4/25.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class INTabBarViewController: ESTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSubViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension INTabBarViewController {
    // MARK:- 初始化控制器
    private func initSubViewControllers() {
        
        let classNameArr = ["Home", "Find", "Mine"]
        let moduleNameArr = ["首页", "发现", "我的"]
        
        var tabArr: [UIViewController] = []
        
        for i in 0..<classNameArr.count {

            let clsName = classNameArr[i]
            let lowStr = clsName.lowercased()
            let projectName = self.getProjectName()
            let clsType = NSClassFromString(projectName+clsName+"ViewController") as! UIViewController.Type
            let vc = clsType.init()
            vc.title = moduleNameArr[i]
            let image = UIImage(named: "tabbar_icon_" + lowStr + "_normal")
            let selectedImage = UIImage(named: "tabbar_icon_" + lowStr + "_pressed")
            
            vc.tabBarItem = ESTabBarItem.init(INTabbarBouncesContentView(), title: vc.title, image: image, selectedImage: selectedImage)
            UITabBar.appearance().backgroundColor = .white
            UITabBar.appearance().tintColor = .white
            UITabBar.appearance().isTranslucent = false
            
            tabBar.backgroundImage = UIImage.init()
            tabBar.shadowImage = UIImage.init()
            tabBar.layer.shadowColor = kThemeShadowColor.withAlphaComponent(0.5).cgColor
            tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
            tabBar.layer.shadowOpacity = 0.1
            
            let navVc = NavigationController(rootViewController: vc)
            tabArr.append(navVc)
            
        }

        self.viewControllers = tabArr
    }
    
    private func getProjectName() -> String {
        guard let infoDict = Bundle.main.infoDictionary else {
            return "."
        }
        let key = kCFBundleExecutableKey as String
        guard let value = infoDict[key] as? String else {
            return "."
        }
        return value + "."
    }
    
}

