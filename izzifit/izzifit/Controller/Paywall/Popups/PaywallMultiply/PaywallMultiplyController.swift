
import UIKit

class PaywallMultiplyController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subStackView: UIStackView!
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    @IBOutlet weak var bestValueView: UIView!
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
    
    @IBOutlet weak var subscribeButton: UIButton!
    @IBOutlet weak var trialButton: UIButton!
    @IBOutlet weak var restoreButton: UIButton!
    
    @IBOutlet weak var privacyLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    weak var delegate: PaywallProtocol?
    let screen: PaywallScreenType
    let place: PlaceType
    
    private lazy var presenter = SubscribePresenter(view: self)
    
    private var priceType: PaywallPriceType = .oneYear50 {
        didSet {
            updateSubsView()
        }
    }
    
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
        AnalyticsHelper.sendFirebaseEvents(events: .pay_open, params: ["place": place.rawValue, "screen": screen.rawValue])
        
        subStackView.isHidden = true
        bestValueView.isHidden = true
        
        firstSubView.layer.borderWidth = 2
        secondSubView.layer.borderWidth = 2
        thirdSubView.layer.borderWidth = 2
        
        thirdSubView.isHidden = screen == .threePrice ? false : true
        
        firstSubPerDayLabel.text = "per day"
        secondSubPerDayLabel.text = "per day"
        thirdSubPerDayLabel.text = "per day"
        
        firstSubNameLabel.text = "12 month"
        secondSubNameLabel.text = screen == .threePrice ? "3 month" : "1 month"
        thirdSubNameLabel.text = "1 week"
        
        trialButton.layer.borderWidth = 2
        trialButton.layer.borderColor = UIColor(rgb: 0xCCBEE9, alpha: 0.3).cgColor
        
        createPrivacyLabel()
        updateSubsView()
        
        presenter.retriveProduct(id: screen == .threePrice ? Set([PaywallPriceType.oneYear50.productId, PaywallPriceType.theeMonth30.productId, PaywallPriceType.oneWeek.productId]) : Set([PaywallPriceType.oneYear50.productId, PaywallPriceType.oneMonth.productId]))
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
        case .oneYear50:
            firstSubView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            secondSubView.layer.borderColor = UIColor.clear.cgColor
            thirdSubView.layer.borderColor = UIColor.clear.cgColor
            
            firstSubView.backgroundColor = UIColor(rgb: 0xFCEDFB)
            secondSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            thirdSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            
//            subStackView.sendSubviewToBack(secondSubView)
//            subStackView.sendSubviewToBack(thirdSubView)
        case .theeMonth, .oneMonth, .theeMonth30:
            firstSubView.layer.borderColor = UIColor.clear.cgColor
            secondSubView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            thirdSubView.layer.borderColor = UIColor.clear.cgColor
            
            firstSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            secondSubView.backgroundColor = UIColor(rgb: 0xFCEDFB)
            thirdSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            
//            subStackView.sendSubviewToBack(firstSubView)
//            subStackView.sendSubviewToBack(thirdSubView)
        case .oneWeek:
            firstSubView.layer.borderColor = UIColor.clear.cgColor
            secondSubView.layer.borderColor = UIColor.clear.cgColor
            thirdSubView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            
            firstSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            secondSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            thirdSubView.backgroundColor = UIColor(rgb: 0xFCEDFB)
            
//            subStackView.sendSubviewToBack(firstSubView)
//            subStackView.sendSubviewToBack(secondSubView)
        default:
            return
        }
        
//        UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: {
//            switch self.priceType {
//            case .oneYear50:
//                self.firstSubView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//                self.secondSubView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//                self.thirdSubView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//            case .theeMonth, .oneMonth, .theeMonth30:
//                self.firstSubView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//                self.secondSubView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//                self.thirdSubView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//            case .oneWeek:
//                self.firstSubView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//                self.secondSubView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//                self.thirdSubView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//            case .oneYear:
//                return
//            }
//        }) { (_) in }
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
        priceType = .oneYear50
        trialType = .oneYear
    }
    
    @IBAction func actionSecondSub(_ sender: UIButton) {
        priceType = screen == .threePrice ? .theeMonth30 : .oneMonth
        trialType = .threeMonth
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
        AnalyticsHelper.sendFirebaseEvents(events: .pay_buy_free_trial)
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
        activity.isHidden = true
        
        switch screen {
        case .threePrice:
            if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneYear50.productId}) {
                firstSubSalePriceLabel.text = String(format: "Sale %@%.2f", info.currencySymbol ?? "", info.price)
                firstSubSaleDiscountLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", (info.price * 2))
                firstSubPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", info.price / 365)
                firstSubPerDayPriceLabel.text = String(format: "%@%.2f ", info.currencySymbol ?? "", (info.price * 2) / 365)
            }
            
            if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.theeMonth30.productId}) {
                secondSubSalePriceLabel.text = String(format: "Sale %@%.2f", info.currencySymbol ?? "", info.price)
                secondSubSaleDiscountLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", (info.price * 2))
                secondSubPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", info.price / 90)
                secondSubPerDayPriceLabel.text = String(format: "%@%.2f ", info.currencySymbol ?? "", (info.price * 2) / 90)
            }
            
            if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneWeek.productId}) {
                thirdSubSalePriceLabel.text = ""
                thirdSubSaleDiscountLabel.text = String(format: "Sale %@%.2f", info.currencySymbol ?? "", info.price)
                thirdSubPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", info.price / 14)
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
