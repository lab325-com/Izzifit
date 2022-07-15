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

class CircleAnimView: UIView {
    var shape = CAShapeLayer()
    
    var duration: CGFloat
    var snakeColor: CGColor
    
    init(duration: CGFloat, snakeColor: UIColor) {
        self.duration = duration
        self.snakeColor = snakeColor.cgColor
        super.init(frame: .zero)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawRingFittingInsideView(shape: shape)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    func drawRingFittingInsideView(shape: CAShapeLayer) -> () {
     
        let x = bounds.size.width/2
        let y = bounds.size.height/2
        let desiredLineWidth:CGFloat = max( bounds.size.width/2, bounds.size.height/2)// your desired value
            
        let circlePath = UIBezierPath(
                arcCenter: CGPoint(x:x,
                                   y:y),
                radius: max(x, y) - (desiredLineWidth/2) ,
                startAngle: 0,
                endAngle: .pi * 2,
                clockwise: true)
    
        shape.path = circlePath.cgPath
        shape.strokeStart = 0
        shape.strokeEnd = 0.4
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = snakeColor
        shape.lineWidth = desiredLineWidth
        
        let rotateAnumation = CABasicAnimation(keyPath: "transform.rotation.z")
                      rotateAnumation.fromValue = 0
                      rotateAnumation.toValue = Double.pi * 2
                      rotateAnumation.duration = duration
                      rotateAnumation.isCumulative = true
                      rotateAnumation.repeatCount = Float.greatestFiniteMagnitude
              
        let anim1 = CABasicAnimation(keyPath: "strokeEnd")
                        anim1.fromValue         = 0.2
                        anim1.toValue           = 0.6
                        anim1.duration          = 0.3
                        anim1.repeatCount = Float.infinity
                        anim1.autoreverses = true
                        anim1.isRemovedOnCompletion = true
            
        layer.addSublayer(shape)
        
        layer.add(rotateAnumation, forKey: "nil")
//shape.add(anim1, forKey: "nil")
     }
}


extension UIView {

    func runSnakeAnim(duration: CGFloat, snakeColor: UIColor, snakeLineWidth: CGFloat, cornerRadius: CGFloat) {
        
       
        let snakeView = CircleAnimView(duration: duration, snakeColor: snakeColor)
        
        let clearView = UIView()
        clearView.layer.cornerRadius = cornerRadius
        clearView.layer.backgroundColor = UIColor.clear.cgColor
        clearView.layer.masksToBounds = true
        
        let capView = UIView()
        capView.layer.backgroundColor = layer.backgroundColor
        capView.layer.cornerRadius = cornerRadius
        
        layer.cornerRadius = cornerRadius
        
             ui.genericlLayout(object: clearView,
                               parentView: self,
                               width: bounds.size.width + (snakeLineWidth * 2) ,
                               height: bounds.size.height + (snakeLineWidth * 2) ,
                               centerV: 0,
                               centerH: 0)
        
        ui.genericlLayout(object: snakeView,
                          parentView: clearView,
                          width: bounds.size.width + 100,
                          height: bounds.size.height + 100,
                          centerV: 0,
                          centerH: 0)
        
        ui.genericlLayout(object: capView,
                          parentView: self,
                          width: bounds.size.width,
                          height: bounds.size.height,
                          centerV: 0,
                          centerH: 0)
    }

}
