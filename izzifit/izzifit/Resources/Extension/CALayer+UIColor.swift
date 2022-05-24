
import UIKit
import QuartzCore

extension CALayer {
    @IBInspectable var borderUIColor: UIColor? {
        get {
            guard let borderColor = borderColor else { return nil }
            return UIColor(cgColor: borderColor)
        }
        
        set {
            borderColor = newValue?.cgColor
        }
    }
}
