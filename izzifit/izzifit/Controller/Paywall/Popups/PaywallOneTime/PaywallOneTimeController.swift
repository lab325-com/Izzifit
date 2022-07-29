
import UIKit

class PaywallOneTimeController: BaseController {
    
    @IBOutlet weak var privacyLabel: UILabel!
    
    @IBOutlet weak var trialButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        createPrivacyLabel()
        
        trialButton.layer.borderWidth = 1
        trialButton.layer.borderColor = UIColor(rgb: 0xCCBEE9).cgColor
    }
    
    private func createPrivacyLabel() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.32
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0xB7A1CC), .paragraphStyle: paragraphStyle]
        
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0xFFFFFF), .paragraphStyle: paragraphStyle]
        
        let attributedString1 = NSMutableAttributedString(string:RLocalization.login_by_continue(), attributes:attrs1 as [NSAttributedString.Key : Any])
        
        let attributedString2 = NSMutableAttributedString(string:" \(RLocalization.login_privacy_policy())\n\(RLocalization.login_terms_use())", attributes:attrs2 as [NSAttributedString.Key : Any])
        
        attributedString1.append(attributedString2)
        
        self.privacyLabel.attributedText = attributedString1
        privacyLabel.textAlignment = .center
        self.privacyLabel.isUserInteractionEnabled = true
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnLabel(_ :)))
        tapgesture.numberOfTapsRequired = 1
        self.privacyLabel.addGestureRecognizer(tapgesture)
    }
    
    //----------------------------------------------
    // MARK: - Acions
    //----------------------------------------------
    
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
        guard let text = self.privacyLabel.text else { return }
        let privacyPolicyRange = (text as NSString).range(of: RLocalization.login_privacy_policy())
        let termsAndConditionRange = (text as NSString).range(of: RLocalization.login_terms_use())
        let termsAndSubscribeRange = (text as NSString).range(of: RLocalization.login_terms_of_subscribe())
   
        if gesture.didTapAttributedTextInLabel(label: self.privacyLabel, inRange: privacyPolicyRange) {
            print("user tapped on privacy policy text")
//            AnalyticsHelper.sendFirebaseEvents(events: .other_legal_open, params: ["open": "privacy", "place": place.rawValue, "screen": screen.rawValue])
            guard let url = URL(string: "https://mob325.com/izzifit/privacy_policy.html") else { return }
            UIApplication.shared.open(url)
        } else if gesture.didTapAttributedTextInLabel(label: self.privacyLabel, inRange: termsAndConditionRange) {
            print("user tapped on terms and conditions text")
//            AnalyticsHelper.sendFirebaseEvents(events: .other_legal_open, params: ["open": "terms", "place": place.rawValue, "screen": screen.rawValue])
            guard let url = URL(string: "https://mob325.com/izzifit/terms_and_conditions.html") else { return }
            UIApplication.shared.open(url)
        } else if gesture.didTapAttributedTextInLabel(label: self.privacyLabel, inRange: termsAndSubscribeRange) {
            print("user tapped on terms and subscribe text")
//            AnalyticsHelper.sendFirebaseEvents(events: .other_legal_open, params: ["open": "subscribe", "place": place.rawValue, "screen": screen.rawValue])
            guard let url = URL(string: "https://mob325.com/izzifit/terms_and_conditions.html") else { return }
            UIApplication.shared.open(url)
        }
    }
}
