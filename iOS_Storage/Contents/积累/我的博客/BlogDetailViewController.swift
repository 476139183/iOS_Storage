//
//  BlogDetailViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/10.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON
import WebKit

class BlogDetailViewController: CQBaseViewController {
    
    private var slug = ""
    
    private lazy var webView: WKWebView = {
        let web = WKWebView.init()
        return web
    }()
    
    init(slug: String) {
        super.init(nibName: nil, bundle: nil)
        self.slug = slug
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.top.equalTo(naviHeight)
            make.left.right.bottom.equalToSuperview()
        }
        
        loadData()
    }
    
    private func loadData() {
        let url = URL.init(string: "https://www.jianshu.com/asimov/p/\(self.slug)")!
        AF.request(url, method: .get).responseString { (response) in
            
            switch response.result {
                
            case .success(let data):
                
                let model = BlogDetailModel.deserialize(from: data)
                self.naviBar.titleLabel.text = model?.public_title
                self.webView.loadHTMLStringWithMagic(content: model!.free_content, baseURL: nil)

            case .failure(let error):

                SVProgressHUD.showInfo(withStatus: error.errorDescription)
                
            }
            
        }
    }

}


/**
<div class="image-view" data-width="99" data-height="48">
 <img data-original-src="//upload-images.jianshu.io/upload_images/1692043-7b631ee8767f638d.png" data-original-width="99" data-original-height="48" data-original-format="image/png" data-original-filesize="4158"></div> </div>

 */
