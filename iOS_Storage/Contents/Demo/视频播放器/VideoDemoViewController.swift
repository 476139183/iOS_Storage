//
//  VideoDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/23.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class VideoDemoViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var dataArray: [Model] = {
        return [Model.init(title: "MPMoviePlayerController（iOS9已废弃）", targetVC: nil),
                Model.init(title: "AVPlayerViewController（iOS8之后可用）", targetVC: AVPlayerViewControllerVC()),
                Model.init(title: "AVPlayer", targetVC: AVPlayerDemoViewController()),
                Model.init(title: "画中画", targetVC: PictureInPictureViewController()),
                Model.init(title: "ZFPlayer", targetVC: ZFPlayerDemoViewController())]
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(kNavigationBarHeight)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.text = dataArray[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = dataArray[indexPath.row].targetVC else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

fileprivate struct Model {
    
    var title = ""
    var targetVC: UIViewController?
    
}
