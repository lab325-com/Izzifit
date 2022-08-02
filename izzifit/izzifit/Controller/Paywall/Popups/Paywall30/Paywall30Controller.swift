//
//  Paywall30Controller.swift
//  izzifit
//
//  Created by Andrey S on 02.08.2022.
//

import UIKit

extension PaywallScreenType {
    var discountPush: UIImage? {
        switch self {
        case .variant11:
            return UIImage(named: "paywall_30_percent_ic")
        case .variant12, .variant13:
            return UIImage(named: "paywall_50_percent_ic")
        default:
            return nil
        }
    }
    
    var girlPush: UIImage? {
        switch self {
        case .variant11:
            return UIImage(named: "paywall_30_girl_ic")
        case .variant12:
            return UIImage(named: "paywall_50_var12_girl_ic")
        case .variant13:
            return UIImage(named: "paywall_50_var13_girl_ic")
        default:
            return nil
        }
    }
    
    var idPushPrice: PaywallPriceType {
        switch self {
        case .variant11:
            return .threeMonth30FreeTrial
        case .variant12:
            return .threeMonth50FreeTrial
        case .variant13:
            return .oneYear50FreeTrial
        default:
            return .threeMonth30FreeTrial
        }
    }
    
    var diffPush: Double {
        switch self {
        case .variant11:
            return 1.3
        case .variant12:
            return 1.5
        case .variant13:
            return 1.5
        default:
            return 1.3
        }
    }
}

class Paywall30Controller: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var subView: UIView!
    
    @IBOutlet weak var subNameLabel: UILabel!
    @IBOutlet weak var subPriceLabel: UILabel!
    @IBOutlet weak var subSalePriceLabel: UILabel!
    @IBOutlet weak var subPerDayPriceLabel: UILabel!
    
    @IBOutlet weak var subscribeButton: UIButton!
    @IBOutlet weak var saveMoneyButton: UIButton!
    @IBOutlet weak var restoreButton: UIButton!
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    @IBOutlet weak var privacyLabel: UILabel!
    @IBOutlet weak var pearYear: UILabel!
    
    @IBOutlet weak var percentImageView: UIImageView!
    @IBOutlet weak var girlImageView: UIImageView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    weak var delegate: PaywallProtocol?
    
    private var priceType: PaywallPriceType = .threeMonth30FreeTrial
    private lazy var presenter = SubscribePresenter(view: self)
    
    let screen: PaywallScreenType
    let place: PlaceType
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(delegate: PaywallProtocol, screen: PaywallScreenType, place: PlaceType) {
        self.delegate = delegate
        self.screen = screen
        self.place = place
        
        self.priceType = screen.idPushPrice
        
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
        percentImageView.image = screen.discountPush
        girlImageView.image = screen.girlPush
        
        AnalyticsHelper.sendFirebaseEvents(events: .pay_open,  params: ["place": place.rawValue, "screen": screen.rawValue])
        subView.isHidden = true
    
        createPrivacyLabel()
        
        presenter.retriveProduct(id: Set([priceType.productId]))
        
        saveMoneyButton.layer.cornerRadius = 24
        saveMoneyButton.layer.borderWidth = 2
        saveMoneyButton.layer.borderColor = UIColor(red: 0.799, green: 0.745, blue: 0.913, alpha: 1).cgColor
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
        AnalyticsHelper.sendFirebaseEvents(events: .pay_close,  params: ["place": place.rawValue, "screen": screen.rawValue])
        self.delegate?.paywallActionBack(controller: self)
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

extension Paywall30Controller: SubscribeOutputProtocol {
    func successRetrive() {
        subView.isHidden = false
        activity.isHidden = true
        
        if let info = presenter.paymentsInfo.first {
            subNameLabel.text = "\(info.number) \(info.period)"
            subSalePriceLabel.text = String(format: "Save %@%.2f", info.currencySymbol ?? "", info.price * screen.diffPush - info.price)
            subPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", info.price)
            subPerDayPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", info.price * screen.diffPush)
            
            if screen == .variant13 {
                subNameLabel.text = "One year"
                pearYear.isHidden = false
            }
        }
    }
    
    func failure(error: String) {
        
    }
}
