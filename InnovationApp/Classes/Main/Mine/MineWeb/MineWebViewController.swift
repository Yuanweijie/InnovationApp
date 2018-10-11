//
//  MineWebViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/9/27.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import WebKit

//MARK:- h5链接
let TBFishHTML:String = "https://ip.m.alibaba.com/?spm=a2115o.8783827.0.0"
let YuLeBaoHTML:String = "http://yulebao.m.taobao.com"
let TBXMMHTML:String = "https://h5.m.taobao.com/alicare/index.html"
let GOODSDETAILHTML:String = "http://demo.guanjiaapp.net/app/tGoodsController.do?goodsDetailNew#/goods/detail?goodsId=2c978082665bf22101665bf922090008&userid=c982fd88af5e49088a698cb85f75fbd1&guideId=c982fd88af5e49088a698cb85f75fbd1&retailerId=2c92808655c8cf010155e2fabca90090"

//MARK:- js方法
let GoToCouponName:String = "goToCoupon"

class MineWebViewController: INBaseWebViewController {
    
    var urlStr:String = "www.baidu.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func requestUrl() {
        let url:URL = URL(string: urlStr)!
        let request:URLRequest = URLRequest(url: url)
        webView.load(request)
        setJSConfig()
    }
    
    private func setJSConfig() {
        webView.configuration.userContentController.add(WeakScriptMessageDelegate.init(self), name: GoToCouponName)
    }
    
    deinit {
        webView.configuration.userContentController.removeScriptMessageHandler(forName: GoToCouponName)
    }
    
    override func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == GoToCouponName {
            print(message.body)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
