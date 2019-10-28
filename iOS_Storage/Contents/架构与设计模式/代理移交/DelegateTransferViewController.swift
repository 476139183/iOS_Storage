//
//  DelegateTransferViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class DelegateTransferViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

protocol CustomTopViewDelegate: class {
    
    func topViewDidClickConfirmButton(_ topView: CustomTopView)
    
}

class CustomTopView: UIView {
    
    weak var delegate: CustomTopViewDelegate?
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("确定", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func confirmButtonClicked() {
        delegate?.topViewDidClickConfirmButton(self)
    }
    
}


class CustomRedView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}





class CustomGreenView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class CustomBlueView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
