//
//  InputViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/5/2.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
class InputViewController: RefreshViewController {
    
    
    lazy var bootomView : UIView = {
        var bootomView : UIView = UIView()
        bootomView.backgroundColor = kThemeWhiteColor
        return bootomView
    }()
    
    lazy var inpuView : UITextView = {
        var inpuView : UITextView = UITextView()
        inpuView.layer.borderWidth = 1
        inpuView.layer.borderColor = kThemeBgColor.cgColor
        inpuView.font = Font(size: 16)
        inpuView.toolbarPlaceholder = "短信内容"
        return inpuView
    }()
    
    lazy var okBtn : UIButton = {
        var okBtn : UIButton = UIButton()
        okBtn.layer.cornerRadius = 3
        okBtn.layer.masksToBounds = true
        okBtn.setTitle("发送", for: .normal)
        okBtn.titleLabel?.font = Font(size: 15.0)
        okBtn.setTitleColor(kThemeWhiteColor, for: .normal)
        okBtn.backgroundColor = kThemeBlueColor
        return okBtn
    }()
    
    
    lazy var searchView : UIView = {
        var searchView : UIView = UIView()
        searchView.backgroundColor = kThemeWhiteColor
        searchView.frame = CGRect(x: 0, y: 0, width: kScreenW-150, height: 40)
        return searchView
    }()
    lazy var searchImg : UIImageView = {
        var searchImg : UIImageView = UIImageView()
        searchImg.image = GetImage(name: "home_searchBlue")
        searchImg.frame = CGRect(x: 0, y: 10, width: 20, height: 20)
        return searchImg
    }()
    
    lazy var searchTF : UITextField = {
        var searchTF : UITextField = UITextField()
        searchTF.backgroundColor = kThemeWhiteColor
        searchTF.returnKeyType = .search
        searchTF.placeholder = "搜索话术"
        searchTF.frame = CGRect(x: 25, y: 0, width: kScreenW-180, height: 40)
        return searchTF
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = searchView

        showRefreshHeader = true
        showRefreshFooter = true
        tableView.mj_header.beginRefreshing()

    }
    
    override func setupSubViews() {
        searchView.addSubview(searchImg)
        searchView.addSubview(searchTF)
        
        
        view.addSubview(bootomView)
        bootomView.snp.makeConstraints { (maker) in
            maker.left.bottom.right.equalToSuperview()
            maker.height.equalTo(150)
        }
        bootomView.addSubview(okBtn)
        okBtn.snp.makeConstraints { (maker) in
            maker.width.equalTo(65)
            maker.right.equalTo(-15)
            maker.top.equalTo(5)
            maker.height.equalTo(30)
        }
        bootomView.addSubview(inpuView)
        inpuView.snp.makeConstraints { (maker) in
            maker.left.equalTo(10)
            maker.right.equalTo(-10)
            maker.bottom.equalTo(-10)
            maker.height.equalTo(100)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (maker) in
            maker.top.left.right.equalToSuperview()
            maker.bottom.equalTo(bootomView.snp.top)
        }
        
    }
    
    
    override func getListData(complite: (() -> ())?) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            complite!()
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
