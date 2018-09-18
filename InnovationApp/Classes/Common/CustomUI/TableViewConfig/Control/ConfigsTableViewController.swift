//
//  ConfigsTableViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/5/18.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class ConfigsTableViewController: INBaseViewController {
    
    var tableViewConfig: TableViewConfigs?
    
    lazy var tableView: UITableView = {
        var tableView: UITableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .automatic;
        }
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()

    }
    func setupSubViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(view);
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ConfigsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let config:TableViewCellConfig = self.tableViewConfig?.sections![indexPath.section].items![indexPath.row] {
            return config.cellHeight
        }
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let config = self.tableViewConfig?.sections![indexPath.section].items![indexPath.row] {
            config.selectionHandler?(config)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = kThemeBgColor
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let config = self.tableViewConfig?.sections![section] {
            return config.headerHeight
        }
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if let config = self.tableViewConfig?.sections![section] {
            return config.footerHeight
            
        }
        return CGFloat.leastNormalMagnitude
    }
}

extension ConfigsTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableViewConfig!.sections!.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.tableViewConfig?.sections![section].items?.count {
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let config:TableViewCellConfig = self.tableViewConfig?.sections![indexPath.section].items![indexPath.row] {
            
            let cell: ConfigTableViewCell = ConfigTableViewCell.tableViewCellWithTableView(tableView: tableView, config: config)
            cell.selectionStyle = .none
            return cell
            
        }
        
        return UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
    }
}
