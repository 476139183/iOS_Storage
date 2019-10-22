//
//  LocationManagerViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/22.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class LocationManagerViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        LocationManager.shared.getLocation(success: { (location) in
            print(location ?? "🙃")
        }) { (error) in
            print(error?.localizedDescription ?? "😊")
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(LocationManager.shared.currentLocation)
    }
    

}
