//
//  GoodsListTableViewCell.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/5/19.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

class GoodsListTableViewCell: ConfigTableViewCell {
    
    lazy var titleLabel: UILabel = {
        var titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textColor = kThemeBlackColor
        return titleLabel
    }()
    
    lazy var goodsTable: UITableView = {
        var goodsTable = UITableView(frame: .zero, style: .plain)
        goodsTable.delegate = self
        goodsTable.dataSource = self
        goodsTable.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        goodsTable.isScrollEnabled = false
        return goodsTable
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
    
    func setupSubViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(goodsTable)
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(20)
            maker.left.equalTo(15)
            maker.right.equalTo(0)
            maker.height.equalTo(30)
        }
        goodsTable.snp.makeConstraints { (maker) in
            maker.left.right.bottom.equalTo(0)
            maker.top.equalTo(titleLabel.snp.bottom)
        }
    }
    
    override func updateWithConfig(config: TableViewCellConfig) {
        super.updateWithConfig(config: config)
        
        if let goodsCellConfig = config as? GoodsListViewCellConfig {
            titleLabel.text = goodsCellConfig.title
        }
        goodsTable.reloadData()
        
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

extension GoodsListTableViewCell: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let goodsCellConfig = config as? GoodsListViewCellConfig {
            goodsCellConfig.selecGoodsCell?(goodsCellConfig, indexPath.row)
        }
    }
    
}
extension GoodsListTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let goodsCellConfig = config as? GoodsListViewCellConfig {
            return goodsCellConfig.goodsCout
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let goodsCellConfig = config as? GoodsListViewCellConfig {
            return goodsCellConfig.goodsCellHeight
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : HomeTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell)
        cell.titleLab.text = ""
        return cell
    }
    
    
}

