//
//  NetworkTool.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/4/27.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol NetworkToolProtocol {

   static func loadUserDetailDongtaiList(userId: Int, maxCursor: Int, completionHandler: @escaping (_ tasks: [Any]) -> (), failure: @escaping (_ errorMsg: String ) -> ())

}

extension NetworkToolProtocol {
    
    
    static func requestDataMethod (url: String, params: [String: Any], successHandler: @escaping (_ datas: [String: JSON] ) -> (), failure: @escaping (_ errorMsg: String ) -> () ) {
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            // 网络错误的提示信息
            guard response.result.isSuccess else { failure("网络错误"); return }
            if let value = response.result.value {
                let json = JSON(value)
                guard json["message"] == "success" else {
                    let error : String = json["message"].rawString() ?? ""
                    failure(error)
                    return
                }
                if let data = json["data"].dictionary {
                    successHandler(data)
                }
            }
        }
    }
    
    
    static func loadUserDetailDongtaiList(userId: Int, maxCursor: Int, completionHandler: @escaping (_ tasks: [Any]) -> (), failure: @escaping (_ errorMsg: String ) -> () ) {
        let url = BASE_URL + "loginController.do?exists"
        let params = ["mobile": "",
                      "openId": "o9bqiwm1W_k_ugyB_56t6SsuKPt0"]
        requestDataMethod(url: url, params: params, successHandler: { (datas) in
//            if let dataList = datas["data"]!.arrayObject {
//                completionHandler(task_list.compactMap({ NewYearTask.deserialize(from: $0 as? Dictionary) }))
//            }
        }) { (errorMsh) in
            failure(errorMsh)
        }
    }
    
    
}

struct NetworkTool: NetworkToolProtocol {
  
}
