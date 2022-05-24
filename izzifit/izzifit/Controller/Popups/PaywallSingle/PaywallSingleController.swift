
import UIKit

class PaywallSingleController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var subNameLabel: UILabel!
    @IBOutlet weak var subPriceLabel: UILabel!
    @IBOutlet weak var subSalePriceLabel: UILabel!
    @IBOutlet weak var subSaleDiscountLabel: UILabel!
    @IBOutlet weak var subPerDayPriceLabel: UILabel!
    
    @IBOutlet weak var subscribeButton: UIButton!
    @IBOutlet weak var restoreButton: UIButton!
    
    @IBOutlet weak var privacyLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        createPrivacyLabel()
    }
    
    private func createPrivacyLabel() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.32
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56), .paragraphStyle: paragraphStyle]
        
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x797889), .paragraphStyle: paragraphStyle]
        
        let attributedString1 = NSMutableAttributedString(string:RLocalization.login_by_continue(), attributes:attrs1 as [NSAttributedString.Key : Any])
        
        let attributedString2 = NSMutableAttributedString(string:" \(RLocalization.login_privacy_policy())\n\(RLocalization.login_terms_use())", attributes:attrs2 as [NSAttributedString.Key : Any])
        
        //let attributedString3 = NSMutableAttributedString(string:" \( RLocalization.login_and()) ", attributes:attrs1 as [NSAttributedString.Key : Any])
        
        //let attributedString4 = NSMutableAttributedString(string:RLocalization.login_terms_of_subscribe(), attributes:attrs2 as [NSAttributedString.Key : Any])
        
        
        attributedString1.append(attributedString2)
        //attributedString1.append(attributedString3)
        //attributedString1.append(attributedString4)
        
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
            AnalyticsHelper.sendFirebaseEvents(events: .other_legal_open, params: ["open": "privacy", "screen": "paywall"])
            guard let url = URL(string: "https://mob325.com/izzifit/privacy_policy.html") else { return }
            UIApplication.shared.open(url)
        } else if gesture.didTapAttributedTextInLabel(label: self.privacyLabel, inRange: termsAndConditionRange) {
            print("user tapped on terms and conditions text")
            AnalyticsHelper.sendFirebaseEvents(events: .other_legal_open, params: ["open": "terms", "screen": "paywall"])
            guard let url = URL(string: "https://mob325.com/izzifit/terms_and_conditions.html") else { return }
            UIApplication.shared.open(url)
        } else if gesture.didTapAttributedTextInLabel(label: self.privacyLabel, inRange: termsAndSubscribeRange) {
            print("user tapped on terms and subscribe text")
            AnalyticsHelper.sendFirebaseEvents(events: .other_legal_open, params: ["open": "subscribe", "screen": "paywall"])
            guard let url = URL(string: "https://mob325.com/izzifit/terms_and_conditions.html") else { return }
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func actionSubscribe(_ sender: UIButton) {
        
    }
    
    @IBAction func actionRestore(_ sender: UIButton) {
        
    }
}
