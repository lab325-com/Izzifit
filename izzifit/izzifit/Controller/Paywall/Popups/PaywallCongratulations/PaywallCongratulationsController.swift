
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
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        createOffSaveLabel()
    }
    
    private func createOffSaveLabel() {
        
    }
    
    //----------------------------------------------
    // MARK: - Acions
    //----------------------------------------------
    
    @IBAction func actionClose(_ sender: UIButton) {
//        AnalyticsHelper.sendFirebaseEvents(events: .pay_close, params: ["place": place.rawValue, "screen": screen.rawValue])
        self.delegate?.paywallActionBack(controller: self)
    }
    
    @IBAction func actionTrial(_ sender: UIButton) {
//        AnalyticsHelper.sendFirebaseEvents(events: .pay_buy_free_trial)
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
}

//----------------------------------------------
// MARK: - SubscribeOutputProtocol
//----------------------------------------------

extension PaywallCongratulationsController: SubscribeOutputProtocol {
    
    func successRetrive() {
        
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
                subscribeButton.setTitle(String(format: "%@ %@%@", RLocalization.paywall_one_time_subscribe(), info.currencySymbol ?? "", diffStr), for: .normal)
            }
            
         default:
            return
        }
    }
    
    func failure(error: String) {
        
    }
}
