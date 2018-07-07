//
//  FCameraViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/7/4.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import Photos

class FCameraViewController: INBaseViewController {
    
    lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        
        var collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = kThemeWhiteColor
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FCameraCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        layout.itemSize = CGSize.init(width: (kScreenW-8)/4.0, height: (kScreenW-8)/4.0)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.sectionInset = UIEdgeInsets.init(top: 1, left: 1, bottom: 1, right: 1)
        collectionView.collectionViewLayout = layout
        
        return collectionView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension FCameraViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    //返回cell 上下左右的间距
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
//    //这个是设定header和footer的方法，根据kind不同进行不同的判断即可
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//        if kind == "UICollectionElementKindSectionHeader"{
//            let resuableView = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionHeader", withReuseIdentifier: "header", for: indexPath) as! IMCollectionReusableView
//            resuableView.resuableKindLabel.text = "header"
//            resuableView.backgroundColor = UIColor.red
//            return resuableView
//        }else{
//            let resuableView = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionFooter", withReuseIdentifier: "footer", for: indexPath) as! IMCollectionReusableView
//            resuableView.resuableKindLabel.text = "footer"
//            resuableView.backgroundColor = UIColor.blue
//            return resuableView
//        }
//    }
//    //header高度
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize.init(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height*0.1)
//    }
//    //footer高度
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize.init(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height*0.1)
//    }
    
}

