//
//  HomeViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/4/25.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewController: INBaseViewController {
    
    //歌曲列表数据源
    let musicListViewModel = MusicListViewModel()
    
    lazy var tableView: UITableView = {
        var tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        
        NetworkTool.loadUserDetailDongtaiList(userId: 8, maxCursor: 0, completionHandler: { (datas) in
            
        }) { (error) in
            
        }
       
        
//        let image: UIImageView = UIImageView(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
//        image.kf.setImage(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1525943087307&di=2568349d26d6b884a28bdc5e51bcfc53&imgtype=0&src=http%3A%2F%2Fimg10.cache.hxsd.com%2Fgame%2F2015%2F11%2F10%2F691428_1447126393_22.jpg"))
//        view.addSubview(image)
        
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
                self?.navigationController?.pushViewController(InputViewController(), animated: true)
            })
            .disposed(by: disposeBag)
        view.addSubview(homeNav)
        homeNav.snp.makeConstraints { (maker) in
            maker.top.left.right.equalToSuperview()
            maker.height.equalTo(kNavHeight)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (maker) in
            maker.left.right.bottom.equalToSuperview()
            maker.top.equalTo(homeNav.snp.bottom)
        }
        
        musicListViewModel.data
            .bind(to: tableView.rx.items(cellIdentifier: "HomeTableViewCell", cellType: HomeTableViewCell.self)) {_, music, cell in
                cell.titleLab.text = music.name + music.singer
        }.disposed(by: disposeBag)
        
        
        tableView.rx.modelSelected(Music.self).subscribe(onNext: { music in
            print("你选中的歌曲信息【\(music)】")
        }).disposed(by: disposeBag)
        
    }
    
    
    
    
}


