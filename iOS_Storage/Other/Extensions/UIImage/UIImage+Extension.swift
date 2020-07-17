//
//  UIImage+Extension.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/12.
//  Copyright © 2019 蔡强. All rights reserved.
//

import Foundation

extension UIImage {
    
    /// 裁剪中心最大正方形区域
    class func clipToSquare(image: UIImage) -> UIImage {
        let cgimage = image.cgImage!
        let contextImage: UIImage = UIImage(cgImage: cgimage)
        let contextSize: CGSize = contextImage.size
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = 0
        var cgheight: CGFloat = 0
        
        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }
        
        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
        
        // Create bitmap image from context using the rect
        let imageRef: CGImage = cgimage.cropping(to: rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        
        return image
    }

}



extension UIImage {
    
    func makeCircularImage(size: CGSize, borderWidth width: CGFloat) -> UIImage {
        // make a CGRect with the image's size
        let circleRect = CGRect(origin: .zero, size: size)
        
        // begin the image context since we're not in a drawRect:
        UIGraphicsBeginImageContextWithOptions(circleRect.size, false, 0)
        
        // create a UIBezierPath circle
        let circle = UIBezierPath(roundedRect: circleRect, cornerRadius: circleRect.size.width * 0.5)
        
        // clip to the circle
        circle.addClip()
        
        UIColor.white.set()
        circle.fill()
        
        // draw the image in the circleRect *AFTER* the context is clipped
        self.draw(in: circleRect)
        
        // create a border (for white background pictures)
        if width > 0 {
            circle.lineWidth = width;
            UIColor.white.set()
            circle.stroke()
        }
        
        // get an image from the image context
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext();
        
        // end the image context since we're not in a drawRect:
        UIGraphicsEndImageContext();
        
        return roundedImage ?? self
    }
    
    class func draw(size: CGSize, fillColor: UIColor, shapeClosure: () -> UIBezierPath) -> UIImage {
        UIGraphicsBeginImageContext(size)
        
        let path = shapeClosure()
        path.addClip()
        
        fillColor.setFill()
        path.fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
