//
//  HomeDetailViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/4/25.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class HomeDetailViewController: RefreshViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "详情"
        tableView.mj_header.beginRefreshing()
    }
    
    override func getListData(complite: (() -> ())?) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5, execute: {
            complite!()
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
