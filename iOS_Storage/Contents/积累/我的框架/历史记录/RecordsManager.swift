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
    private static let maxRecordsNum = 10
    private static var records: [String] {
        get {
            UserDefaults.standard.value(forKey: key) as? [String] ?? []
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
    
    /// 添加一条记录
    @discardableResult
    static func addItem(_ item: String) -> [String] {
        // 移除已有相同记录
        records = records.filter { (str) -> Bool in
            str != item
        }
        // 添加到头部
        records.insert(item, at: 0)
        // 最多存10条
        if records.count > maxRecordsNum {
            records.removeLast()
        }
        return records
    }
    
    /// 获取所有记录
    static func getAll() -> [String] {
        records
    }
    
    /// 清空
    @discardableResult
    static func clear() -> [String] {
        records = []
        return records
    }
    
}

