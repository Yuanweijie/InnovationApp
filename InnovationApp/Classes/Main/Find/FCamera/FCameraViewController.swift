//
//  FCameraViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/7/4.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import Photos
import MBProgressHUD

class FCameraViewController: INBaseViewController {
    
    var tapBlock:((_ result: [FImageModel]) -> ())?
    var chooseDatas: [FImageModel]?
    var datas: [FImageModel]?
    var imageSize:CGSize = CGSize(width: (kScreenW-8)/4.0, height: (kScreenW-8)/4.0)
    
    lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = imageSize
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.sectionInset = UIEdgeInsets.init(top: 1, left: 1, bottom: 1, right: 1)
        
        var collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = kThemeBgColor
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FCameraCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "我的相册"
        setupView()
        setNavDoneView()
        chooseDatas = []
        datas = []
        getPermission()
    }
    
    func setupView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(view)
        }
    }
    
    func setNavDoneView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem.item(title: "完成", tapAction: { [weak self] in
            self?.chooseDatas?.removeAll()
            for mmodel in self?.datas ?? [] {
                if mmodel.isChoose == true {
                    self?.chooseDatas?.append(mmodel)
                }
            }
            
            if self?.chooseDatas?.count ?? 0 > 0 {
                if let selHandler = self?.tapBlock {
                    selHandler(self?.chooseDatas ?? [])
                    self?.navigationController?.popViewController(animated: true)
                }
            } else {
                MBProgressHUD.showError(error: "还没有选择图片")
            }
        })
    }
    
    //获取相册权限
    func getPermission() {
        PHPhotoLibrary.requestAuthorization({ [weak self] (status) in
            
            if status == .authorized {  //已经有权限
                self?.getAllPhoto()
            } else {
                MBProgressHUD.showError(error: "没有开启权限")
            }
            
        })
    }
     //获取所有资源图片
    func getAllPhoto() {
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
            datas.enumerateObjects({ (asset, count, stop) in
                if asset.mediaType == .image {
                    self.reloadImage(asset: asset)
                } else if asset.mediaType == .video {
//                    self.reloadImage(asset: asset)
                }
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: {
                self.collectionView.reloadData()
            })
        }
    }
    func reloadImage(asset:PHAsset) {
        let options = PHImageRequestOptions()
        options.isSynchronous = true
        options.isNetworkAccessAllowed = true
        PHImageManager.default().requestImage(for: asset, targetSize: self.imageSize, contentMode: .aspectFill, options: options) { (image, _) in
            let model = FImageModel()
            model.phAsset = asset
            model.image = image
            self.datas?.append(model)
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
        let model = self.datas?[indexPath.row]
        cell.model = model
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = self.datas?[indexPath.row]
        if model?.isChoose == true {
            model?.isChoose = false
        } else {
            model?.isChoose = true
        }
        collectionView.reloadItems(at: [indexPath])
    }
    
}

