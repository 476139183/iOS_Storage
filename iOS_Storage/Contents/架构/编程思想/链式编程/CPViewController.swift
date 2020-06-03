//
//  CPViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/26.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class CPViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let num = Calculator.beginCalculator { (make) in
            make.add(num: 2).add(num: 3)
        }
        print(num)
    }

}

fileprivate class CQFrame {
    
}

fileprivate class CalculatorMaker {

    var result : Int = 0
    func add(num : Int)->CalculatorMaker {
        result += num
        return self
    }
    func sub(num : Int)->CalculatorMaker {
        result -= num
        return self
    }
}

fileprivate class Calculator {
    static func beginCalculator( calculatorBlock:(CalculatorMaker)->()) -> Int{
        let calculator = CalculatorMaker()
        calculatorBlock(calculator)
        return calculator.result
    }
}

