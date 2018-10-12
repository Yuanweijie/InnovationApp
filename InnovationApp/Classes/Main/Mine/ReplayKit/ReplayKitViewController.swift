//
//  ReplayKitViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/10/12.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import ReplayKit

class ReplayKitViewController: INBaseViewController {
    
    private lazy var startBtn: UIButton = {
        var btn : UIButton = UIButton()
        btn.setTitle("开始录屏", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.backgroundColor = kBlueColor
        btn.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                self?.startReplay()
            })
            .disposed(by: disposeBag)
        return btn
    }()
    
    private lazy var stopBtn: UIButton = {
        var btn : UIButton = UIButton()
        btn.setTitle("停止录屏", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.backgroundColor = kBlueColor
        btn.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                self?.stopReplay()
            })
            .disposed(by: disposeBag)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "录屏"
        setupView()
        isReplayAvailable()
    }
    
    private func setupView() {
        view.addSubview(startBtn)
        view.addSubview(stopBtn)
        startBtn.snp.makeConstraints { (maker) in
            maker.top.equalTo(100)
            maker.centerX.equalTo(view)
            maker.width.equalTo(100)
            maker.height.equalTo(40)
        }
        stopBtn.snp.makeConstraints { (maker) in
            maker.top.equalTo(160)
            maker.left.equalTo(startBtn)
            maker.width.equalTo(100)
            maker.height.equalTo(40)
        }
    }
    
    private func isReplayAvailable() {
        if RPScreenRecorder.shared().isAvailable {
            
        } else {
            MBProgressHUD.showError(error: "该设备不支持录屏")
        }
    }
    
    private func startReplay() {
        
        if #available(iOS 10.0, *) {
            RPScreenRecorder.shared().startRecording { (error) in
                if (error != nil) {
                    print(error ?? "--error--")
                } else {
                    
                }
            }
        } else {
            // Fallback on earlier versions
            MBProgressHUD.showError(error: "iOS10以上系统支持")
        }
        
    }
    
    private func stopReplay() {
        RPScreenRecorder.shared().stopRecording { (previewViewController, error) in
            if (error != nil) {
                
                DispatchQueue.main.async {
                    MBProgressHUD.showError(error: (error?.localizedDescription ?? "error"))
                }
                
            } else {
                if (previewViewController != nil) {
                    previewViewController?.previewControllerDelegate = self
                    self.present(previewViewController!, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ReplayKitViewController: RPPreviewViewControllerDelegate {
    func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
        previewController.dismiss(animated: true, completion: nil)
    }
    
    func previewController(_ previewController: RPPreviewViewController, didFinishWithActivityTypes activityTypes: Set<String>) {

    }
}
