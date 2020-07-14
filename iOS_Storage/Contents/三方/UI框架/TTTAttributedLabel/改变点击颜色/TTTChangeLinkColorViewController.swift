//
//  TTTChangeLinkColorViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import TTTAttributedLabel

class TTTChangeLinkColorViewController: CQBaseViewController, TTTAttributedLabelDelegate {
    
    var attributedLable = TTTAttributedLabel.init(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setup()
        
    }
    
    func setup(){
        
        view.addSubview(attributedLable)
        attributedLable.frame = .init(x: 20, y: 100, width: screenWidth - 40, height: 100)
        
        attributedLable.numberOfLines = 0;
        
        let strTC = "terms and conditions"
        let strPP = "privacy policy"
        
        let string = "By signing up or logging in, you agree to our \(strTC) and \(strPP)"
        
        let nsString = string as NSString
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.2
        
        let fullAttributedString = NSAttributedString(string:string, attributes: [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.foregroundColor: UIColor.black.cgColor,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)
        ])
        attributedLable.textAlignment = .center
        attributedLable.attributedText = fullAttributedString;
        
        let rangeTC = nsString.range(of: strTC)
        let rangePP = nsString.range(of: strPP)
        
        let ppLinkAttributes: [String: Any] = [
            NSAttributedString.Key.foregroundColor.rawValue: UIColor.blue.cgColor,
            NSAttributedString.Key.underlineStyle.rawValue: false,
        ]
        let ppActiveLinkAttributes: [String: Any] = [
            NSAttributedString.Key.foregroundColor.rawValue: UIColor.orange.cgColor,
            NSAttributedString.Key.underlineStyle.rawValue: false,
        ]
        
        attributedLable.activeLinkAttributes = ppActiveLinkAttributes
        attributedLable.linkAttributes = ppLinkAttributes
        
        let urlTC = URL(string: "action://TC")!
        let urlPP = URL(string: "action://PP")!
        attributedLable.addLink(to: urlTC, with: rangeTC)
        attributedLable.addLink(to: urlPP, with: rangePP)
        
        attributedLable.textColor = UIColor.black;
        attributedLable.delegate = self;
    }
    
    func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
        if url.absoluteString == "action://TC" {
            print("TC click")
        }
        else if url.absoluteString == "action://PP" {
            print("PP click")
        }
    }
    
}
