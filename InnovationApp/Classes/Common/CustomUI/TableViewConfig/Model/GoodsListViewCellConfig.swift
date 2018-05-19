//
//  GoodsListViewCellConfig.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/5/19.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class GoodsListViewCellConfig: TableViewCellConfig {
    
    var title: String?
    var goodsCellHeight: CGFloat = 100
    
    var selecGoodsCell: ((_ item: GoodsListViewCellConfig, _ index: Int)->())?
    
    
    override init() {
        super.init()
        self.reuseIdentifier = "GoodsListTableViewCell"
        self.cellHeight = 50
    }
    
    var goodsCout : Int = 0 {
        didSet{
            
            cellHeight = CGFloat(Int(goodsCellHeight) * goodsCout) + 50
            
        }
    }
    
}
