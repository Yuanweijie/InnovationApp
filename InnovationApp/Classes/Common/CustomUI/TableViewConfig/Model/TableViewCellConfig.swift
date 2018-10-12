//
//  TableViewCellConfig.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/5/18.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

let CellFivetyHeight:CGFloat = 50
let CellSixtyHeight:CGFloat = 60

class TableViewCellConfig: NSObject {

    var cellHeight: CGFloat = 44
    var reuseIdentifier: String = "TableViewCell"
    
    
    var selectionHandler: ((_ item: TableViewCellConfig)->())?
    
}
