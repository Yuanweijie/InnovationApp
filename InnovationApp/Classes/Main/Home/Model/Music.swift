//
//  Music.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/4/27.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit

struct Music {
    let name: String
    let singer: String
    
    init(name: String, singer: String) {
        self.name = name
        self.singer = singer
    }
    
}

extension Music: CustomStringConvertible {
    var description: String {
        return "name：\(name) singer：\(singer)"
    }
    
}
