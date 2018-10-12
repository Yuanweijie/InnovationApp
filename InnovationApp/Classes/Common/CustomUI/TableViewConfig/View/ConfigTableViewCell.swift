//
//  ConfigTableViewCell.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/5/18.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class ConfigTableViewCell: UITableViewCell {
    
    var config: TableViewCellConfig?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    static func tableViewCellWithTableView(tableView: UITableView, config:TableViewCellConfig) -> ConfigTableViewCell {
        var cell: ConfigTableViewCell? = tableView.dequeueReusableCell(withIdentifier: config.reuseIdentifier) as? ConfigTableViewCell
        if cell == nil {
            cell = self.createCellWithConfig(config: config, reuseIdentifier: config.reuseIdentifier)
        }
        cell?.updateWithConfig(config: config)
        return cell!
    }
    
    static func createCellWithConfig(config: TableViewCellConfig, reuseIdentifier: String) -> ConfigTableViewCell{
        if config is LeftLableViewCellConfig {
            return LeftLableTableViewCell(style: .default, reuseIdentifier: config.reuseIdentifier)
        } else if config is MineHeaderViewCellConfig {
            return MineHeaderTableViewCell(style: .default, reuseIdentifier: config.reuseIdentifier)
        } else if config is SetHeaderViewCellConfig {
            return SetHeaderTableViewCell(style: .default, reuseIdentifier: config.reuseIdentifier)
        } else if config is LineViewCellConfig {
            return LineTableViewCell(style: .default, reuseIdentifier: config.reuseIdentifier)
        } else {
            return ConfigTableViewCell(style: .default, reuseIdentifier: config.reuseIdentifier)
        }
        
        
    }
    
    func updateWithConfig(config: TableViewCellConfig){
        self.config = config
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
