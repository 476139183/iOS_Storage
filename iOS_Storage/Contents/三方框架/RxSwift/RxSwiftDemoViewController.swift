//
//  RxSwiftDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/26.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ObjectMapper

class RxSwiftDemoViewController: CQBaseViewController {
    
    // 这个是必须的
    let disposeBag = DisposeBag()
    
    let redButton = UIButton()
    let greenView = UIView()
    let textField = UITextField()
    let label = UILabel()
    let scrollView = UIScrollView()
    var timer: Observable<Int>!
    
    let imageView = UIImageView()
    
    var loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        redButton.frame = CGRect.init(x: 90, y: 90, width: 60, height: 30)
        view.addSubview(redButton)
        redButton.backgroundColor = .red
        
        view.addSubview(greenView)
        greenView.backgroundColor = .green
        greenView.snp.makeConstraints { (make) in
            make.left.equalTo(redButton.snp.right).offset(10)
            make.top.bottom.equalTo(redButton)
            make.width.equalTo(40)
        }
        
        view.addSubview(textField)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.placeholder = "请输入"
        textField.snp.makeConstraints { (make) in
            make.left.equalTo(greenView.snp.right).offset(10)
            make.top.bottom.equalTo(greenView)
            make.width.equalTo(80)
        }
        
        view.addSubview(label)
        label.textAlignment = .center
        label.backgroundColor = .yellow
        label.snp.makeConstraints { (make) in
            make.left.right.equalTo(textField)
            make.top.equalTo(textField.snp.bottom).offset(10)
            make.height.equalTo(40)
        }
        
        view.addSubview(scrollView)
        scrollView.frame = CGRect.init(x: 0, y: 130, width: 100, height: 150)
        scrollView.backgroundColor = .yellow
        scrollView.contentSize = CGSize.init(width: 100, height: 500)
        
        view.addSubview(imageView)
        imageView.backgroundColor = .orange
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView.snp.bottom).offset(10)
            make.left.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 100, height: 100))
        }
        imageView.rx.observeWeakly(UIImage.self, "image").subscribe(onNext: { (image) in
            print("图片改变")
        }).disposed(by: disposeBag)
        
        view.addSubview(loginButton)
        loginButton.setTitle("去登录页", for: .normal)
        loginButton.backgroundColor = .blue
        loginButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-100)
            make.left.equalTo(20)
            make.size.equalTo(CGSize.init(width: 100, height: 40))
        }
        loginButton.rx.tap.subscribe(onNext: ({ () in
            let vc = RxSwiftLoginViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        })).disposed(by: disposeBag)
        
        let array = [1, 2, 3, 4, 5]
        
        // 函数式编程
        array.filter{$0 < 4}
            .filter{$0 > 2}.forEach{print($0)}
        
        // 响应式编程
        
        
        addButtonEvent()
        addGestureEvent()
        handleKeyboardNotif()
        monitorScroll()
        addObserver()
        bind()
        //rxTimer()
    }
    
    deinit {
        print("已释放")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.backgroundColor = .red
        
        label.text = "呵呵哒"
        
        imageView.image = UIImage.init(named: "qbl")
    }
    
}

// MARK: - 基于rx的各种事件处理
extension RxSwiftDemoViewController {
    // MARK: - 按钮事件
    func addButtonEvent() {
        // tap 等于 TouchUpInside
        self.redButton.rx.tap.subscribe(onNext: { () in
            print("red button clicked")
        }).disposed(by: disposeBag)
        
        self.redButton.rx.controlEvent(.touchDown).subscribe(onNext: { () in
            print("red button touch down")
        }).disposed(by: disposeBag)
    }
    
    // MARK: - 手势
    func addGestureEvent() {
        let tap = UITapGestureRecognizer()
        greenView.addGestureRecognizer(tap)
        tap.rx.event.subscribe(onNext: { (tap) in
            print("green view tap")
        }).disposed(by: disposeBag)
    }
}

// MARK: - 通知
extension RxSwiftDemoViewController {
    func handleKeyboardNotif() {
        // 监听键盘弹出
        NotificationCenter.default.rx.notification(UIResponder.keyboardDidShowNotification).subscribe(onNext: { (notif) in
            print("键盘弹出")
        }).disposed(by: disposeBag)
    }
}

// MARK: - 代理
extension RxSwiftDemoViewController {
    func monitorScroll() {
        scrollView.rx.contentOffset.subscribe(onNext: { [weak self](offset) in
            self?.view.backgroundColor = UIColor.init(red: offset.y/255*0.8, green: offset.y/255*0.6, blue: offset.y/255*0.3, alpha: 1)
        }).disposed(by: disposeBag)
        view.backgroundColor = .white
    }
}

// MARK: - KVO
extension RxSwiftDemoViewController {
    func addObserver() {
        scrollView.rx.observeWeakly(CGPoint.self, "contentOffset").subscribe(onNext: { (offset) in
            print("监听offset变化\(String(describing: offset))")
        }).disposed(by: disposeBag)
    }
}

// MARK: - 绑定
extension RxSwiftDemoViewController {
    func bind() {
        // textField的text变了，label的text跟着变
        textField.rx.text.bind(to: label.rx.text).disposed(by: disposeBag)
        // label的text变了，textField的text跟着变
        label.rx.observeWeakly(String.self, "text").subscribe(onNext: { (text) in
            self.textField.text = text
        }).disposed(by: disposeBag)
    }
}

// MARK: - Timer
extension RxSwiftDemoViewController {
    func rxTimer() {
        timer = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        timer.subscribe(onNext: { (x) in
            print(x)
        }).disposed(by: disposeBag)
    }
}
