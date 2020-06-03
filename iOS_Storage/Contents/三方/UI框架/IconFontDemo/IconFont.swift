//
//  IconFont.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/18.
//  Copyright © 2019 蔡强. All rights reserved.
//

import Foundation

class IconFont {
    
    static var tabs = [
        "home": "\u{e62d}",
        "monitor": "\u{e63c}",
        "price": "\u{e64c}",
        "community": "\u{e648}",
        "user": "\u{e62f}"
    ]
    
    static let Settings = "\u{e61c}"
    static let Mobile = "\u{e63b}"
    static let Wechat = "\u{e640}"
    static let LoginBack = "\u{e61e}"
    static let LoginMore = "\u{e66c}"
    static let TriangleUp = "\u{e899}"
    static let menu = "\u{e655}"
    static let minus = "\u{e627}"
    static let plus = "\u{e625}"
    static let close = "\u{e628}"
    static let CellMore = "\u{e629}"
    static let Share = "\u{e62a}"
    static let CheckIn = "\u{e633}"
    static let Plane = "\u{e7d5}"
    static let Group = "\u{e6e8}"
    static let Support = "\u{e68c}"
    static let Like = "\u{e635}"
    static let LikeSelected = "\u{e7d6}"
    static let Dislike = "\u{e7d7}"
    static let DislikeSelected = "\u{e7d8}"
    static let Alarm = "\u{e637}"
    static let AlarmSelected = "\u{e636}"
    static let Check = "\u{e641}"
    static let Credit = "\u{e721}"
    static let Back = "\u{e7d9}"
    static let NaviBack = "\u{e618}"
    static let Lock = "\u{e6e5}"
    static let RaffleSMS = "\u{e603}"
    static let RaffleAlarm = "\u{e654}"
    static let Zoom = "\u{e898}"
    static let Link = "\u{e646}"
    static let More = "\u{e64d}"
    static let Mute = "\u{e615}"
    static let Edit = "\u{e647}"
    static let ToggleRole = "\u{e64a}"
    static let Search = "\u{e649}"
    static let Price = "\u{e64c}"
    static let ScreenShot = "\u{e651}"
    static let RaffleShare = "\u{e653}"
    static let MapFeedback = "\u{e604}"
    static let MapPosition = "\u{e602}"
    static let RaffleNavi = "\u{e657}"
    static let RaffleSms = "\u{e656}"
    static let RallfeMark = "\u{e606}"
    static let ShareProduct = "\u{e605}"
    static let VoteCheck = "\u{e61b}"
    
    static let CommunityComposeMore = "\u{e625}"

    
    static let ProductDetailSku = "\u{e659}"
    static let ProductDetailPrice = "\u{e658}"
    static let ProductDetailRaffleCount = "\u{e606}"
    static let ProductDetailPriceTrend = "\u{e64b}"
    
    static let Comment = "\u{e65a}"
    
    static func font(size: CGFloat) -> UIFont {
        return UIFont.init(name: "iconfont", size: size)!
    }
    
    static func image(icon: String, size: CGFloat, color: UIColor) -> UIImage?{
        UIGraphicsBeginImageContextWithOptions(.init(width: size, height: size), false, UIScreen.main.scale)
        let label = UILabel.init(frame: .init(origin: .zero, size: .init(width: size + 2, height: size + 2)))
        label.font = IconFont.font(size: size)
        label.text = icon
        label.textColor = color
        if let context = UIGraphicsGetCurrentContext() {
            label.layer.render(in: context)
        }
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            return image
        }
        return nil
    }
}
