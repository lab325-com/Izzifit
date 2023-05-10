
import UIKit
import FBSDKLoginKit
import Firebase
import AuthenticationServices

protocol SocialManagerDelegate: AnyObject {
    func login(authType: AuthType, token: String)
    func login(authType: AuthType, error: Error?)
}

class SocialManager: NSObject {
    
    // MARK: - Public properties
    
    weak var controller: BaseController?
    weak var delegate: SocialManagerDelegate?
    
    // MARK: - Init
    
    init(controller: BaseController, delegate: SocialManagerDelegate) {
        self.controller = controller
        self.delegate = delegate
    }
    
    // MARK: - Public methods
    
    func loginApple() {
        guard #available(iOS 13.0, *) else {
            return
        }
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.email, .fullName]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }

    func loginFacebook() {
        LoginManager().logOut()
        LoginManager().logIn(permissions: ["email"], from: controller) { (result, error) in
            if let result = result, let token = result.token?.tokenString {
                self.delegate?.login(authType: .authTypeFacebook, token: token)
            } else {
                self.delegate?.login(authType: .authTypeFacebook, error: error)
            }
        }
    }
}

//MARK: - ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding

extension SocialManager: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    @available(iOS 13.0, *)
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return (self.controller?.view.window)!
    }

    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        self.delegate?.login(authType: .authTypeApple, error: error)
    }

    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
            let authorizationCode = appleIDCredential.authorizationCode,
            let token = String(data: authorizationCode, encoding: .utf8) {
            self.delegate?.login(authType: .authTypeApple, token: token)
        }
    }
}
