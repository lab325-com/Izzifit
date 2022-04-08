//
//  PaywallController.swift
//  izzifit
//
//  Created by Andrey S on 04.04.2022.
//

import UIKit

enum PaywallPriceType: CaseIterable {
    case oneWeek
    case oneYear
    case theeMonth
    
    var productId: String {
        switch self {
        case .oneWeek:
            return "izzifit_one_week"
        case .oneYear:
            return "izzifit_one_year"
        case .theeMonth:
            return "izzifit_three_month"
        }
    }
}

class PaywallController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var privacyLabel: UILabel!
    
    @IBOutlet weak var priceStackView: UIStackView!
    @IBOutlet weak var productActivity: UIActivityIndicatorView!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var threeView: UIView!
    
    @IBOutlet weak var weekPeriodLabel: UILabel!
    @IBOutlet weak var yearPeriodLabel: UILabel!
    @IBOutlet weak var threePeriodLabel: UILabel!
    
    @IBOutlet weak var weekPriceLabel: UILabel!
    @IBOutlet weak var yearPriceLabel: UILabel!
    @IBOutlet weak var threeMonthPriceLabel: UILabel!
    
    @IBOutlet weak var continueButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private var isStopped = false
    private let animationDuration = 0.15 * 5
    private var priceType: PaywallPriceType = .oneYear {
        didSet {
            updatePriceView()
        }
    }
    
    private lazy var presenter = SubscribePresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        perform(#selector(startContinueButtonAnimation), with: nil, afterDelay: 1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        isStopped = true
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        continueButton.setTitle("", for: .normal)
        
        firstView.layer.borderWidth = 2
        secondView.layer.borderWidth = 2
        threeView.layer.borderWidth = 2
        
        updatePriceView()
        createPrivacyLabel()
        self.secondView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        priceStackView.isHidden = true
        
        presenter.retriveProduct(id: Set(PaywallPriceType.allCases.compactMap({$0.productId})))
    }
    
    private func createPrivacyLabel() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.32
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56), .paragraphStyle: paragraphStyle]
        
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x797889), .paragraphStyle: paragraphStyle]
        
        let attributedString1 = NSMutableAttributedString(string:RLocalization.login_by_continue(), attributes:attrs1 as [NSAttributedString.Key : Any])
        
        let attributedString2 = NSMutableAttributedString(string:" \(RLocalization.login_privacy_policy())\n\(RLocalization.login_terms_use())", attributes:attrs2 as [NSAttributedString.Key : Any])
        
        let attributedString3 = NSMutableAttributedString(string:" \( RLocalization.login_and()) ", attributes:attrs1 as [NSAttributedString.Key : Any])
        
        let attributedString4 = NSMutableAttributedString(string:RLocalization.login_terms_of_subscribe(), attributes:attrs2 as [NSAttributedString.Key : Any])
        
        
        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        attributedString1.append(attributedString4)
        
        self.privacyLabel.attributedText = attributedString1
        privacyLabel.textAlignment = .center
        self.privacyLabel.isUserInteractionEnabled = true
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnLabel(_ :)))
        tapgesture.numberOfTapsRequired = 1
        self.privacyLabel.addGestureRecognizer(tapgesture)
    }
    
    private func updatePriceView() {
        if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneYear.productId}) {
            yearPeriodLabel.text = "\(info.number)\n\(info.period)"
            yearPriceLabel.text = info.prettyPrice
        }
        
        if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.theeMonth.productId}) {
            threePeriodLabel.text = "\(info.number)\n\(info.period)"
            threeMonthPriceLabel.text = info.prettyPrice
        }
        
        switch priceType {
        case .oneWeek:
            if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneWeek.productId}) {
                continueButton.setTitle(info.daysTrial == nil ? "Continue" : "Try \(info.daysTrial ?? 0) days free!", for: .normal)
            }
            
            firstView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            secondView.layer.borderColor = UIColor.clear.cgColor
            threeView.layer.borderColor = UIColor.clear.cgColor
            
            firstView.backgroundColor = UIColor(rgb: 0xFCEDFB)
            secondView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            threeView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            
            priceStackView.sendSubviewToBack(secondView)
            priceStackView.sendSubviewToBack(threeView)
        case .oneYear:
            if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneYear.productId}) {
                continueButton.setTitle(info.daysTrial == nil ? "Continue" : "Try \(info.daysTrial ?? 0) days free!", for: .normal)
            }
            
            firstView.layer.borderColor = UIColor.clear.cgColor
            secondView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            threeView.layer.borderColor = UIColor.clear.cgColor
            
            firstView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            secondView.backgroundColor = UIColor(rgb: 0xFCEDFB)
            threeView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            
            priceStackView.sendSubviewToBack(firstView)
            priceStackView.sendSubviewToBack(threeView)
        case .theeMonth:
            if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.theeMonth.productId}) {
                continueButton.setTitle(info.daysTrial == nil ? "Continue" : "Try \(info.daysTrial ?? 0) days free!", for: .normal)
            }
            
            firstView.layer.borderColor = UIColor.clear.cgColor
            secondView.layer.borderColor = UIColor.clear.cgColor
            threeView.layer.borderColor =  UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            
            firstView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            secondView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            threeView.backgroundColor = UIColor(rgb: 0xFCEDFB)
            
            priceStackView.sendSubviewToBack(secondView)
            priceStackView.sendSubviewToBack(firstView)
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: {
            switch self.priceType {
            case .oneWeek:
                self.firstView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                self.secondView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.threeView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            case .oneYear:
                self.firstView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.secondView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                self.threeView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            case .theeMonth:
                self.firstView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.secondView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.threeView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }
            
            
        }) { (_) in }
        
        
    }
    
    //----------------------------------------------
    // MARK: - Acions
    //----------------------------------------------
    
    @objc func startContinueButtonAnimation() {
        
//        guard isStopped == false else {
//            UIView.animate(withDuration: animationDuration, delay: 0, options: .allowUserInteraction, animations: {
//                self.secondView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//            }) { (_) in }
//
//            return
//        }
//
//        UIView.animate(withDuration: animationDuration, delay: 0, options: .allowUserInteraction, animations: {
//            self.secondView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
//        }) { (_) in
//            UIView.animate(withDuration: self.animationDuration, delay: 0, options: .allowUserInteraction, animations: {
//                self.secondView.transform = CGAffineTransform.identity
//            }, completion: { (_) in
//                self.perform(#selector(self.startContinueButtonAnimation), with: nil, afterDelay: 0.3)
//            })
//        }
    }
    
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
        guard let text = self.privacyLabel.text else { return }
        let privacyPolicyRange = (text as NSString).range(of: RLocalization.login_privacy_policy())
        let termsAndConditionRange = (text as NSString).range(of: RLocalization.login_terms_use())
        let termsAndSubscribeRange = (text as NSString).range(of: RLocalization.login_terms_of_subscribe())
        
        if gesture.didTapAttributedTextInLabel(label: self.privacyLabel, inRange: privacyPolicyRange) {
            print("user tapped on privacy policy text")
            guard let url = URL(string: "https://stackoverflow.com") else { return }
            UIApplication.shared.open(url)
        } else if gesture.didTapAttributedTextInLabel(label: self.privacyLabel, inRange: termsAndConditionRange) {
            print("user tapped on terms and conditions text")
            guard let url = URL(string: "https://stackoverflow.com") else { return }
            UIApplication.shared.open(url)
        } else if gesture.didTapAttributedTextInLabel(label: self.privacyLabel, inRange: termsAndSubscribeRange) {
            print("user tapped on terms and subscribe text")
            guard let url = URL(string: "https://stackoverflow.com") else { return }
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func actionOneMonth(_ sender: UIButton) {
        priceType = .oneWeek
    }
    
    @IBAction func actionOneYear(_ sender: UIButton) {
        priceType = .oneYear
    }
    
    @IBAction func actionThreeMonth(_ sender: UIButton) {
        priceType = .theeMonth
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        RootRouter.sharedInstance.loadMain(toWindow: RootRouter.sharedInstance.window!)
    }
    
    @IBAction func actionSubscription(_ sender: UIButton) {
        presenter.purchase(id: priceType.productId) { result, error in
            if result {
                RootRouter.sharedInstance.loadMain(toWindow: RootRouter.sharedInstance.window!)
            }
        }
    }
    
    @IBAction func actionRestore(_ sender: UIButton) {
        presenter.restore { result in
            if result {
                RootRouter.sharedInstance.loadMain(toWindow: RootRouter.sharedInstance.window!)
            }
        }
    }
}

//----------------------------------------------
// MARK: - SubscribeOutputProtocol
//----------------------------------------------

extension PaywallController: SubscribeOutputProtocol {
    func successRetrive() {
        priceStackView.isHidden = false
        productActivity.isHidden = true
        
        if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneWeek.productId}) {
            weekPeriodLabel.text = "\(info.number)\n\(info.period)"
            weekPriceLabel.text = info.prettyPrice
        }
        
        if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneYear.productId}) {
            yearPeriodLabel.text = "\(info.number)\n\(info.period)"
            yearPriceLabel.text = info.prettyPrice
        }
        
        if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.theeMonth.productId}) {
            threePeriodLabel.text = "\(info.number)\n\(info.period)"
            threeMonthPriceLabel.text = info.prettyPrice
        }
        
        updatePriceView()
    }
    
    func failure(error: String) {
        
    }
}
