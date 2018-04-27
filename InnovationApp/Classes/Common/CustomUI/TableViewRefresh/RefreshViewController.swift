//
//  RefreshViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/4/25.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import SnapKit
import MJRefresh


class RefreshViewController: INBaseViewController {

    var dataSource: [Any] = []
    var page : Int = 0
    var lastDataCount : NSInteger = 0
    
    
    var showRefreshHeader : Bool = true{
        didSet {
            if showRefreshHeader {
                let header : MJRefreshNormalHeader = MJRefreshNormalHeader{ [weak self] in
                    self?.loadingView.indeiView.startAnimating()
                    self?.page = 1
                    self?.getListData {
                        self?.tableView.mj_header.endRefreshing()
                        self?.tableView.reloadData()
                        if self?.loadingView != nil {
                            self?.loadingView.removeFromSuperview()
                        }
                        if ((self?.tableView.mj_footer) != nil) {
                            if (self?.dataSource.count)! < 10 {
                                self?.tableView.mj_footer.endRefreshingWithNoMoreData()
                                (self?.tableView.mj_footer as? MJRefreshAutoNormalFooter)?.stateLabel.isHidden = true
                            } else {
                                self?.tableView.mj_footer.resetNoMoreData()
                                (self?.tableView.mj_footer as? MJRefreshAutoNormalFooter)?.stateLabel.isHidden = false
                            }
                        }
                    }
                }
                
                self.tableView.mj_header = header
            } else {
                self.tableView.mj_header = nil
            }
        }
    }
    
    var showRefreshFooter : Bool = true{
        didSet {
            if showRefreshFooter {
                let footer : MJRefreshAutoNormalFooter = MJRefreshAutoNormalFooter{ [weak self] in
                    
                    self?.page += 1
                    self?.getListData {
                      
                        self?.tableView.mj_footer.endRefreshing()
                        self?.tableView.reloadData()
                        
                        if ((self?.tableView.mj_footer) != nil) {
                            if self?.lastDataCount != self?.dataSource.count {
                                self?.lastDataCount = self?.dataSource.count ?? 0
                            } else {
                                self?.tableView.mj_footer.endRefreshingWithNoMoreData()
                            }
                        }
                    }
                }
                
                footer.setTitle("正在加载", for: .refreshing)
                footer.setTitle("暂无更多", for: .noMoreData)
                footer.stateLabel.isHidden = true
                self.tableView.mj_footer = footer
            } else {
                self.tableView.mj_footer = nil
            }
        }
    }
    
    lazy var tableView: UITableView = {
        var tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
//        if #available(iOS 11.0, *) {
//            tableView.contentInsetAdjustmentBehavior = .automatic;
//        } else {
//            self.automaticallyAdjustsScrollViewInsets = false
//        }
        return tableView
    }()
    
    lazy var loadingView: INBaseLoadingView = {
        var loadingView = INBaseLoadingView()
        return loadingView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupSubViews() {
        view.addSubview(tableView)
        view.addSubview(loadingView)
        tableView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        loadingView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
    
    func getListData(complite: (()->())?){ }

}

extension RefreshViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}

extension RefreshViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
    }
}

