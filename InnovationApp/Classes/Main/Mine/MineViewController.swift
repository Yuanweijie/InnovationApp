//
//  MineViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/4/25.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit


class MineViewController: ConfigsTableViewController {
    
    private lazy var navView: UIView = {
        var view : UIView = UIView()
        view.backgroundColor = kThemeWhiteColor
        view.alpha = 0
        return view
    }()
    private lazy var navtitle: UILabel = {
        var lable : UILabel = UILabel()
        lable.text = "我的"
        lable.textColor = kThemeBlackColor
        lable.font = Font(size: 16)
        return lable
    }()
    private lazy var navSetBtn: UIButton = {
        var btn : UIButton = UIButton()
        btn.setImage(GetImage(name: "mineSet_Black"), for: .normal)
        btn.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                self?.setPushVC()
            })
            .disposed(by: disposeBag)
        return btn
    }()
    private lazy var navLine: UIView = {
        var view : UIView = UIView()
        view.backgroundColor = kLineColor
        return view
    }()
    
    var BackImgHeight:CGFloat = 250
    private lazy var bgImageView: UIImageView = {
        var imageV : UIImageView = UIImageView()
        imageV.frame = CGRect(x: 0, y: 0, width: kScreenW, height: BackImgHeight)
        imageV.image = GetImage(name: "mineNavBG")
        imageV.contentMode = .scaleAspectFill
        imageV.clipsToBounds = true
        return imageV
    }()
    private lazy var setBtn: UIButton = {
        var btn : UIButton = UIButton()
        btn.setImage(GetImage(name: "mineSet_white"), for: .normal)
        btn.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                self?.setPushVC()
            })
            .disposed(by: disposeBag)
        return btn
    }()

    private lazy var section0: TableViewSectionConfig = {
        var section: TableViewSectionConfig = TableViewSectionConfig()
        section.items = [headerConfig]
        return section
    }()
    private lazy var headerConfig: MineHeaderViewCellConfig = {
        var config: MineHeaderViewCellConfig = MineHeaderViewCellConfig()
        return config
    }()
    
    private lazy var section1: TableViewSectionConfig = {
        var section: TableViewSectionConfig = TableViewSectionConfig()
        section.items = [xkConfig,kgConfig,bfjlConfig,fqtlConfig,alyscConfig,ylbConfig,bzfkConfig,spxqConfig]
        section.headerHeight = 10
        return section
    }()
    private lazy var xkConfig: LeftLableViewCellConfig = {
        var config: LeftLableViewCellConfig = LeftLableViewCellConfig()
        config.leftStr = "想看的电影"
        return config
    }()
    private lazy var kgConfig: LeftLableViewCellConfig = {
        var config: LeftLableViewCellConfig = LeftLableViewCellConfig()
        config.leftStr = "看过的电影"
        return config
    }()
    private lazy var bfjlConfig: LeftLableViewCellConfig = {
        var config: LeftLableViewCellConfig = LeftLableViewCellConfig()
        config.leftStr = "播放记录"
        return config
    }()
    private lazy var fqtlConfig: LeftLableViewCellConfig = {
        var config: LeftLableViewCellConfig = LeftLableViewCellConfig()
        config.leftStr = "发起的讨论"
        return config
    }()
    private lazy var alyscConfig: LeftLableViewCellConfig = {
        var config: LeftLableViewCellConfig = LeftLableViewCellConfig()
        config.leftStr = "阿里鱼商城"
        config.selectionHandler = { [weak self] item in
            let vc:MineWebViewController = MineWebViewController()
            vc.urlStr = TBFishHTML
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        return config
    }()
    private lazy var ylbConfig: LeftLableViewCellConfig = {
        var config: LeftLableViewCellConfig = LeftLableViewCellConfig()
        config.leftStr = "娱乐宝"
        config.selectionHandler = { [weak self] item in
            let vc:MineWebViewController = MineWebViewController()
            vc.urlStr = YuLeBaoHTML
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        return config
    }()
    private lazy var bzfkConfig: LeftLableViewCellConfig = {
        var config: LeftLableViewCellConfig = LeftLableViewCellConfig()
        config.leftStr = "帮助与反馈"
        config.selectionHandler = { [weak self] item in
            let vc:MineWebViewController = MineWebViewController()
            vc.urlStr = TBXMMHTML
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        return config
    }()
    private lazy var spxqConfig: LeftLableViewCellConfig = {
        var config: LeftLableViewCellConfig = LeftLableViewCellConfig()
        config.leftStr = "商品详情"
        config.selectionHandler = { [weak self] item in
            let vc:MineWebViewController = MineWebViewController()
            vc.urlStr = GOODSDETAILHTML
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        return config
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if tableView.contentOffset.y <= CGFloat(kNavHeight){
           UIApplication.shared.statusBarStyle = .lightContent
        } else {
           UIApplication.shared.statusBarStyle = .default
        }
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        UIApplication.shared.statusBarStyle = .default
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
    
    override func setupSubViews() {
        super.setupSubViews()
        tableViewConfig = TableViewConfigs()
        tableViewConfig?.sections = [section0, section1]
        view.addSubview(bgImageView)
        view.addSubview(tableView)
        view.addSubview(setBtn)
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        setBtn.snp.makeConstraints { (maker) in
            maker.right.equalTo(-15)
            maker.top.equalTo(kStatusBarHeight + 10)
        }
        
        view.addSubview(navView)
        navView.addSubview(navtitle)
        navView.addSubview(navSetBtn)
        navView.addSubview(navLine)
        navView.snp.makeConstraints { (maker) in
            maker.top.left.right.equalTo(view)
            maker.height.equalTo(kNavHeight)
        }
        navtitle.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(navView)
            maker.bottom.equalTo(navView.snp.bottom).offset(-13)
        }
        navSetBtn.snp.makeConstraints { (maker) in
            maker.right.equalTo(-15)
            maker.centerY.equalTo(navtitle)
        }
        navLine.snp.makeConstraints { (maker) in
            maker.height.equalTo(0.5)
            maker.bottom.left.right.equalTo(navView)
        }

        print("abcd")

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsety = scrollView.contentOffset.y
        if contentOffsety <= CGFloat(kNavHeight) {
            UIApplication.shared.statusBarStyle = .lightContent
            navView.alpha = contentOffsety / CGFloat(kNavHeight)
        } else {
            navView.alpha = 1
            UIApplication.shared.statusBarStyle = .default
        }

        var rect = bgImageView.frame
        if contentOffsety < 0 {
            let heightXX = BackImgHeight - contentOffsety
            rect.size.height = heightXX
            rect.size.width = kScreenW * heightXX / BackImgHeight
            rect.origin.x =  -(rect.size.width-kScreenW)/2
            rect.origin.y = 0
        } else {
            rect.size.height = BackImgHeight
            rect.size.width = kScreenW
            rect.origin.x = 0
            rect.origin.y = -contentOffsety
        }
        bgImageView.frame = rect

    }
    
    //MARK: - 设置
    private func setPushVC() {
        navigationController?.pushViewController(SetViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
