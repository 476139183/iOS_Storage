//
//  MyStackNode.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/13.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class MyStackNode: ASCellNode {
    
    let labelNode = ASTextNode()
    
    override init() {
        super.init()
    }
    
    override func didLoad() {
        super.didLoad()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec.init(direction: .vertical, spacing: 10, justifyContent: .start, alignItems: .baselineFirst, children: [labelNode])
    }

}
