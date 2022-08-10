
import UIKit

class PaywallMultiplyController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var exlusiveLabel: UILabel!
    @IBOutlet weak var personalLabel: UILabel!
    @IBOutlet weak var offerLabel: UILabel!
    
    @IBOutlet weak var subStackView: UIStackView!
        
    @IBOutlet weak var bestValueView: UIView!
    @IBOutlet weak var bestValueLabel: UILabel!
    
    @IBOutlet weak var firstSubView: UIView!
    @IBOutlet weak var firstSubNameLabel: UILabel!
    @IBOutlet weak var firstSubPriceLabel: UILabel!
    @IBOutlet weak var firstSubSalePriceLabel: UILabel!
    @IBOutlet weak var firstSubSaleDiscountLabel: UILabel!
    @IBOutlet weak var firstSubPerDayPriceLabel: UILabel!
    @IBOutlet weak var firstSubPerDayLabel: UILabel!
    
    @IBOutlet weak var secondSubView: UIView!
    @IBOutlet weak var secondSubNameLabel: UILabel!
    @IBOutlet weak var secondSubPriceLabel: UILabel!
    @IBOutlet weak var secondSubSalePriceLabel: UILabel!
    @IBOutlet weak var secondSubSaleDiscountLabel: UILabel!
    @IBOutlet weak var secondSubPerDayPriceLabel: UILabel!
    @IBOutlet weak var secondSubPerDayLabel: UILabel!
    @IBOutlet weak var secondSubSaleDiscountLineView: UIView!
    @IBOutlet weak var secondSubSaleDiscountLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var thirdSubView: UIView!
    @IBOutlet weak var thirdSubNameLabel: UILabel!
    @IBOutlet weak var thirdSubPriceLabel: UILabel!
    @IBOutlet weak var thirdSubSalePriceLabel: UILabel!
    @IBOutlet weak var thirdSubSaleDiscountLabel: UILabel!
    @IBOutlet weak var thirdSubPerDayPriceLabel: UILabel!
    @IBOutlet weak var thirdSubPerDayLabel: UILabel!
    @IBOutlet weak var thirdSubSaleDiscountLineView: UIView!
    @IBOutlet weak var thirdSubSaleDiscountLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var loseWeightLabel: UILabel!
    @IBOutlet weak var improveHealthLabel: UILabel!
    @IBOutlet weak var habitsLabel: UILabel!
    @IBOutlet weak var premiumLabel: UILabel!
    
    @IBOutlet weak var subscribeButton: UIButton!
    @IBOutlet weak var trialButton: UIButton!
    @IBOutlet weak var restoreButton: UIButton!
    
    @IBOutlet weak var privacyLabel: UILabel!
    @IBOutlet weak var purchaseInfoLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    weak var delegate: PaywallProtocol?
    let screen: PaywallScreenType
    let place: PlaceType
    
    private lazy var presenter = SubscribePresenter(view: self)
    
    private var priceType: PaywallPriceType = .threeMonth30 {
        didSet {
            updateSubsView()
        }
    }
    
    private var trialType: PaywallTrialType = .threeMonth30
    
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
        AnalyticsHelper.sendFirebaseEvents(events: .pay_open, params: ["place": place.rawValue, "screen": screen.rawValue])
        
        subStackView.isHidden = true
        bestValueView.isHidden = true
        
        firstSubView.layer.borderWidth = 2
        secondSubView.layer.borderWidth = 2
        thirdSubView.layer.borderWidth = 2
        
        thirdSubView.isHidden = screen == .threePrice ? false : true
        
        exlusiveLabel.text = RLocalization.paywall_multiply_exclusive()
        personalLabel.text = RLocalization.paywall_multiply_personal()
        offerLabel.text = RLocalization.paywall_multiply_offer()
        bestValueLabel.text = screen == .threePrice ? RLocalization.paywall_multiply_30_off() : RLocalization.paywall_multiply_best_value()
        firstSubNameLabel.text = screen == .threePrice ? RLocalization.paywall_multiply_three_mounth() : RLocalization.paywall_multiply_first_one_year()
        firstSubPerDayLabel.text = RLocalization.paywall_multiply_per_day()
        secondSubNameLabel.text = screen == .threePrice ? RLocalization.paywall_multiply_first_one_year() : RLocalization.paywall_multiply_one_mounth()
        secondSubPerDayLabel.text = RLocalization.paywall_multiply_per_day()
        thirdSubNameLabel.text = RLocalization.paywall_multiply_one_week()
        thirdSubPerDayLabel.text = RLocalization.paywall_multiply_per_day()
        loseWeightLabel.text = RLocalization.paywall_multiply_lose_weight()
        improveHealthLabel.text = RLocalization.paywall_multiply_improve_health()
        habitsLabel.text = RLocalization.paywall_multiply_habits()
        premiumLabel.text = RLocalization.paywall_multiply_premuim()
        purchaseInfoLabel.text = RLocalization.paywall_multiply_purchase_info()

        subscribeButton.setTitle(RLocalization.paywall_multiply_subscribe(), for: .normal)
        trialButton.setTitle(RLocalization.paywall_multiply_trial(), for: .normal)
        restoreButton.setTitle(RLocalization.paywall_multiply_restore(), for: .normal)
        
        trialButton.layer.borderWidth = 2
        trialButton.layer.borderColor = UIColor(rgb: 0xCCBEE9, alpha: 0.3).cgColor
        
        createPrivacyLabel()
        updateSubsView()
        
        presenter.retriveProduct(id: screen == .threePrice ? Set([PaywallPriceType.threeMonth30.productId, PaywallPriceType.oneYear.productId, PaywallPriceType.oneWeek.productId]) : Set([PaywallPriceType.oneYear50.productId, PaywallPriceType.oneMonth.productId]))
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
        case .oneYear50, .threeMonth30:
            firstSubView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            secondSubView.layer.borderColor = UIColor.clear.cgColor
            thirdSubView.layer.borderColor = UIColor.clear.cgColor
            
            firstSubView.backgroundColor = UIColor(rgb: 0xFCEDFB)
            secondSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            thirdSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
        case .oneYear, .oneMonth :
            firstSubView.layer.borderColor = UIColor.clear.cgColor
            secondSubView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            thirdSubView.layer.borderColor = UIColor.clear.cgColor
            
            firstSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            secondSubView.backgroundColor = UIColor(rgb: 0xFCEDFB)
            thirdSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
        case .oneWeek:
            firstSubView.layer.borderColor = UIColor.clear.cgColor
            secondSubView.layer.borderColor = UIColor.clear.cgColor
            thirdSubView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            
            firstSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            secondSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            thirdSubView.backgroundColor = UIColor(rgb: 0xFCEDFB)
        default:
            return
        }
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
    
    @IBAction func actionFirstSub(_ sender: UIButton) {
        priceType = screen == .threePrice ? .threeMonth30 : .oneYear50
        trialType = screen == .threePrice ? .threeMonth30 : .oneYear50
    }
    
    @IBAction func actionSecondSub(_ sender: UIButton) {
        priceType = screen == .threePrice ? .oneYear : .oneMonth
        trialType = screen == .threePrice ? .oneYear : .oneMonth
    }
    
    @IBAction func actionThirdSub(_ sender: UIButton) {
        priceType = .oneWeek
        trialType = .oneWeek
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
    
    @IBAction func actionTrial(_ sender: UIButton) {
        presenter.purchase(id: trialType.productId, screen: screen, place: place) { [weak self] result, error in
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

extension PaywallMultiplyController: SubscribeOutputProtocol {
    func successRetrive() {
        subStackView.isHidden = false
        bestValueView.isHidden = false
        
        switch screen {
        case .threePrice:
            if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.threeMonth30.productId}) {
                firstSubSalePriceLabel.text = String(format: "Sale %@%.2f", info.currencySymbol ?? "", info.price)
                firstSubSaleDiscountLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", (info.price / 0.7))
                firstSubPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", info.price / 90)
                firstSubPerDayPriceLabel.text = String(format: "%@%.2f ", info.currencySymbol ?? "", (info.price / 0.7) / 90)
            }
            if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneYear.productId}) {
                secondSubSalePriceLabel.text = ""
                secondSubSaleDiscountLabel.text = String(format: "Sale %@%.2f", info.currencySymbol ?? "", info.price)
                secondSubPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", info.price / 365)
                secondSubPerDayPriceLabel.text = ""
                secondSubSaleDiscountLineView.isHidden = true
                secondSubSaleDiscountLeadingConstraint.constant = 0
            }
            if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneWeek.productId}) {
                thirdSubSalePriceLabel.text = ""
                thirdSubSaleDiscountLabel.text = String(format: "Sale %@%.2f", info.currencySymbol ?? "", info.price)
                thirdSubPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", info.price / 7)
                thirdSubPerDayPriceLabel.text = ""
                thirdSubSaleDiscountLineView.isHidden = true
                thirdSubSaleDiscountLeadingConstraint.constant = 0
            }
        case .twoPrice:
            if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneYear50.productId}) {
                firstSubSalePriceLabel.text = String(format: "Sale %@%.2f", info.currencySymbol ?? "", info.price)
                firstSubSaleDiscountLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", (info.price * 2))
                firstSubPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", info.price / 365)
                firstSubPerDayPriceLabel.text = String(format: "%@%.2f ", info.currencySymbol ?? "", (info.price * 2) / 365)
            }
            if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneMonth.productId}) {
                secondSubSalePriceLabel.text = ""
                secondSubSaleDiscountLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", info.price)
                secondSubPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", info.price / 30)
                secondSubPerDayPriceLabel.text = ""
                secondSubSaleDiscountLineView.isHidden = true
                secondSubSaleDiscountLeadingConstraint.constant = 0
            }
        default:
            return
        }
        
        updateSubsView()
    }
    
    func failure(error: String) {
        
    }
}
