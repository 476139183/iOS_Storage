//
//  CQButton3.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/13.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class CQButton3: UIButton {

    @IBInspectable var labelFont: UIFont = UIFont.systemFont(ofSize: 12) {
        didSet {
            print("ss")
        }
    }

}

class MyView3: UIView {
    @IBInspectable var labelFont: UIFont = UIFont.systemFont(ofSize: 12) {
        didSet {
            print("dhdh")
        }
    }
}
