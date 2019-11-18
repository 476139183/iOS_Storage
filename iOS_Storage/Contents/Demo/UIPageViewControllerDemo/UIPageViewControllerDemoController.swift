//
//  UIPageViewControllerDemoController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/16.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class UIPageViewControllerDemoController: CQBaseViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    private lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController.init(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal, options: nil)
        vc.delegate = self
        vc.dataSource = self
        
        let childVC1 = UIViewController()
        childVC1.view.backgroundColor = .red
        
        let childVC2 = UIViewController()
        childVC2.view.backgroundColor = .green
        
        let childVC3 = UIViewController()
        childVC3.view.backgroundColor = .blue
        
        vc.setViewControllers([childVC1, childVC2, childVC3], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
        
        return vc
    }()
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.view.frame = view.bounds
    }
    
    
    // MARK: - UIPageViewController
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }

}
