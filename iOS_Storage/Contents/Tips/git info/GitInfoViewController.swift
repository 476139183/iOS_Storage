//
//  GitInfoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/1/2.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GitInfoViewController: DisplayListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let infoDict = Bundle.main.infoDictionary!
        
        self.textArray = [
            "最后提交SHA：\(infoDict["GitCommitSHA"]!)",
            "当前所在分支：\(infoDict["GitCommitBranch"]!)",
            "最后提交用户：\(infoDict["GitCommitUser"]!)",
            "最后提交时间：\(infoDict["GitCommitDate"]!)",
            "本次编译时间：\(infoDict["BuildTime"]!)"
        ]
        
    }

}
