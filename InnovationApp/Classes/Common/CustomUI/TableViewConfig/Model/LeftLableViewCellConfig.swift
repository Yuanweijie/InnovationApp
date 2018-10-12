//
//  LeftLableViewCellConfig.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/9/14.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class LeftLableViewCellConfig: TableViewCellConfig {
    
    var leftStr: String?
    var leftColor: UIColor = kBlackColor
    var rightImgHidden:Bool = false
    var lineHidden:Bool = false
    
    override init() {
        super.init()
        self.reuseIdentifier = "LeftLableTableViewCell"
        self.cellHeight = CellSixtyHeight
    }
    
}
