
import UIKit

class PaywallCongratulationsController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var сongratulationsLabel: UILabel!
    @IBOutlet weak var infosLabel: UILabel!
    @IBOutlet weak var specialOfferLabel: UILabel!
    @IBOutlet weak var offSaveLabel: UILabel!
    @IBOutlet weak var unlockLabel: UILabel!
    @IBOutlet weak var wellbeingLabel: UILabel!
    @IBOutlet weak var hungerLabel: UILabel!
    @IBOutlet weak var caloriesGameLabel: UILabel!
    @IBOutlet weak var habitsLabel: UILabel!
    @IBOutlet weak var subNameLabel: UILabel!
    @IBOutlet weak var subSaveLabel: UILabel!
    @IBOutlet weak var subPriceLabel: UILabel!
    @IBOutlet weak var subFullPriceLabel: UILabel!
    @IBOutlet weak var subPerYearLabel: UILabel!
    
    @IBOutlet weak var priceView: UIView!
    
    @IBOutlet weak var subscribeButton: UIButton!
    @IBOutlet weak var trialButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    weak var delegate: PaywallProtocol?
    let screen: PaywallScreenType
    let place: PlaceType
    
    private lazy var presenter = SubscribePresenter(view: self)
    private var priceType: PaywallPriceType = .oneYear70
    private var trialType: PaywallTrialType = .oneYear70
    
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
        
        presenter.retriveProduct(id: Set([PaywallPriceType.oneYear70.productId]))
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        сongratulationsLabel.text = RLocalization.paywall_congratulation_title()
        infosLabel.text = RLocalization.paywall_congratulation_info()
        specialOfferLabel.text = RLocalization.paywall_congratulation_special_offer()
        unlockLabel.text = RLocalization.paywall_congratulation_unlock()
        wellbeingLabel.text = RLocalization.paywall_congratulation_wellbeing()
        hungerLabel.text = RLocalization.paywall_congratulation_hunger()
        caloriesGameLabel.text = RLocalization.paywall_congratulation_calories_game()
        habitsLabel.text = RLocalization.paywall_congratulation_habits()
        subNameLabel.text = RLocalization.paywall_congratulation_one_year()
        subPerYearLabel.text = RLocalization.paywall_congratulation_per_year()
        
        subscribeButton.setTitle(RLocalization.paywall_congratulation_subscribe(), for: .normal)
        trialButton.setTitle(RLocalization.paywall_congratulation_trial(), for: .normal)
        
        subscribeButton.layer.borderWidth = 2
        subscribeButton.layer.borderColor = UIColor(rgb: 0xC9C0ED, alpha: 0.3).cgColor
    }
    
    private func createOffSaveLabel(price: String) {
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: "Inter-BoldItalic", size: 20), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: "Inter-BoldItalic", size: 20), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0xFF42A8)]
        
        let attributedString1 = NSMutableAttributedString(string: "\(RLocalization.paywall_congratulation_get()) ", attributes:attrs1 as [NSAttributedString.Key : Any])
        let attributedString2 = NSMutableAttributedString(string: "\(RLocalization.paywall_congratulation_70_off()) ", attributes:attrs2 as [NSAttributedString.Key : Any])
        let attributedString3 = NSMutableAttributedString(string: "\(RLocalization.paywall_congratulation_and()) ", attributes:attrs1 as [NSAttributedString.Key : Any])
        let attributedString4 = NSMutableAttributedString(string: String(format: "%@ %@ ", RLocalization.paywall_congratulation_save(), price), attributes:attrs2 as [NSAttributedString.Key : Any])
        let attributedString5 = NSMutableAttributedString(string: RLocalization.paywall_congratulation_subscription(), attributes:attrs1 as [NSAttributedString.Key : Any])
        
        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        attributedString1.append(attributedString4)
        attributedString1.append(attributedString5)
        
        offSaveLabel.attributedText = attributedString1
    }
    
    //----------------------------------------------
    // MARK: - Acions
    //----------------------------------------------
    
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
//        presenter.purchase(id: priceType.productId, screen: screen, place: place) { [weak self] result, error in
//            guard let `self` = self else { return }
//            if result {
//                self.delegate?.paywallSuccess(controller: self)
//                self.dismiss(animated: true)
//            }
//        }
        AnalyticsHelper.sendFirebaseEvents(events: .pay_close, params: ["place": place.rawValue, "screen": screen.rawValue])
        self.delegate?.paywallActionBack(controller: self)
    }
}

//----------------------------------------------
// MARK: - SubscribeOutputProtocol
//----------------------------------------------

extension PaywallCongratulationsController: SubscribeOutputProtocol {
    
    func successRetrive() {
        priceView.isHidden = false
        switch screen {
        case .congratulations:
            if let info = presenter.paymentsInfo.first(where: {$0.product == PaywallPriceType.oneYear70.productId}) {
                let price = Float(info.price)
                let fullPrice = Float(info.price / 0.3)
                let diff = Int(ceil(fullPrice - price))
                
                let fullPriceStr = "\(Int(fullPrice)).99"
                let diffStr = "\(diff)"
                
                subPriceLabel.text = String(format: "%@%.2f", info.currencySymbol ?? "", price)
                subFullPriceLabel.text = String(format: "%@%@", info.currencySymbol ?? "", fullPriceStr)
                subSaveLabel.text = String(format: "%@ %@%@",  RLocalization.paywall_congratulation_save(), info.currencySymbol ?? "", diffStr)
                
                createOffSaveLabel(price: String(format: "%@%@", info.currencySymbol ?? "", diffStr))
            }
         default:
            return
        }
    }
    
    func failure(error: String) {
        
    }
}
