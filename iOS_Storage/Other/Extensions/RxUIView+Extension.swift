//
//  RxUIView+Extension.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/25.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

extension Reactive where Base: UIView {
    
    var hidden: Observable<Bool> {
        return self.methodInvoked(#selector(setter: self.base.isHidden))
            .map { event -> Bool in
                guard let isHidden = event.first as? Bool else {
                    fatalError()
                }
                
                return isHidden
            }
            .startWith(self.base.isHidden)
    }
    
}
