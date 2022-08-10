
import UIKit

class MenuSubscriptionsController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var activeSubView: UIView!
    @IBOutlet weak var unsubscribeButton: UIButton!
    
    @IBOutlet weak var subsStackView: UIStackView!
    
    @IBOutlet weak var currentSubView: UIView!
    @IBOutlet weak var currentSubNameLabel: UILabel!
    @IBOutlet weak var currentSubActiveLabel: UILabel!
    @IBOutlet weak var currentSubPriceLabel: UILabel!
    @IBOutlet weak var currentSubPerDayPriceLabel: UILabel!
    @IBOutlet weak var currentSubPerDayLabel: UILabel!
    
    @IBOutlet weak var firstSubView: UIView!
    @IBOutlet weak var firstSubNameLabel: UILabel!
    @IBOutlet weak var firstSubPriceLabel: UILabel!
    @IBOutlet weak var firstSubPerDayPriceLabel: UILabel!
    @IBOutlet weak var firstSubPerDayLabel: UILabel!
    
    @IBOutlet weak var secondSubView: UIView!
    @IBOutlet weak var secondSubNameLabel: UILabel!
    @IBOutlet weak var secondSubPriceLabel: UILabel!
    @IBOutlet weak var secondSubPerDayPriceLabel: UILabel!
    @IBOutlet weak var secondSubPerDayLabel: UILabel!
    
    @IBOutlet weak var thirdSubView: UIView!
    @IBOutlet weak var thirdSubNameLabel: UILabel!
    @IBOutlet weak var thirdSubPriceLabel: UILabel!
    @IBOutlet weak var thirdSubPerDayPriceLabel: UILabel!
    @IBOutlet weak var thirdSubPerDayLabel: UILabel!
    
    @IBOutlet weak var fourSubView: UIView!
    @IBOutlet weak var fourSubNameLabel: UILabel!
    @IBOutlet weak var fourSubPriceLabel: UILabel!
    @IBOutlet weak var fourSubPerDayPriceLabel: UILabel!
    @IBOutlet weak var fourSubPerDayLabel: UILabel!
    
    @IBOutlet weak var subscribeButton: UIButton!
    @IBOutlet weak var restoreButton: UIButton!
    
    @IBOutlet weak var privacyLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var subsStackTopConstraint: NSLayoutConstraint!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    let screen: PaywallScreenType = .allSubs
    let place: PlaceType = .settings
    
    private lazy var presenter = SubscribePresenter(view: self)
    
    private var priceType: PaywallPriceType = .oneYear {
        didSet {
            updateSubsView()
        }
    }
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        presenter.retriveProduct(id: Set([PaywallPriceType.oneYear.productId, PaywallPriceType.theeMonth.productId, PaywallPriceType.oneMonth.productId, PaywallPriceType.oneWeek.productId]))
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        
        createPrivacyLabel()
        
        currentSubView.layer.borderWidth = 2
        currentSubView.layer.borderColor = UIColor(rgb: 0xCCBEE9).cgColor
        currentSubPerDayLabel.text = "per day"

        firstSubNameLabel.text = "One year"
        secondSubNameLabel.text = "3 month"
        thirdSubNameLabel.text = "1 mounh"
        fourSubNameLabel.text = "1 week"
        
        firstSubView.layer.borderWidth = 2
        secondSubView.layer.borderWidth = 2
        thirdSubView.layer.borderWidth = 2
        fourSubView.layer.borderWidth = 2
        
        if let subscription = KeychainService.standard.me?.Subscription, let externalId = subscription.Plan?.externalId, !externalId.isEmpty {
            activeSubView.isHidden = false
            subsStackTopConstraint.constant = 124.0
        } else {
            activeSubView.isHidden = true
            subsStackTopConstraint.constant = 16
        }
    }
    
    private func createPrivacyLabel() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.32
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x797889), .paragraphStyle: paragraphStyle]
        
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56), .paragraphStyle: paragraphStyle]
        
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
    
    func updateSubsView() {
        switch priceType {
        case .oneYear:
            firstSubView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            secondSubView.layer.borderColor = UIColor.clear.cgColor
            thirdSubView.layer.borderColor = UIColor.clear.cgColor
            fourSubView.layer.borderColor = UIColor.clear.cgColor
            
            firstSubView.backgroundColor = UIColor(rgb: 0xFCEDFB)
            secondSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            thirdSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            fourSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
        case .theeMonth:
            firstSubView.layer.borderColor = UIColor.clear.cgColor
            secondSubView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            thirdSubView.layer.borderColor = UIColor.clear.cgColor
            fourSubView.layer.borderColor = UIColor.clear.cgColor
            
            firstSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            secondSubView.backgroundColor = UIColor(rgb: 0xFCEDFB)
            thirdSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            fourSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
        case .oneMonth:
            firstSubView.layer.borderColor = UIColor.clear.cgColor
            secondSubView.layer.borderColor = UIColor.clear.cgColor
            thirdSubView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            fourSubView.layer.borderColor = UIColor.clear.cgColor
            
            firstSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            secondSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            thirdSubView.backgroundColor = UIColor(rgb: 0xFCEDFB)
            fourSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
        case .oneWeek:
            firstSubView.layer.borderColor = UIColor.clear.cgColor
            secondSubView.layer.borderColor = UIColor.clear.cgColor
            thirdSubView.layer.borderColor = UIColor.clear.cgColor
            fourSubView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            
            firstSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            secondSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            thirdSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            fourSubView.backgroundColor = UIColor(rgb: 0xFCEDFB)
        default:
            return
        }
    }
    
    func updateCurrentSub(externalId: String) {
        activeSubView.isHidden = false
        subsStackTopConstraint.constant = 124.0
        
        if externalId == PaywallPriceType.oneYear.productId {
            currentSubNameLabel.text = firstSubNameLabel.text
            currentSubPriceLabel.text = firstSubPriceLabel.text
            currentSubPerDayPriceLabel.text = firstSubPerDayPriceLabel.text
        } else if externalId == PaywallPriceType.theeMonth.productId {
            currentSubNameLabel.text = secondSubNameLabel.text
            currentSubPriceLabel.text = secondSubPriceLabel.text
            currentSubPerDayPriceLabel.text = secondSubPerDayPriceLabel.text
        } else if externalId == PaywallPriceType.oneMonth.productId {
            currentSubNameLabel.text = thirdSubNameLabel.text
            currentSubPriceLabel.text = thirdSubPriceLabel.text
            currentSubPerDayPriceLabel.text = thirdSubPerDayPriceLabel.text
        } else {
            currentSubNameLabel.text = fourSubNameLabel.text
            currentSubPriceLabel.text = fourSubPriceLabel.text
            currentSubPerDayPriceLabel.text = fourSubPerDayPriceLabel.text
        }
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        AnalyticsHelper.sendFirebaseEvents(events: .pay_close, params: ["place": place.rawValue, "screen": screen.rawValue])
        actionBack()
    }
    
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
        guard let text = self.privacyLabel.text else { return }
        let privacyPolicyRange = (text as NSString).range(of: RLocalization.login_privacy_policy())
        let termsAndConditionRange = (text as NSString).range(of: RLocalization.login_terms_use())
        let termsAndSubscribeRange = (text as NSString).range(of: RLocalization.login_terms_of_subscribe())
   
        if gesture.didTapAttributedTextInLabel(label: self.privacyLabel, inRange: privacyPolicyRange) {
            print("user tapped on privacy policy text")
            AnalyticsHelper.sendFirebaseEvents(events: .other_legal_open, params: ["open": "privacy", "place": place.rawValue, "screen": screen.rawValue])
            guard let url = URL(string: "https://mob325.com/izzifit/privacy_policy.html") else { return }
            UIApplication.shared.open(url)
        } else if gesture.didTapAttributedTextInLabel(label: self.privacyLabel, inRange: termsAndConditionRange) {
            print("user tapped on terms and conditions text")
            AnalyticsHelper.sendFirebaseEvents(events: .other_legal_open, params: ["open": "terms", "place": place.rawValue, "screen": screen.rawValue])
            guard let url = URL(string: "https://mob325.com/izzifit/terms_and_conditions.html") else { return }
            UIApplication.shared.open(url)
        } else if gesture.didTapAttributedTextInLabel(label: self.privacyLabel, inRange: termsAndSubscribeRange) {
            print("user tapped on terms and subscribe text")
            AnalyticsHelper.sendFirebaseEvents(events: .other_legal_open, params: ["open": "subscribe", "place": place.rawValue, "screen": screen.rawValue])
            guard let url = URL(string: "https://mob325.com/izzifit/terms_and_conditions.html") else { return }
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func actionUnsubscribe(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://apps.apple.com/account/subscriptions")!)
    }
    
    @IBAction func actionFirstSub(_ sender: UIButton) {
        priceType = .oneYear
    }
    
    @IBAction func actionSecondSub(_ sender: UIButton) {
        priceType = .theeMonth
    }
    
    @IBAction func actionThirdSub(_ sender: UIButton) {
        priceType = .oneMonth
    }
    
    @IBAction func actionFourSub(_ sender: UIButton) {
        priceType = .oneWeek
    }
    
    @IBAction func actionSubscribe(_ sender: UIButton) {
        presenter.purchase(id: priceType.productId, screen: screen, place: place) { [weak self] result, error in
            guard let `self` = self else { return }
            if result {
                if let subscription = KeychainService.standard.me?.Subscription, let externalId = subscription.Plan?.externalId, !externalId.isEmpty {
                    self.updateCurrentSub(externalId: externalId)
                }
                self.dismiss(animated: true)
            }
        }
    }
    
    @IBAction func actionRestore(_ sender: UIButton) {
        presenter.restore { [weak self] result in
            guard let `self` = self else { return }
            if result {
                if let subscription = KeychainService.standard.me?.Subscription, let externalId = subscription.Plan?.externalId, !externalId.isEmpty {
                    self.updateCurrentSub(externalId: externalId)
                }
                self.dismiss(animated: true)
            }
        }
    }
}

extension MenuSubscriptionsController: SubscribeOutputProtocol {
    func successRetrive() {
        
        activeSubView.isHidden = false
        subsStackView.isHidden = false
        
        var externalId = ""
        
        if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneYear.productId}) {
            firstSubPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", info.price)
            firstSubPerDayPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", info.price / 365)
            externalId = info.product
        }
        
        if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.theeMonth.productId}) {
            secondSubPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", info.price)
            secondSubPerDayPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", (info.price * 4) / 365)
            externalId = info.product
        }
        
        if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneMonth.productId}) {
            thirdSubPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", info.price)
            thirdSubPerDayPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", (info.price * 12) / 365)
            externalId = info.product
        }
        
        if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneWeek.productId}) {
            fourSubPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", info.price)
            fourSubPerDayPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", (info.price * 52) / 365)
            externalId = info.product
        }
        
        updateSubsView()
        updateCurrentSub(externalId: externalId)
    }
    
    func failure(error: String) {
        
    }
}
