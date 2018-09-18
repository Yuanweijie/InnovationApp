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


class RefreshViewController: INBaseTableViewController {

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
    
    lazy var loadingView: INBaseLoadingView = {
        var loadingView = INBaseLoadingView()
        return loadingView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showRefreshHeader = true
        showRefreshFooter = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func setupSubViews() {
        super.setupSubViews()
        view.addSubview(loadingView)
        loadingView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
    
    func getListData(complite: (()->())?){ }

}



