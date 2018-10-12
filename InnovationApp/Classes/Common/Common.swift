//
//  Common.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/4/25.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

let kScreenH = UIScreen.main.bounds.size.height
let kScreenW = UIScreen.main.bounds.size.width
//状态栏高度
let kStatusBarHeight : NSInteger = NSInteger(UIApplication.shared.statusBarFrame.size.height)
let kTopBarHeight = 44
let kNavHeight = kStatusBarHeight + kTopBarHeight
let kBottomHeight = kStatusBarHeight > 20 ? 34 : 0

// 服务器地址
let BASE_URL = "http://demo.guanjiaapp.net:8889/"

// MARK:- 颜色方法
let kBlueColor = UIColor.hexColor(0x2396FF)
let kWhiteColor = UIColor.hexColor(0xFFFFFF)
let kBlackColor = UIColor.hexColor(0x000000)
let kDarkColor = UIColor.hexColor(0x888888)
let kBgColor = UIColor.hexColor(0xF1F2F8)
let kShadowColor = UIColor.hexColor(0x7A7E83)
let kThreeColor = UIColor.hexColor(0x333333)
let kNavBlueColor = UIColor.hexColor(0x589EFE)
let kLineColor = UIColor.hexColor(0xE8E8E8)
let kRedColor = UIColor.hexColor(0xFF373F)


func GetImage(name: String) -> UIImage {
    return UIImage.init(named: name)!
}

func Font(size : CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size)
}

func boldFont(size : CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: size)
}





