
import UIKit

fileprivate let kLifetime50 = "com.lill.subscription.lifetime.50"
fileprivate let kYearly50 = "com.lill.subscription.yearly.50"

enum SubType {
    case firstSub
    case secondSub
    case thidrSub
}

class PaywallMultiplyController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subStackView: UIStackView!
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
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
    
    @IBOutlet weak var thirdSubView: UIView!
    @IBOutlet weak var thirdSubNameLabel: UILabel!
    @IBOutlet weak var thirdSubPriceLabel: UILabel!
    @IBOutlet weak var thirdSubSalePriceLabel: UILabel!
    @IBOutlet weak var thirdSubSaleDiscountLabel: UILabel!
    @IBOutlet weak var thirdSubPerDayPriceLabel: UILabel!
    @IBOutlet weak var thirdSubPerDayLabel: UILabel!
    
    @IBOutlet weak var subscribeButton: UIButton!
    @IBOutlet weak var restoreButton: UIButton!
    
    @IBOutlet weak var privacyLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    weak var delegate: PaywallProtocol?
    private lazy var presenter = SubscribePresenter(view: self)
    
    private var subType: SubType = .firstSub {
        didSet {
            updateSubsView()
        }
    }
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(delegate: PaywallProtocol) {
        self.delegate = delegate
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
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        subStackView.isHidden = true
        
        firstSubView.layer.borderWidth = 2
        secondSubView.layer.borderWidth = 2
        thirdSubView.layer.borderWidth = 2
        
        createPrivacyLabel()
        updateSubsView()
        
        presenter.retriveProduct(id: Set(PaywallPriceType.allCases.compactMap({$0.productId})))
    }
    
    private func createPrivacyLabel() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.32
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56), .paragraphStyle: paragraphStyle]
        
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x797889), .paragraphStyle: paragraphStyle]
        
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
        switch subType {
        case .firstSub:
            firstSubView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            secondSubView.layer.borderColor = UIColor.clear.cgColor
            thirdSubView.layer.borderColor = UIColor.clear.cgColor
            
            firstSubView.backgroundColor = UIColor(rgb: 0xFCEDFB)
            secondSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            thirdSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            
            subStackView.sendSubviewToBack(secondSubView)
            subStackView.sendSubviewToBack(thirdSubView)
        case .secondSub:
            firstSubView.layer.borderColor = UIColor.clear.cgColor
            secondSubView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            thirdSubView.layer.borderColor = UIColor.clear.cgColor
            
            firstSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            secondSubView.backgroundColor = UIColor(rgb: 0xFCEDFB)
            thirdSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            
            subStackView.sendSubviewToBack(firstSubView)
            subStackView.sendSubviewToBack(thirdSubView)
        case .thidrSub:
            firstSubView.layer.borderColor = UIColor.clear.cgColor
            secondSubView.layer.borderColor = UIColor.clear.cgColor
            thirdSubView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            
            firstSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            secondSubView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            thirdSubView.backgroundColor = UIColor(rgb: 0xFCEDFB)
            
            subStackView.sendSubviewToBack(firstSubView)
            subStackView.sendSubviewToBack(secondSubView)
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: {
            switch self.subType {
            case .firstSub:
                self.firstSubView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                self.secondSubView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.thirdSubView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            case .secondSub:
                self.firstSubView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.secondSubView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                self.thirdSubView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            case .thidrSub:
                self.firstSubView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.secondSubView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.thirdSubView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }
        }) { (_) in }
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
    
    @IBAction func actionClose(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func actionFirstSub(_ sender: UIButton) {
        subType = .firstSub
    }
    
    @IBAction func actionSecondSub(_ sender: UIButton) {
        subType = .secondSub
    }
    
    @IBAction func actionThirdSub(_ sender: UIButton) {
        subType = .thidrSub
    }
    
    @IBAction func actionSubscribe(_ sender: UIButton) {
        
    }
    
    @IBAction func actionRestore(_ sender: UIButton) {
        
    }
}

//----------------------------------------------
// MARK: - SubscribeOutputProtocol
//----------------------------------------------

extension PaywallMultiplyController: SubscribeOutputProtocol {
    func successRetrive() {
        subStackView.isHidden = false
        activity.isHidden = true
        
//        if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneWeek.productId}) {
//            weekPeriodLabel.text = "\(info.number)\n\(info.period)"
//            weekPriceLabel.text = info.prettyPrice
//        }
//        
//        if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneYear.productId}) {
//            yearPeriodLabel.text = "\(info.number)\n\(info.period)"
//            yearPriceLabel.text = info.prettyPrice
//        }
//        
//        if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.theeMonth.productId}) {
//            threePeriodLabel.text = "\(info.number)\n\(info.period)"
//            threeMonthPriceLabel.text = info.prettyPrice
//        }
        
        updateSubsView()
    }
    
    func failure(error: String) {
        
    }
}
