//
//  RecordsManagerViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/15.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class RecordsManagerViewController: CQBaseViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        print(RecordsManager.addItem(textField.text!))
    }
    
    @IBAction func clearButtonClicked(_ sender: Any) {
        print(RecordsManager.clear())
    }
    
    @IBAction func printButtonClicked(_ sender: Any) {
        print(RecordsManager.getAll())
    }
    
}
