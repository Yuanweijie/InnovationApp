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
    
    var tapBlock:((_ result: [FImageModel]) -> ())?
    var chooseDatas: [FImageModel]?
    var datas: [FImageModel]?
    var imageSize:CGSize = CGSize(width: (kScreenW-8)/4.0, height: (kScreenW-8)/4.0)
    
    private lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = imageSize
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.sectionInset = UIEdgeInsets.init(top: 1, left: 1, bottom: 1, right: 1)
        
        var collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = kBgColor
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FCameraCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    private lazy var bottomView: FCameraBottomView = {
        var view = FCameraBottomView()
        view.doneBlock = { [weak self] in
            if let selHandler = self?.tapBlock {
                selHandler(self?.chooseDatas ?? [])
                self?.navigationController?.popViewController(animated: true)
            }
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "所有照片"
        setupView()
        chooseDatas = []
        datas = []
        getPermission()
    }
    
    private func setupView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (maker) in
            maker.top.left.right.equalTo(view)
            maker.bottom.equalTo(-((kStatusBarHeight > 20 ? 34 : 0) + 44))
        }
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (maker) in
            maker.bottom.left.right.equalTo(view)
            maker.height.equalTo((kStatusBarHeight > 20 ? 34 : 0) + 44)
        }
    }
    
    //获取相册权限
    private func getPermission() {
        PHPhotoLibrary.requestAuthorization({ [weak self] (status) in
            
            if status == .authorized {  //已经有权限
                self?.getAllPhoto()
            } else {
                MBProgressHUD.showError(error: "没有开启权限")
            }
            
        })
    }
     //获取所有资源图片
    private func getAllPhoto() {
        let allPhotosOptions = PHFetchOptions()
        //按照创建时间倒序排列
        allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate",
                                                             ascending: false)]
        //只获取图片
        allPhotosOptions.predicate = NSPredicate(format: "mediaType = %d",
                                                 PHAssetMediaType.image.rawValue)
        var datas: PHFetchResult<PHAsset>!
        datas = PHAsset.fetchAssets(with: PHAssetMediaType.image,
                                    options: allPhotosOptions)
        
        DispatchQueue.global().async {
            datas.enumerateObjects({ [weak self] (asset, count, stop) in
                if asset.mediaType == .image {
                    let model = FImageModel()
                    model.phAsset = asset
                    self?.reloadImage(model: model)
                    self?.datas?.append(model)
                } else if asset.mediaType == .video {

                }
            })
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    private func reloadImage(model:FImageModel) {
        if model.phAsset != nil {
            let options = PHImageRequestOptions()
            options.isSynchronous = true
            options.isNetworkAccessAllowed = true
            PHImageManager.default().requestImage(for: model.phAsset!, targetSize: imageSize, contentMode: .aspectFill, options: options) { (image, _) in
                model.image = image
            }
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
        return datas?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:FCameraCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FCameraCollectionViewCell
        let model = datas?[indexPath.row]
        cell.model = model
        cell.tapBlock = { [weak self] item in
            self?.chooseAct(model: item)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }
    
    func chooseAct(model : FImageModel) {
        
        for (index,items) in (chooseDatas ?? []).enumerated() {
            if items == model {
                model.isChoose = false
                chooseDatas?.remove(at: index)
                reloadCollect()
                return
            }
        }
        
        if (chooseDatas ?? []).count >= 9 {
            MBProgressHUD.showError(error: "不能超过9张")
            return
        }
        model.isChoose = true
        chooseDatas?.append(model)
        reloadCollect()
    }
    
    func reloadCollect() {
        
        for items in datas ?? [] {
            for (index, itemss) in (chooseDatas ?? []).enumerated() {
                if itemss == items {
                    items.index = index
                }
            }
        }
        
        collectionView.reloadData()
        print("-------")
        print(chooseDatas ?? [])
        print(chooseDatas?.count ?? 0)
        print("-------")
        
    }
    
}

