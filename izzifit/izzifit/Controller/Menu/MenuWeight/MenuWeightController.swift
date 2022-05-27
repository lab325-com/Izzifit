//
//  MenuWeightController.swift
//  izzifit
//
//  Created by Andrey S on 23.02.2022.
//

import UIKit

class MenuWeightController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var goNextButton: UIButton!
    
    @IBOutlet weak var kgView: UIView!
    @IBOutlet weak var lbView: UIView!
    
    @IBOutlet weak var kgLabel: UILabel!
    @IBOutlet weak var lbLabel: UILabel!
    
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var leadingBorderLayout: NSLayoutConstraint!
    
    @IBOutlet weak var currentCountLabel: UILabel!
    
    @IBOutlet weak var scrollKGView: UIScrollView!
    @IBOutlet weak var scrolLBView: UIScrollView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let halfWeight = UIScreen.main.bounds.size.width / 2
    private var type: QuizeWeightType = .kg {
        didSet {
            if type == oldValue {
                return
            }
            
            
            if let weight = weight {
                switch type {
                case .kg:
                    self.weight = weight * 0.45359237
                    if self.weight! < 30 {
                        self.weight = 30
                    } else if self.weight! > 220 {
                        self.weight = 220
                    }
                case .lb:
                    self.weight = weight / 0.45359237
                    
                    if self.weight! < 66 {
                        self.weight = 66
                    } else if self.weight! > 485 {
                        self.weight = 485
                    }
                }
            }
            
            self.scrolLBView.isHidden = type == .kg
            self.scrollKGView.isHidden = type == .lb
            
            self.initScrollOffset()
            
            let _ = self.calcValue()
            
            UIView.animate(withDuration: 0.3) {
                self.leadingBorderLayout.constant = self.type == .kg ? 0 : self.kgView.frame.width
                self.view.layoutIfNeeded()
            }
        }
    }
    
    private var baseKG: CGFloat {
        switch PreferencesManager.sharedManager.tempPorifle.gender {
        case .female:
            return 60
        case .male:
            return 80
        case .other:
            return 70
        default:
            return 60
        }
    }
    
    private var baseLB: CGFloat {
        switch PreferencesManager.sharedManager.tempPorifle.gender {
        case .female:
            return 132
        case .male:
            return 176
        case .other:
            return 154
        default:
            return 132
        }
    }
    
    private lazy var presenter = MenuPresenter(view: self)
    private var weight: Float?
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(weight: Float?) {
        self.type = KeychainService.standard.me?.weightMeasure == .weightMeasureTypeLb ? .lb : .kg
        self.weight = weight
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        hiddenNavigationBar = true
        super.viewDidLoad()

        setup()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        DispatchQueue.main.async {
            self.initScrollOffset()
        }
        
        UIView.animate(withDuration: 0.3) {
            self.leadingBorderLayout.constant = self.type == .kg ? 0 : self.kgView.frame.width
            self.view.layoutIfNeeded()
        }
        
        mainTitleLabel.text = RLocalization.onboarding_weight_title()
        kgLabel.text = RLocalization.onboarding_weight_kg()
        lbLabel.text = RLocalization.onboarding_weight_lb()
        goNextButton.setTitle(RLocalization.menu_save_changes(), for: .normal)
        
        borderView.layer.cornerRadius = 16
        borderView.layer.borderWidth = 2
        borderView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
        
        kgView.clipsToBounds = true
        kgView.layer.cornerRadius = 16
        kgView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        lbView.clipsToBounds = true
        lbView.layer.cornerRadius = 16
        lbView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    private func initScrollOffset() {
        if let weight = weight {
            if weight >= 66 && weight <= 485 {
                scrolLBView.contentOffset.x = CGFloat(9*weight) - halfWeight - 6*9
            } else {
                scrolLBView.contentOffset.x = 9*baseLB - halfWeight - 6*9
            }
            
            if weight >= 30 && weight <= 220 {
                scrollKGView.contentOffset.x = CGFloat(9*weight) - halfWeight
            } else {
                scrollKGView.contentOffset.x = 9*baseKG - halfWeight
            }
        } else {
            scrolLBView.contentOffset.x = 9*baseLB - halfWeight - 6*9
            scrollKGView.contentOffset.x = 9*baseKG - halfWeight
        }
    }
    
    private func calcValue() -> CGFloat {
        var value =  (scrollKGView.contentOffset.x + halfWeight) / 9
        
        if type == .lb {
            value =  (scrolLBView.contentOffset.x + halfWeight + 6*9) / 9
        }
        currentCountLabel.text = String(format: "%.1f", value)
        
        if let _ = weight {
            weight! = Float(currentCountLabel.text!)!
        }
        
        return value
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func actionKG(_ sender: UIButton) {
        type = .kg
    }
    
    @IBAction func actionLB(_ sender: UIButton) {
        type = .lb
    }
    
    @IBAction func actionGoNext(_ sender: UIButton) {
        
        let targetWeightMeasure = type.api
        let targetWeight = Double(currentCountLabel.text!)!
        
        presenter.profileUpdate(weightMeasure: targetWeightMeasure, weight: targetWeightMeasure == .weightMeasureTypeLb ? targetWeight  * 0.45359237 : targetWeight)
    }
}

//----------------------------------------------
// MARK: - UIScrollViewDelegate
//----------------------------------------------

extension MenuWeightController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = calcValue()
        
        if type == .kg {
            if value < 30 {
                scrollView.isScrollEnabled = false
                scrollView.contentOffset.x = 30*9 - halfWeight
            } else if value > 220 {
                scrollView.isScrollEnabled = false
                scrollView.contentOffset.x = 9*220 - halfWeight
            }
        } else {
            if value < 66 {
                scrollView.isScrollEnabled = false
                scrollView.contentOffset.x = 66*9 - halfWeight - 6*9
            } else if value > 485 {
                scrollView.isScrollEnabled = false
                scrollView.contentOffset.x = 9*485 - halfWeight - 6*9
            }
        }
        
        scrollView.isScrollEnabled = true
    }
}

//----------------------------------------------
// MARK: - MenuOutputProtocol
//----------------------------------------------

extension MenuWeightController: MenuOutputProtocol {
    func success() {
        NotificationCenter.default.post(name: Constants.Notifications.updateEnergyNotification,
                                        object: self,
                                        userInfo: nil)
        actionBack()
    }
    
    func failure() {}
}
