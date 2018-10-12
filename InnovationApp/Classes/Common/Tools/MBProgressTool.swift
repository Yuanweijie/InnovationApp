//
//  MBProgressTool.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/5/9.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import MBProgressHUD

extension MBProgressHUD {
    
    private static func show(text: String, icon: String) {
        let hud = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
        hud.label.text = text
        hud.contentColor = kWhiteColor
        hud.bezelView.style = .solidColor
        hud.bezelView.color = kBlackColor
        hud.customView = UIImageView.init(image: UIImage(named: icon))
        hud.mode = .customView
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: 2.0)
    }
    static func showError(error: String) {
        show(text: error, icon: "error.png")
    }
    static func showSuccess(success: String) {
        show(text: success, icon: "success.png")
    }
    
    
    private static var messageHUD : MBProgressHUD = MBProgressHUD()
    
    static func showMessage(message: String) {
        messageHUD = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
        messageHUD.label.text = message
        messageHUD.removeFromSuperViewOnHide = true
    }
    
    static func hideHUD() {
        messageHUD.hide(animated: true)
    }
    
}

