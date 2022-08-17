
import UIKit

class PaywallOneTimeController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var oneTimeLabel: UILabel!
    @IBOutlet weak var personalLabel: UILabel!
    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var wellbeingLabel: UILabel!
    @IBOutlet weak var hungerLabel: UILabel!
    @IBOutlet weak var caloriesGameLabel: UILabel!
    @IBOutlet weak var habitsLabel: UILabel!
    @IBOutlet weak var premiumAccessLabel: UILabel!
    @IBOutlet weak var subNameLabel: UILabel!
    @IBOutlet weak var subSaveLabel: UILabel!
    @IBOutlet weak var subPriceLabel: UILabel!
    @IBOutlet weak var subFullPriceLabel: UILabel!
    @IBOutlet weak var subPerYearLabel: UILabel!
    @IBOutlet weak var privacyLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var priceStack: UIStackView!
    
    @IBOutlet weak var subscribeButton: UIButton!
    @IBOutlet weak var trialButton: UIButton!
    @IBOutlet weak var restoreButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    weak var delegate: PaywallProtocol?
    let screen: PaywallScreenType
    let place: PlaceType
    
    private lazy var presenter = SubscribePresenter(view: self)
    private var priceType: PaywallPriceType = .oneYear70
    private var trialType: PaywallTrialType = .oneYear
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(delegate: PaywallProtocol, screen: PaywallScreenType, place: PlaceType) {
        self.delegate = delegate
        self.screen = screen
        self.place = place
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        oneTimeLabel.text = RLocalization.paywall_one_time_one_time()
        personalLabel.text = RLocalization.paywall_one_time_personal()
        offerLabel.text = RLocalization.paywall_one_time_offer()
        
        wellbeingLabel.text = RLocalization.paywall_one_time_wellbeing()
        hungerLabel.text = RLocalization.paywall_one_time_hunger()
        caloriesGameLabel.text = RLocalization.paywall_one_time_calories_game()
        habitsLabel.text = RLocalization.paywall_one_time_habits()
        premiumAccessLabel.text = RLocalization.paywall_one_time_premium_access()
        
        subNameLabel.text = RLocalization.paywall_one_time_one_year()
        subPerYearLabel.text = RLocalization.paywall_one_time_per_year()
        infoLabel.text = RLocalization.paywall_one_time_purchase_info()
        
        createPrivacyLabel()
        
        
        restoreButton.setTitle(RLocalization.paywall_one_time_restore(), for: .normal)
        
        trialButton.layer.borderWidth = 2
        trialButton.layer.borderColor = UIColor(rgb: 0xCCBEE9, alpha: 0.3).cgColor
        
        presenter.retriveProduct(id: Set([PaywallPriceType.oneYear70.productId]))
        
        trialButton.setTitle("Start trial without discount", for: .normal)
        subscribeButton.setTitle("Get with 70% discount", for: .normal)
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
    
    @IBAction func actionClose(_ sender: UIButton) {
        AnalyticsHelper.sendFirebaseEvents(events: .pay_close, params: ["place": place.rawValue, "screen": screen.rawValue])
        self.delegate?.paywallActionBack(controller: self)
    }
    
    @IBAction func actionTrial(_ sender: UIButton) {
        AnalyticsHelper.sendFirebaseEvents(events: .pay_buy_free_trial, params: ["place": place.rawValue, "screen": screen.rawValue])
        presenter.purchase(id: trialType.productId, screen: screen, place: place) { [weak self] result, error in
            guard let `self` = self else { return }
            if result {
                self.delegate?.paywallSuccess(controller: self)
                self.dismiss(animated: true)
            }
        }
    }
    
    @IBAction func actionSubscribe(_ sender: UIButton) {
        presenter.purchase(id: priceType.productId, screen: screen, place: place) { [weak self] result, error in
            guard let `self` = self else { return }
            if result {
                self.delegate?.paywallSuccess(controller: self)
                self.dismiss(animated: true)
            }
        }
    }
    
    @IBAction func actionRestore(_ sender: UIButton) {
        presenter.restore { [weak self] result in
            guard let `self` = self else { return }
            if result {
                self.delegate?.paywallSuccess(controller: self)
                self.dismiss(animated: true)
            }
        }
    }
}

//----------------------------------------------
// MARK: - SubscribeOutputProtocol
//----------------------------------------------

extension PaywallOneTimeController: SubscribeOutputProtocol {
    
    func successRetrive() {
        priceStack.isHidden = false
        switch screen {
        case .oneTime:
            if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneYear70.productId}) {
                let price = Float(info.price)
                let fullPrice = Float(info.price / 0.3)
                let diff = Int(ceil(fullPrice - price))
                
                let fullPriceStr = "\(Int(fullPrice)).99"
                let diffStr = "\(diff)"
                
                subPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", price)
                subFullPriceLabel.text = String(format: "%@%@", info.currencySymbol ?? "", fullPriceStr)
                subSaveLabel.text = String(format: "%@ %@%@",  RLocalization.paywall_one_time_save(), info.currencySymbol ?? "", diffStr)
                
            }
        default:
            return
        }
    }
    
    func failure(error: String) {
        
    }
}
