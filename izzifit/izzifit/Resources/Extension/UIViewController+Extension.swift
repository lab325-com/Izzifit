
import UIKit

extension UIViewController {
    /// Get name view controller
    @objc var viewControllerName: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
    
    func addContainer(child: UIViewController, to viewParent: UIView) {
        addChild(child)
        child.view.frame = viewParent.bounds
        child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewParent.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func removeContainer() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        
        return instantiateFromNib()
    }
}

extension UIViewController {
    var top: UIViewController? {
        if let controller = self as? UINavigationController {
            return controller.topViewController?.top
        }
        if let controller = self as? UISplitViewController {
            return controller.viewControllers.last?.top
        }
        if let controller = self as? UITabBarController {
            return controller.selectedViewController?.top
        }
        if let controller = presentedViewController {
            return controller.top
        }
        return self
    }
}
