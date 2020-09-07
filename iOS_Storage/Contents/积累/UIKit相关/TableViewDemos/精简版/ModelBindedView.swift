//
//  ModelBindedView.swift
//  rebate
//
//  Created by 刘磊 on 2020/8/24.
//  Copyright © 2020 dingstock. All rights reserved.
//

import Foundation

protocol ModelBindedView {
    associatedtype ViewModel: Any
    
    func bindModel(_ model: ViewModel)
}
