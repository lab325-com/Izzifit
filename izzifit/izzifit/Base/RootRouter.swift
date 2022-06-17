
import UIKit

/// RootRouter
class RootRouter {
    
    /// Get top view controller
    var topViewController: UIViewController? {
        return UIApplication.topViewController()
    }
    
    /// Get last view controller
    var lastViewController: UIViewController? {
        return UIApplication.lastViewController()
    }
    
    /// Get window for navigation
    fileprivate(set) var window: UIWindow!
    
    //----------------------------------------------
    // MARK: - SINGLETON
    //----------------------------------------------
    static let sharedInstance: RootRouter = {
        let instance = RootRouter()
        return instance
    }()
    
    //----------------------------------------------
    // MARK: - APPLICATION DIDFINISHLAUCHING WITH OPTIONSё
    //----------------------------------------------
    func application(didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?, window: UIWindow) -> Bool {

        if PreferencesManager.sharedManager.isFirstRun == false {
            KeychainService.standard.removeObject(forKey: .newAuthToken)
            PreferencesManager.sharedManager.isFirstRun = true
        }

        RootRouter.sharedInstance.window = window
        let controller = SplashViewController()
        let navigationController = NavigationController(rootViewController: controller)
        navigationController.navigationBar.isHidden = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return true
    }
}

//----------------------------------------------
// MARK: - Change root controller
//----------------------------------------------
extension RootRouter {
    func loadOnboarding(toWindow window: UIWindow) {
        let viewController = OnboardingSwipeContoller(isHiddenBackButton: true)
        let navigationController = NavigationController(rootViewController: viewController)
        UIApplication.shared.switchRootViewController(window: window,
                                                      rootViewController: navigationController,
                                                      animated: true,
                                                      completion: nil)
    }

    func loadStart(toWindow window: UIWindow) {
        let viewController = StartController()
        let navigationController = NavigationController(rootViewController: viewController)
        UIApplication.shared.switchRootViewController(window: window,
                                                      rootViewController: navigationController,
                                                      animated: true,
                                                      completion: nil)
    }

    func loadMain(toWindow window: UIWindow) {
        let viewController = MainTabBarController()
        let navigationController = NavigationController(rootViewController: viewController)
        UIApplication.shared.switchRootViewController(window: window,
                                                      rootViewController: navigationController,
                                                      animated: true,
                                                      completion: nil)
    }
    
    func logout() {
        KeychainService.standard.removeAll()
        loadStart(toWindow: window!)
    }
}
