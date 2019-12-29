//
//  CornerAndShadowViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class CornerAndShadowViewController: CQBaseViewController {
    
    private var touchNum = 0
    
    private lazy var redView: UIView = {
        let redView = UIView.init(frame: CGRect.init(x: 90, y: 150, width: 200, height: 90))
        redView.backgroundColor = .red
        redView.clipsToBounds = false
        return redView
    }()
    
    private lazy var orangeView: UIView = {
        let view = UIView()
        view.frame = CGRect.init(x: 90, y: 300, width: 48, height: 48)
        view.backgroundColor = UIColor.colorWithHexString("#FDAE20")
        view.layer.cornerRadius = 24
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.colorWithHexString("#FDAE20").cgColor
        view.layer.shadowColor = UIColor(red: 0.99, green: 0.68, blue: 0.13, alpha: 0.3).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        return view
    }()
    
    private lazy var orangeImageView: CQShadowImageView = {
        let imageView = CQShadowImageView(image: UIImage(named: "AJ1"))
        imageView.frame = CGRect.init(x: 90, y: 300, width: 48, height: 48)
        imageView.layer.cornerRadius = 24
//        imageView.layer.borderWidth = 1
//        imageView.layer.borderColor = UIColor.colorWithHexString("#FDAE20").cgColor
//        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        imageView.customerShadow(withShadowColor: .orange, shadowOpacity: 1, shadowRadius: 10, shadowPathWidth: 2, viewRadius: 20, viewHeight: 48, viewWidth: 48, shadowSide: CQShadowPathSideAllSide)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var shadowView: CQShadowView = {
        let view = CQShadowView()
        view.frame = CGRect.init(x: 90, y: 400, width: 100, height: 100)
        view.backgroundColor = .purple
        view.customerShadow(withShadowColor: .orange, shadowOpacity: 1, shadowRadius: 10, shadowPathWidth: 2, viewRadius: 20, viewHeight: 100, viewWidth: 100, shadowSide: CQShadowPathSideAllSide)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(redView)
        //view.addSubview(orangeView)
        view.addSubview(orangeImageView)
        view.addSubview(shadowView)
        
        let cornerPath = UIBezierPath.init(roundedRect: redView.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize.init(width: 20, height: 20))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = redView.bounds
        maskLayer.path = cornerPath.cgPath
        maskLayer.borderColor = UIColor.red.cgColor
        maskLayer.borderWidth = 2
        maskLayer.shadowColor = UIColor.green.cgColor
        maskLayer.shadowRadius = 5
        
        redView.layer.cornerRadius = 10
        redView.layer.shadowColor = UIColor.blue.cgColor
        redView.layer.shadowRadius = 15
        redView.layer.shadowOpacity = 1 // 不透明度
        redView.layer.shadowPath = cornerPath.cgPath
        
        //redView.layer.mask = maskLayer
        redView.clipsToBounds = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        switch touchNum {
        case 0:
            // 去掉mask，阴影重新出现
            redView.layer.mask = nil
        case 1:
            // clipsToBounds会将阴影切掉
            redView.clipsToBounds = true
        case 2:
            // shadowRadius 阴影半径
            redView.clipsToBounds = false
            redView.layer.shadowRadius = 50
        case 3:
            // 阴影向下偏移50
            redView.layer.shadowOffset = .init(width: 0, height: 50)
        default:
            break
        }
        
        touchNum += 1
        
    }

}
