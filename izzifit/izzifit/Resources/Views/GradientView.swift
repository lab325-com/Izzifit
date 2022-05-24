
import UIKit

@IBDesignable

class GradientView: UIView {

    @IBInspectable var FirstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var SecondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }

    @IBInspectable var horizontalMode: Bool =  false {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }

    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [FirstColor.cgColor, SecondColor.cgColor]

        if horizontalMode {
            layer.startPoint =  CGPoint(x: 0, y: 0.5)
            layer.endPoint   = CGPoint(x: 1, y: 0.5)
        } else {
            layer.startPoint =  CGPoint(x: 0.5, y: 0)
            layer.endPoint   =  CGPoint(x: 0.5, y: 1)
        }
    }
}
