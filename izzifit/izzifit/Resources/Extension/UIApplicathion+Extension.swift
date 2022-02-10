
import UIKit

extension UIApplication {
    /// Get top view controller
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        
        if let tabbarController = base as? UITabBarController {
            return topViewController(tabbarController)
        }
        
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        
        if base == nil {
            return UIApplication.shared.delegate?.window??.rootViewController
        }
        return base
    }
    
    /// Get last view controller
    class func lastViewController() -> UIViewController? {
        
        let base = UIApplication.topViewController()
        
        if let index = base?.children.firstIndex(where: { $0 is UINavigationController }) {
            return (base?.children[index] as? UINavigationController)?.viewControllers.last
        }
        
        return base
    }
    
    func switchRootViewController(window: UIWindow, rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        
        if UIApplication.shared.isIgnoringInteractionEvents {
            UIApplication.shared.endIgnoringInteractionEvents()
        }
        
        if animated {
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                window.rootViewController = rootViewController
                UIView.setAnimationsEnabled(oldState)
            }, completion: { (finished: Bool) -> () in
                if (completion != nil) {
                    completion!()
                }
            })
        } else {
            window.rootViewController = rootViewController
        }
    }
}
