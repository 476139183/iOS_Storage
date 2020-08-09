//
//  MyBlogViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/7.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import HandyJSON
import Alamofire

class MyBlogViewController: CQBaseViewController {
    
    private var dataArray: [BlogEntity] = []
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.rowHeight = 100
        table.register(.init(nibName: BlogCell.className, bundle: nil), forCellReuseIdentifier: BlogCell.className)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(naviHeight)
            make.left.right.bottom.equalToSuperview()
        }
        
        getBlogList()
        
    }
    
}

extension MyBlogViewController {
    
    // uid: 4212f351f6b5
    // 文章列表: https://www.jianshu.com/asimov/users/slug/4212f351f6b5/public_notes
    // 文章内容: https://www.jianshu.com/asimov/p/f936bb30f105
    
    func getBlogList() {
        let url = URL.init(string: "https://www.jianshu.com/asimov/users/slug/4212f351f6b5/public_notes")!
        AF.request(url, method: .get, parameters: nil).responseString { (response) in
            switch response.result {
                
            case .success(let data):

                let json: AnyObject! = try? JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as AnyObject

                if let array = json as? [AnyObject] {
                    let arr = [BlogEntity].deserialize(from: array)!
                    self.dataArray = arr as! [BlogEntity] ?? []
                    self.tableView.reloadData()
                }

//                print(data)
//                self.dataArray = [BlogEntity].deserialize(from: data as? [String:Any])!
//                break

            case .failure(let error):

                SVProgressHUD.showInfo(withStatus: error.errorDescription)
                
                
//            case .success(let resultString):
//                self.dataArray = [BlogEntity].deserialize(from: resultString)!
//                self.tableView.reloadData()
//            case .failure(let error):
//                SVProgressHUD.showInfo(withStatus: error.errorDescription)
                
                
            }
        }
    }
    
}


// MARK: - UITableView DataSource & Delegate

extension MyBlogViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BlogCell.className, for: indexPath) as! BlogCell
        cell.model = dataArray[indexPath.row].object?.data
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


// MARK: - Model

class BlogEntity: BlogBaseModel {
    
    var object: BlogObject?
    
}

class BlogObject: BlogBaseModel {
    
    var type: Int = 0
    var data: BlogModel?
    
}

class BlogModel: BlogBaseModel {
    
    var id = 0
    var title = ""
    var slug = ""
    var list_image_url = ""
    var first_shared_at = ""
    var public_abbr = ""
    var paid = false
    var commentable = false
    var is_top = false
    var total_fp_amount = 0
    var public_comments_count = 0
    var total_rewards_count = 0
    var likes_count = 0
    var views_count = 0
    var user: BlogUser?
    
}

class BlogUser: BlogBaseModel {
    var id = 0
    var nickname = ""
    var slug = ""
    var avatar = ""
}

class BlogBaseModel: HandyJSON {
    required init() {}
}
