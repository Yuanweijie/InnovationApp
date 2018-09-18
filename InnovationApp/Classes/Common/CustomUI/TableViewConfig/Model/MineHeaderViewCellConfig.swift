//
//  MineHeaderViewCellConfig.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/9/14.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class MineHeaderViewCellConfig: TableViewCellConfig {
    
    override init() {
        super.init()
        self.reuseIdentifier = "MineHeaderTableViewCell"
        self.cellHeight = 250
    }
}
