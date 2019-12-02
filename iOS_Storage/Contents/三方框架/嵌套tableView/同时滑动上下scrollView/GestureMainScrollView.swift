//
//  GestureMainScrollView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class GestureMainScrollView: UIScrollView, UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // 滑动绿色scrollView时一起滚动
        if otherGestureRecognizer.view?.isMember(of: GestureGreenChildScrollView.self) ?? true {
            return true
        } else {
            return false
        }
    }

}
