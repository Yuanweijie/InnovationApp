//
//  SetViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/9/27.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class SetViewController: ConfigsTableViewController {
    
    private lazy var section0: TableViewSectionConfig = {
        var section: TableViewSectionConfig = TableViewSectionConfig()
        section.items = [headerConfig]
        return section
    }()
    private lazy var headerConfig: SetHeaderViewCellConfig = {
        var config: SetHeaderViewCellConfig = SetHeaderViewCellConfig()
        return config
    }()
    
    private lazy var section1: TableViewSectionConfig = {
        var section: TableViewSectionConfig = TableViewSectionConfig()
        section.items = [zjxxConfig,zzxxConfig,xlxxConfig,lineConfig]
        return section
    }()
    private lazy var zjxxConfig: LeftLableViewCellConfig = {
        var config: LeftLableViewCellConfig = LeftLableViewCellConfig()
        config.cellHeight = CellFivetyHeight
        config.leftStr = "证件信息"
        config.leftColor = kDarkColor
        config.lineHidden = true
        return config
    }()
    private lazy var zzxxConfig: LeftLableViewCellConfig = {
        var config: LeftLableViewCellConfig = LeftLableViewCellConfig()
        config.cellHeight = CellFivetyHeight
        config.leftStr = "资质信息"
        config.leftColor = kDarkColor
        config.lineHidden = true
        return config
    }()
    private lazy var xlxxConfig: LeftLableViewCellConfig = {
        var config: LeftLableViewCellConfig = LeftLableViewCellConfig()
        config.cellHeight = CellFivetyHeight
        config.leftStr = "学历信息"
        config.leftColor = kDarkColor
        config.lineHidden = true
        return config
    }()
    private lazy var lineConfig: LineViewCellConfig = {
        var config: LineViewCellConfig = LineViewCellConfig()
        return config
    }()
    
    
    private lazy var section2: TableViewSectionConfig = {
        var section: TableViewSectionConfig = TableViewSectionConfig()
        section.items = [lpglConfig,gywmConfig,qchcConfig,tcdlConfig]
        return section
    }()
    private lazy var lpglConfig: LeftLableViewCellConfig = {
        var config: LeftLableViewCellConfig = LeftLableViewCellConfig()
        config.cellHeight = CellFivetyHeight
        config.leftStr = "录屏管理"
        config.leftColor = kDarkColor
        config.lineHidden = true
        config.selectionHandler = { [weak self] item in
            self?.navigationController?.pushViewController(ReplayKitViewController(), animated: true) 
        }
        return config
    }()
    private lazy var gywmConfig: LeftLableViewCellConfig = {
        var config: LeftLableViewCellConfig = LeftLableViewCellConfig()
        config.cellHeight = CellFivetyHeight
        config.leftStr = "关于我们"
        config.leftColor = kDarkColor
        config.lineHidden = true
        return config
    }()
    private lazy var qchcConfig: LeftLableViewCellConfig = {
        var config: LeftLableViewCellConfig = LeftLableViewCellConfig()
        config.cellHeight = CellFivetyHeight
        config.leftStr = "清除缓存"
        config.leftColor = kDarkColor
        config.lineHidden = true
        return config
    }()
    private lazy var tcdlConfig: LeftLableViewCellConfig = {
        var config: LeftLableViewCellConfig = LeftLableViewCellConfig()
        config.cellHeight = CellFivetyHeight
        config.leftStr = "退出登录"
        config.leftColor = kRedColor
        config.rightImgHidden = true
        config.lineHidden = true
        return config
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        view.backgroundColor = kWhiteColor
    }
    
    override func setupSubViews() {
        super.setupSubViews()
        tableViewConfig = TableViewConfigs()
        tableViewConfig?.sections = [section0, section1, section2]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
