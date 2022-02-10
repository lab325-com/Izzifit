
import UIKit

//----------------------------------------------
// MARK: - Router Protocol
//----------------------------------------------
protocol RouterProtocol {
    var presenter: UINavigationController? { get }
}

//----------------------------------------------
// MARK: - Base Router
//----------------------------------------------
class BaseRouter: RouterProtocol {
    
    weak var presenter: UINavigationController?
    
    init() {
        self.presenter = nil
    }
    
    init(presenter: UINavigationController?) {
        self.presenter = presenter
    }
}

//----------------------------------------------
// MARK: - Navigation
//----------------------------------------------
extension RouterProtocol {
    
    func present(controller: UIViewController, animated: Bool = true, presentStyle: UIModalPresentationStyle = .fullScreen, complate: (() -> ())? = nil) {
        controller.modalPresentationStyle = presentStyle
        presenter?.present(controller, animated: animated, completion: complate)
    }
    
    func push(controller: UIViewController, animated: Bool = true) {
        if UIApplication.topViewController()?.viewControllerName == controller.viewControllerName { return }
        presenter?.pushViewController(controller, animated: animated)
    }
    
    func popToController(_ animated: Bool = true) {
        _ = presenter?.popViewController(animated: animated)
    }
    
    func popToRootController(_ animated: Bool = true) {
        _ = presenter?.popToRootViewController(animated: animated)
    }
    
    func dismiss(_ animated: Bool = true, complate: (() -> ())? = nil) {
        presenter?.dismiss(animated: animated, completion: complate)
    }
    
    func popTo(controller: UIViewController, animated: Bool = true) {
        _ = presenter?.popToViewController(controller, animated: animated)
    }
}
