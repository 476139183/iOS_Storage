//
//  UIView+Status.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/2/20.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

enum viewState {
    case normal
    case loading
    case empty
}

extension UIView {
    
    func changeToState(_ state: viewState) {
        switch state {
        case .normal:
            self.backgroundColor = .orange
        case .loading:
            self.backgroundColor = .red
        case .empty:
            self.backgroundColor = .green
        }
    }
    
}
