//
//  Common.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/4/25.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

// 屏幕宽度
let kScreenH = UIScreen.main.bounds.size.height
// 屏幕高度
let kScreenW = UIScreen.main.bounds.size.width
//状态栏高度
let kStatusBarHeight : NSInteger = NSInteger(UIApplication.shared.statusBarFrame.size.height)
let kTopBarHeight = 44
let kNavHeight = kStatusBarHeight + kTopBarHeight

// 服务器地址
let BASE_URL = "http://demo.guanjiaapp.net:8889/"

// MARK:- 颜色方法
func kRGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

let kThemeBlueColor = UIColor.hexColor(0x2396FF)
let kThemeWhiteColor = UIColor.hexColor(0xFFFFFF)
let kThemeBlackColor = UIColor.hexColor(0x000000)
let kThemeBgColor = UIColor.hexColor(0xF1F2F8)
let kThemeShadowColor = UIColor.hexColor(0x7A7E83)
let kThreeColor = UIColor.hexColor(0x333333)
let kNavBlueColor = UIColor.hexColor(0x589EFE)
let kLineColor = UIColor.hexColor(0xE8E8E8)




func GetImage(name: String) -> UIImage {
    return UIImage.init(named: name)!
}

func Font(size : CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size)
}
func boldFont(size : CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: size)
}





