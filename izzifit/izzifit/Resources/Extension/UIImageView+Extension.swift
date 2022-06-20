//
//  UIImageView+Extension.swift
//  izzifit
//
//  Created by O l e h on 25.05.2022.
//

import UIKit
import SwiftyGif

extension UIImageView {

    /// This function hide part(makes it transparent) of image from left to right.
    /// Primary size of image is persistent
    /// - Warning: Input in paramater only 0.0-100.0
    /// - Parameter hiddenPart: Percentage of hidden image part, what you need.
    func hideImage(hiddenPart: CGFloat, img: UIImage) {
        self.image = img
        UIGraphicsBeginImageContext(self.image!.size)
        let imgHeight = self.image?.size.height ?? 0.0
        let imgWidth = self.image?.size.width ?? 0.0
        let ratio = imgWidth / 100
        let physicalPartSize = hiddenPart * ratio
        self.image!.draw(at: CGPoint.zero)
        let context:CGContext = UIGraphicsGetCurrentContext()!;
        let bez = UIBezierPath(rect: CGRect(x: imgWidth - physicalPartSize, y: 0, width: physicalPartSize, height: imgHeight))
        context.addPath(bez.cgPath)
        context.clip();
        context.clear(CGRect(x: 0,y: 0,width: self.image!.size.width,height: self.image!.size.height));
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        self.image = newImage
    }
    
    func prepareAnimation(name: String, loopRepeated: Bool) {
        do {
            let gif = try UIImage(gifName: "\(name).gif")
            self.setGifImage(gif)
            self.loopCount = loopRepeated ? -1 : 1
            self.startAnimating()
        } catch {
            print(error)
        }
    }
}

