//
//  InputViewController.swift
//  InnovationApp
//
//  Created by 袁炜杰 on 2018/5/2.
//  Copyright © 2018年 袁炜杰. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import MBProgressHUD

class InputViewController: RefreshViewController {
    
    
    lazy var bootomView : InputTextView = {
        var bootomView : InputTextView = InputTextView()
        bootomView.tapBlock = {
            MBProgressHUD.showMessage(message: "加载中...")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                MBProgressHUD.hideHUD()
            })
        }
        return bootomView
    }()
    
    lazy var searchView : UIView = {
        var searchView : UIView = UIView()
        searchView.backgroundColor = kThemeWhiteColor
        searchView.frame = CGRect(x: 0, y: 0, width: kScreenW-150, height: 40)
        return searchView
    }()
    lazy var searchImg : UIImageView = {
        var searchImg : UIImageView = UIImageView()
        searchImg.image = GetImage(name: "home_searchBlue")
        searchImg.frame = CGRect(x: 0, y: 10, width: 20, height: 20)
        return searchImg
    }()
    lazy var searchTF : UITextField = {
        var searchTF : UITextField = UITextField()
        searchTF.backgroundColor = kThemeWhiteColor
        searchTF.delegate = self
        searchTF.returnKeyType = .search
        searchTF.placeholder = "搜索话术"
        searchTF.frame = CGRect(x: 25, y: 0, width: kScreenW-180, height: 40)
        searchTF.addTarget(self, action: #selector(changeTetx), for: .editingChanged)
        return searchTF
    }()
    
    @objc func changeTetx() {
        let selectedRange = self.searchTF.markedTextRange
        if selectedRange == nil || (selectedRange?.isEmpty)! {
            if let text: String = self.searchTF.text {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6, execute: {
                    print(text)
                    self.tableView.mj_header.beginRefreshing()
                })
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchView
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        tableView.mj_header.beginRefreshing()
    }
    
    override func setupSubViews() {
        searchView.addSubview(searchImg)
        searchView.addSubview(searchTF)
        view.addSubview(bootomView)
        view.addSubview(tableView)
        bootomView.snp.makeConstraints { (maker) in
            maker.left.bottom.right.equalToSuperview()
            maker.height.equalTo(150+kBottomHeight)
        }
        tableView.snp.makeConstraints { (maker) in
            maker.top.left.right.equalToSuperview()
            maker.bottom.equalTo(bootomView.snp.top)
        }
        
    }
    
    override func getListData(complite: (() -> ())?) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            self.dataSource.append("可能很多人冲着帅气的教练去的，那种肌肉，羡慕是羡慕的，但是大部分的人又推三阻四，不是今天有事就是明天有事，不能坚持下来，因为我家里有女儿的关系，我也不能天天去打卡，刚办完卡也是要视情况而定。周一女儿去上英语课，我老妈负责接送她，我就可以去上健身训练课了。")
            self.dataSource.append("最近有个活动还蛮吸引的，三个月坚持打卡30天，就延长一个月会籍。这个实施的效果很好，鼓励大家多多健身，有个完美曲线。")
            self.dataSource.append("我喜欢周一的课程，一个美女老师，有着蜜臀翘臀，大长腿，大腿线条匀称，小腿修长。腰很细，胸部挺拔，脖子柔美，手臂肌肉健硕，穿着紧身健身服看得很明显，扎着个马尾很干练。当然了，颜值也很高的。想看看她的马甲线，因为穿的健身服没机会露出来，但还是很羡慕她的身材的！")
            self.dataSource.append("每次她的课会员就很多，这节课是瘦身操，一组操有深蹲动作，甩臂，踢腿，跳跃，拉伸等。她正确的示范，也把动作要领告诉大家。教到细致方式方法，还把一些错误的动作也示范加以告诫。有氧动作加上深呼吸。呼吸也讲究，不要用嘴呼吸，要用鼻吸鼻呼的方式，这样可以把能量锁在体内。在深蹲动作时候，背要挺直。臀部肌肉绷紧，腿打直，不能弯。在完成身体向前的运动，膝盖微微弯曲，这样保护膝盖，免受伤害。每次上完课大汗淋漓，很爽很快乐! ")
            self.dataSource.append("女孩也要做些机械类运动，比如杠铃。瘦身操之后是杠铃操，配合踏板，男教练也是很好，他说平时不爱说话，只要上了课，他在操房就会光芒四射的把最闪耀的留给我们。他会把很多核心的内容加进去。每个人举着杠铃练起来，深蹲，抓举得动作都会讲解，怎样才不伤到自己。我们女同胞都是他的粉丝，他微信名是“隔壁邻居家的小哥哥”，我们有了这个群，他过年发红包，他每天会在群里预报天气，分享健身的喜悦，还有些学员询问他如何练马甲线，他说跟着我练，把要领记住就行。我们喜欢这“隔壁邻居家的小哥哥”。")
            self.dataSource.append("因为女儿在家也要多陪陪她，只要我休息的这一天，幼儿园接她，回到家就陪她，陪她讲讲英语，认认字母，学学数学，学好了，教她瑜伽。小孩身体真软，她很喜欢。姿势做得不标准，但是很到位了。值得称赞。这就是劳逸结合啦。")
            
            complite!()
        })
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : HomeTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell)
        cell.titleLab.text = self.dataSource[indexPath.row] as? String
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let contentStr : String = self.dataSource[indexPath.row] as? String ?? ""
        let heightS = AppUtils.countTextHeight(contentStr, width: kScreenW-20 , font: 17)
        return heightS + 20
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contentStr : String = self.dataSource[indexPath.row] as? String ?? ""
        self.bootomView.inpuView.text = contentStr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

extension InputViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
//        textField.resignFirstResponder()
//        tableView.mj_header.beginRefreshing()
        return true
    }
    
}


