//
//  SetHeaderViewCellConfig.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/10/12.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class SetHeaderViewCellConfig: TableViewCellConfig {
    
    override init() {
        super.init()
        self.reuseIdentifier = "SetHeaderTableViewCell"
        self.cellHeight = 160
    }
}
