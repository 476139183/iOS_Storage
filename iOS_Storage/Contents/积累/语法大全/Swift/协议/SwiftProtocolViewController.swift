//
//  SwiftProtocolViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SwiftProtocolViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let redView = ColorView.init(color: .red)
        view.addSubview(redView)
        redView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
    }

}

fileprivate class Person {
    
    var name = ""
    var age = 0
    
}


// MARK: - 对属性的规定

// 协议用于指定特定的实例属性或类属性，而不用指定是存储型属性或计算型属性。此外还必须指明是只读的还是可读可写的。
// 协议中的通常用var来声明变量属性，在类型声明后加上 { set get } 来表示属性是可读可写的，只读属性则用{ get }来表示。

fileprivate protocol StudentProtocol {
    
    var studentID: Int { get set }
    var grade: Float { get set }
    
}

fileprivate class Student: Person, StudentProtocol {
    
    var studentID: Int
    var grade: Float
    
    init(id: Int, grade: Float) {
        self.studentID = id
        self.grade = grade
    }
    
}


// MARK: - 对构造器的规定

// 协议可以要求它的遵循者实现指定的构造器

fileprivate protocol ColorInitProtocol {
    
    init(color: UIColor)
    
}

fileprivate class ColorView: UIView, ColorInitProtocol {
    
    required init(color: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - 类专属协议

// 你可以在协议的继承列表中,通过添加class关键字,限制协议只能适配到类（class）类型。
// 该class关键字必须是第一个出现在协议的继承列表中，其后，才是其他继承协议。格式如下：

fileprivate protocol SomeClassOnlyProtocol: class, ColorInitProtocol {
    // 协议定义
}


// MARK: - 协议合成

// Swift 支持合成多个协议，这在我们需要同时遵循多个协议时非常有用。

private protocol BoyName {
    var name: String { get }
}

private protocol BoyAge {
    var age: Int { get }
}

private struct Boy: BoyName, BoyAge {
    var name: String
    var age: Int
}

private func show(celebrator: BoyName & BoyAge) {
    print("\(celebrator.name) is \(celebrator.age) years old")
}


// MARK: - 检查协议的一致性

// 可以使用is和as操作符来检查是否遵循某一协议或强制转化为某一类型。
// is操作符用来检查实例是否遵循了某个协议。
// as?返回一个可选值，当实例遵循协议时，返回该协议类型;否则返回nil。
// as用以强制向下转型，如果强转失败，会引起运行时错误。

private func check() {
    let b = Boy.init(name: "Jack", age: 20)
    if b is BoyName {
        
    }
}
