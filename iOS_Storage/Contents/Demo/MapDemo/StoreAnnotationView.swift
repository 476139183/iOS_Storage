//
//  StoreAnnotationView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/18.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class StoreAnnotationView: MKAnnotationView {
    
    private lazy var indexLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        label.backgroundColor = .orange
        return label
    }()
    
    override var annotation: MKAnnotation? {
        didSet {
            
            if let anno = self.annotation as? StoreAnnotation {
                
                self.indexLabel.text = String(anno.index)
                
                if anno.isSelected {
                    self.backgroundColor = .red
                    self.frame = CGRect.init(x: 0, y: 0, width: 90, height: 30)
                    self.setImageWith(NSURL.init(string: "https://www.baidu.com/img/bd_logo1.png?qua=high&where=super") as URL?, placeholder: UIImage.init(named: "location"))
                } else {
                    self.backgroundColor = .green
                    self.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
                }
                
            }
            
        }
        
    }
    
    
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        addSubview(indexLabel)
        indexLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.snp.top)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
