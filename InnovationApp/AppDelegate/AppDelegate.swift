//
//  AppDelegate.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/4/25.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let rootVc = INTabBarViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootVc
        window?.makeKeyAndVisible()
        
        IQKeyboardManager.shared.enable = true
//        IQKeyboardManager.shared.keyboardDistanceFromTextField = 0
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
      
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
       
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
 
    }

    func applicationWillTerminate(_ application: UIApplication) {
       
    }


}

