//
//  UIView+Extension.swift
//  izzifit
//
//  Created by Andrey S on 04.03.2022.
//

import UIKit

public extension UIView {
    

    private static let kLayerNameGradientBorder = "GradientBorderLayer"

    func gradientBorder(width: CGFloat,
                        colors: [UIColor],
                        startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0),
                        endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0),
                        andRoundCornersWithRadius cornerRadius: CGFloat = 0) {

        let existingBorder = gradientBorderLayer()
        let border = existingBorder ?? CAGradientLayer()
        border.frame = CGRect(x: bounds.origin.x, y: bounds.origin.y,
                              width: bounds.size.width + width, height: bounds.size.height + width)
        border.colors = colors.map { return $0.cgColor }
        border.startPoint = startPoint
        border.endPoint = endPoint

        let mask = CAShapeLayer()
        let maskRect = CGRect(x: bounds.origin.x + width/2, y: bounds.origin.y + width/2,
                              width: bounds.size.width - width, height: bounds.size.height - width)
        mask.path = UIBezierPath(roundedRect: maskRect, cornerRadius: cornerRadius).cgPath
        mask.fillColor = UIColor.clear.cgColor
        mask.strokeColor = UIColor.white.cgColor
        mask.lineWidth = width

        border.mask = mask

        let exists = (existingBorder != nil)
        if !exists {
            layer.addSublayer(border)
        }
    }
    private func gradientBorderLayer() -> CAGradientLayer? {
        let borderLayers = layer.sublayers?.filter { return $0.name == UIView.kLayerNameGradientBorder }
        if borderLayers?.count ?? 0 > 1 {
            fatalError()
        }
        return borderLayers?.first as? CAGradientLayer
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }
   
    func shake(_ dur:Double,x: CGFloat, y: CGFloat) {
            let anim = CABasicAnimation(keyPath: "position")
            anim.duration = dur
            anim.repeatCount = Float.infinity
            anim.autoreverses = true
            anim.fromValue = NSValue(cgPoint: CGPoint(x: x, y: y - 5))
            anim.toValue = NSValue(cgPoint: CGPoint(x: x , y: y + 5))
            self.layer.add(anim, forKey: "position")
        }
}

extension UIView {
    
    var ui: SetUIManager {
        return SetUIManager()
    }
    
    public var sizeWidth: CGFloat {
        return frame.size.width
    }
    
    public var sizeHeight: CGFloat {
        return frame.size.height
    }
    
    var w: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    var h: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    func image(img: Imgs) -> UIImage? {
        let image = UIImage(named: img.rawValue)
        return image ?? nil
    }
    
    func clr(color: Clrs) -> UIColor? {
        let color = UIColor(named: color.rawValue)
        return color ?? nil
    }
    
    func hRatio(cH: CGFloat) -> CGFloat {
        let hScreen = 812.0
        let value = hScreen / cH
        let ratio = h / value
        return ratio
    }
    
    func wRatio(cW: CGFloat) -> CGFloat {
        let wScreen = 375.0
        let value = wScreen / cW
        let ratio = w / value
        return ratio
    }
}


public extension CGPoint {

    enum CoordinateSide {
        case topLeft, top, topRight, right, bottomRight, bottom, bottomLeft, left
    }

    static func unitCoordinate(_ side: CoordinateSide) -> CGPoint {
        switch side {
        case .topLeft:      return CGPoint(x: 0.0, y: 0.0)
        case .top:          return CGPoint(x: 0.5, y: 0.0)
        case .topRight:     return CGPoint(x: 1.0, y: 0.0)
        case .right:        return CGPoint(x: 0.0, y: 0.5)
        case .bottomRight:  return CGPoint(x: 1.0, y: 1.0)
        case .bottom:       return CGPoint(x: 0.5, y: 1.0)
        case .bottomLeft:   return CGPoint(x: 0.0, y: 1.0)
        case .left:         return CGPoint(x: 1.0, y: 0.5)
        }
    }
}


public extension Double {
    var twoDigits: Double {
        Double(String(format: "%.2f", self))!
    }
}
