//
//  MyEditViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/5/18.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import MBProgressHUD

class MyEditViewController: ConfigsTableViewController {
    
    lazy var section0: TableViewSectionConfig = {
        var section0: TableViewSectionConfig = TableViewSectionConfig()
        section0.items = [goodsListConfig]
        section0.headerHeight = 10
        return section0
    }()
    
    lazy var goodsListConfig: GoodsListViewCellConfig = {
        var goodsListConfig: GoodsListViewCellConfig = GoodsListViewCellConfig()
        goodsListConfig.title = "商品清单"
        goodsListConfig.selecGoodsCell = { [weak self] item, index in
            MBProgressHUD.showSuccess(success: "这是啥\(index)")
        }
        return goodsListConfig
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfig = TableViewConfigs()
        tableViewConfig?.sections = [section0]
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.item(title: "完成", tapAction: { [weak self] in
            self?.goodsListConfig.goodsCout =  Int(arc4random() % 100) 
            self?.tableView.reloadData()
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
