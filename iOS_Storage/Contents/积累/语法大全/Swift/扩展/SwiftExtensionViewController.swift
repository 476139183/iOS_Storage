//
//  SwiftExtensionViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SwiftExtensionViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let a = 2223
        print(a.stringValue) // 2223
        print(Int.typeName)  // Int
        
        
        let p = Person.init(name: "Jack", age: 10)
        print(p.name) // print Jack
        print(p.age)  // print 10
        
        p.sayHi()
        
        
    }

}


// MARK: - 计算型属性

// 扩展可以向已有类型添加计算型实例属性和计算型类型属性。

fileprivate extension Int {
    
    // 添加实例属性
    var stringValue: String {
        return "\(self)"
    }
    
    // 添加类型属性
    static var typeName: String {
        return "Int"
    }
    
}


// MARK: - 构造器

// 扩展可以向已有类型添加新的构造器。
// 扩展可以向类中添加新的便利构造器 init()，但是它们**不能向类**(中添加新的指定构造器或析构函数 deinit() 。

fileprivate extension Person {
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}

fileprivate extension Student {
    
    // 如果是class，只能扩展便利构造器
    convenience init(name: String, age: Int) {
        self.init(name: name)
        self.age = age
    }
    
}

fileprivate struct Person {
    
    var name: String = ""
    var age: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
}


fileprivate class Student {
    
    var name: String = ""
    var age: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
}


// MARK: - 方法

// 扩展可以向已有类型添加新的实例方法和类型方法。

fileprivate extension Person {
    
    func sayHi() {
        print("hi")
    }
    
}


// MARK: - 可变实例方法

// 通过扩展添加的实例方法也可以修改该实例本身。
// 结构体和枚举类型中修改self或其属性的方法必须将该实例方法标注为mutating，正如来自原始实现的修改方法一样。

extension Double {
    mutating func square() {
      let pi = 3.1415
      self = pi * self * self
   }
}


// MARK: - 下标

extension String
{
    /// 根据开始位置和长度截取字符串，索引从0开始
    func subString(start: Int, length: Int = -1) -> String
    {
        var len = length
        if len == -1
        {
            len = self.count - start
        }
        let st = self.index(startIndex, offsetBy: start)
        let en = self.index(st, offsetBy: len)
        return String(self[st ..< en])
    }
}


// MARK: - 嵌套类型

// 扩展可以向已有的类、结构体和枚举添加新的嵌套类型：

extension Int {
   enum calc
   {
      case add
      case sub
      case mult
      case div
      case anything
   }

   var print: calc {
      switch self
      {
         case 0:
            return .add
         case 1:
            return .sub
         case 2:
            return .mult
         case 3:
            return .div
         default:
            return .anything
       }
   }
}

func result(numb: [Int]) {
   for i in numb {
      switch i.print {
         case .add:
            print(" 10 ")
          case .sub:
            print(" 20 ")
         case .mult:
         print(" 30 ")
         case .div:
         print(" 40 ")
         default:
         print(" 50 ")

      }
   }
}

