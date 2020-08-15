//
//  RecordsManager.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/15.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

struct RecordsManager {
    
    private static let key = "records_key"
    private static var records: [String] = [] {
        didSet {
            UserDefaults.standard.setValue(records, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
    
    /// 添加一条记录
    static func addItem(_ item: String) {
        // 移除已有相同记录
        records = records.filter { (str) -> Bool in
            str != item
        }
        records.insert(item, at: 0)
    }
    
    /// 获取所有记录
    static func getAll() -> [String] {
        return UserDefaults.standard.value(forKey: key) as? [String] ?? []
    }
    
    /// 清空
    static func clear() {
        records = []
    }
    
}
