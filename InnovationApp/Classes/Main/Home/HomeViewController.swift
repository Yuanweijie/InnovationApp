//
//  HomeViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/4/25.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: INBaseViewController {
    
    private lazy var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        
        NetworkTool.loadUserDetailDongtaiList(userId: 8, maxCursor: 0, completionHandler: { (datas) in
            
        }) { (error) in
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        UIApplication.shared.statusBarStyle = .lightContent
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        UIApplication.shared.statusBarStyle = .default
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupNav() {
        let homeNav = HomeNavView()
        homeNav.addBtn.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.pushViewController(HomeDetailViewController(), animated: true)
            })
            .disposed(by: disposeBag)
        homeNav.searchBtn.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.pushViewController(HomeDetailViewController(), animated: true)
            })
            .disposed(by: disposeBag)
        view.addSubview(homeNav)
        homeNav.snp.makeConstraints { (maker) in
            maker.top.left.right.equalToSuperview()
            maker.height.equalTo(kTopBarHeight + kStatusBarHeight)
        }
    }
    
    
}


