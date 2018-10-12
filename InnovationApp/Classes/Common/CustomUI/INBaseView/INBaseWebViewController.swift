
//
//  INBaseWebViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/9/27.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import WebKit

class INBaseWebViewController: INBaseViewController {

    lazy var webView:WKWebView = {
        let webView:WKWebView = WKWebView(frame: CGRect.zero)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        webView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
        return webView
    }()
    
    lazy private var progressView: UIProgressView = {
        let progressView = UIProgressView.init(frame: CGRect(x: CGFloat(0), y: 0, width: UIScreen.main.bounds.width, height: 2))
        progressView.tintColor = kBlueColor      // 进度条颜色
        progressView.trackTintColor = kWhiteColor // 进度条背景色
        return progressView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        requestUrl()
    }
    
    private func setupWebView() {
        view.addSubview(webView)
        view.addSubview(progressView)
        view.bringSubview(toFront: progressView) // 将进度条至于最顶层
        webView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(view)
        }
    }
    
    func requestUrl() {
   
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        //  加载进度条
        if keyPath == "estimatedProgress"{
            progressView.alpha = 1.0
            progressView.setProgress(Float((webView.estimatedProgress) ), animated: true)
            if (webView.estimatedProgress )  >= 1.0 {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseOut, animations: {
                    self.progressView.alpha = 0
                }, completion: { (finish) in
                    self.progressView.setProgress(0.0, animated: false)
                })
            }
        }
        if keyPath == "title" {
            title =  webView.title
        }
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
        webView.removeObserver(self, forKeyPath: "title")
        webView.uiDelegate = nil
        webView.navigationDelegate = nil
    }
    
    override func navigationShouldPopOnBackButton() -> Bool {
        if webView.canGoBack == true {
            webView.goBack()
        } else {
            navigationController?.popViewController(animated: true)
        }
        return false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension INBaseWebViewController: WKUIDelegate, WKNavigationDelegate,WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
   
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error)
    }
    
}

class WeakScriptMessageDelegate: NSObject,WKScriptMessageHandler {
    
    weak var scriptDelegate: WKScriptMessageHandler?
    
    init(_ scriptDelegate: WKScriptMessageHandler) {
        self.scriptDelegate = scriptDelegate
        super.init()
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        scriptDelegate?.userContentController(userContentController, didReceive: message)
    }
    
    deinit {
        print("WeakScriptMessageDelegate is deinit")
    }
    
}


