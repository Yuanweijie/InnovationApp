//
//  FindViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/7/4.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import Photos

class FindViewController: RefreshViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FindTableViewCell.self, forCellReuseIdentifier: "FindTableViewCell")
        tableView.mj_header.beginRefreshing()
        tableView.separatorStyle = .none
        setNavCameraView()
    }
    
    func setNavCameraView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem.item(title: "相册", tapAction: { [weak self] in
            let cameraVC = FCameraViewController()
            self?.navigationController?.pushViewController(cameraVC, animated: true)
            cameraVC.tapBlock = { assetArr in
                
                DispatchQueue.global().async {
                    for model in assetArr {
                        PHImageManager.default().requestImage(for: model.phAsset!, targetSize: CGSize(width: 300, height: 300), contentMode: .aspectFill, options: nil) { (image, _) in
                            model.image = image
                        }
                    }
                    self?.dataSource = assetArr
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.3, execute: {
                        self?.tableView.reloadData()
                    })
                }
                
            }
        })
    }
    
    
    override func getListData(complite: (() -> ())?) {
         complite!()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : FindTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "FindTableViewCell", for: indexPath) as! FindTableViewCell)
        let model: FImageModel = self.dataSource[indexPath.row] as! FImageModel
        cell.imageV.image = model.image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
