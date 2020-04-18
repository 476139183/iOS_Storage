//
//  TTTAttributedLabel3.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/18.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import TTTAttributedLabel
import SnapKit

class TTTLabelViewController3: UIViewController, TTTAttributedLabelDelegate {

    let tttLabel = TTTAttributedLabel.init(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        view.backgroundColor = .white

        view.addSubview(tttLabel)
        tttLabel.delegate = self
        tttLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        tttLabel.textColor = .black
        tttLabel.isUserInteractionEnabled = true
        tttLabel.numberOfLines = 10
        tttLabel.backgroundColor = .orange
        tttLabel.text = "link1：[google](https://www.google.com),link2：[github](https://github.com),link3：[stackoverflow](https://stackoverflow.com)"
        tttLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(180)
            make.width.equalTo(300)
            make.height.equalTo(100)
        }

    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        checkMarkDownURL(label: tttLabel)
    }


    private func checkMarkDownURL(label: TTTAttributedLabel) {

        let pattern = "(\\[.+?\\]\\([^\\)]+?\\))|(<.+?>)"
        let regex = try? NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)

        var currentAttributedString: NSMutableAttributedString
        if label.attributedText == nil {
            currentAttributedString = NSMutableAttributedString.init(string: label.text as! String)
        } else {
            currentAttributedString = NSMutableAttributedString.init(attributedString: label.attributedText)
        }

        // match
        if let result = regex?.firstMatch(in: currentAttributedString.string, options: [], range: NSRange.init(location: 0, length: currentAttributedString.string.count)) {

            let url = (currentAttributedString.string as NSString).substring(with: result.range)

            let linkName = url.components(separatedBy: ["[", "]"])[1]
            let linkURL = url.components(separatedBy: ["(", ")"])[1]

            let newRange = NSRange.init(location: result.range.location, length: linkName.count)
            currentAttributedString.replaceCharacters(in: result.range, with: linkName)

            // add link
            label.addLink(with: NSTextCheckingResult.linkCheckingResult(range: newRange, url: URL.init(string: linkURL)!), attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.green
            ])

            // set color
            // NSAttributedString.Key.foregroundColor 无效，需要用kCTForegroundColorAttributeName
            currentAttributedString.addAttribute(kCTForegroundColorAttributeName as NSAttributedString.Key, value: UIColor.green, range: newRange)
            currentAttributedString.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.gray, range: newRange)
            currentAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 14), range: newRange)

            label.attributedText = currentAttributedString

            // recursion
            self.checkMarkDownURL(label: label)
        }

    }


    // taped link
    func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
        print(url.absoluteString)
    }


}
