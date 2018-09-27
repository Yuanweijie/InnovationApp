//
//  MineWebViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/9/27.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

let TBFishHTML:String = "https://ip.m.alibaba.com/?spm=a2115o.8783827.0.0"
let YuLeBaoHTML:String = "http://yulebao.m.taobao.com"
let TBXMMHTML:String = "https://h5.m.taobao.com/alicare/index.html"


class MineWebViewController: INBaseWebViewController {
    
    var urlStr:String = "www.baidu.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func requestUrl() {
        let url:URL = URL(string: urlStr)!
        let request:URLRequest = URLRequest(url: url)
        webView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
