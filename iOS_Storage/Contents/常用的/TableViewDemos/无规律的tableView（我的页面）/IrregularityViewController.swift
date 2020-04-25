//
//  IrregularityViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/7.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

/// cell 类型
private enum CellType {
    case profilePicture // 头像
    case nickName       // 昵称
    case sign           // 签名
    case identify       // 认证
}

class IrregularityViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    var headImageView: UIImageView?
    
    private lazy var dataArray: [Model] = {
        return [Model(cellType: .profilePicture, cellHeight: 100),
                Model(cellType: .nickName, cellHeight: 58)]
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.frame = .init(x: 0, y: naviHeight, width: screenWidth, height: screenHeight-naviHeight)
    }
    
    
    // MARK: - UITableView DataSource & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "\(indexPath.section)-\(indexPath.row)"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID) as? Cell
        if cell == nil {
            let model = dataArray[indexPath.row]
            let type = model.cellType!
            cell = Cell(cellReuseID: reuseID, type: type)
            cell?.model = model
            switch type {
            case .profilePicture:
                headImageView = cell?.headImageView
                model.cellSelectedAction = { [weak self] in
                    self?.headImageView?.image = UIImage(named: "iu")
                    print("picture cell")
                }
            case .nickName:
                model.cellSelectedAction = {
                    print("nickname cell")
                }
            case .sign:
                model.cellSelectedAction = {
                    print("sign cell")
                }
            case .identify:
                model.cellSelectedAction = {
                    print("iden cell")
                }
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dataArray[indexPath.row].cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataArray[indexPath.row].cellSelectedAction?()
    }
    
}


// MARK: - Model

fileprivate class Model {
    
    /// cell 点击回调
    typealias CellSelectedAction = (() -> ())
    
    /// cell 类型
    var cellType: CellType?
    /// cell 高度
    var cellHeight: CGFloat = 58
    /// 点击cell的回调
    var cellSelectedAction: CellSelectedAction?
    
    init() {
        
    }
    
    convenience init(cellType: CellType, cellHeight: CGFloat) {
        self.init()
        
        self.cellType = cellType
        self.cellHeight = cellHeight
    }
    
}


// MARK: - Cell

fileprivate class Cell: UITableViewCell  {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    lazy var headImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "qbl")
        return imageView
    }()
    
    // MARK: - setter
    
    var model: Model? {
        didSet {
            guard let model = self.model else {
                return
            }
            switch model.cellType {
            case .profilePicture:
                titleLabel.text = "更换头像"
                contentView.addSubview(headImageView)
                headImageView.snp.makeConstraints { (make) in
                    make.size.equalTo(CGSize(width: 80, height: 80))
                    make.center.equalToSuperview()
                }
            case .nickName:
                titleLabel.text = "昵称"
            default:
                break
            }
        }
    }
    
    
    // MARK: - init
    
    init(cellReuseID: String?, type: CellType) {
        super.init(style: .default, reuseIdentifier: cellReuseID)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.centerY.equalToSuperview()
        }
    }
    
}
