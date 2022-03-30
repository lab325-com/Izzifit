//
//  EnergyUpdateWeightController.swift
//  izzifit
//
//  Created by Andrey S on 25.03.2022.
//

import UIKit

protocol EnergyUpdateWeightProtocol: AnyObject {
    func energyUpdateWeight(controller: EnergyUpdateWeightController)
}

class EnergyUpdateWeightController: BaseController {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var mainView: ShadowView!
    
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
    
    private lazy var presenter = MenuPresenter(view: self)
    private let halfWeight = UIScreen.main.bounds.size.width / 2
    private var type: QuizeWeightType = .kg {
        didSet {
            if type == oldValue {
                return
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
    
    weak var delegate: EnergyUpdateWeightProtocol?
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(delegate: EnergyUpdateWeightProtocol) {
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
        initScrollOffset()
        
        mainView.layer.cornerRadius = 30
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = UIColor(red: 0.34, green: 0.293, blue: 0.438, alpha: 0.2)
        }
        
        kgLabel.text = RLocalization.onboarding_weight_kg()
        lbLabel.text = RLocalization.onboarding_weight_lb()
        
        borderView.layer.cornerRadius = 16
        borderView.layer.borderWidth = 2
        borderView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
        
        kgView.clipsToBounds = true
        kgView.layer.cornerRadius = 16
        kgView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        lbView.clipsToBounds = true
        lbView.layer.cornerRadius = 16
        lbView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        mainView.addGestureRecognizer(swipeDown)
    }
    
    private func initScrollOffset() {
        scrolLBView.contentOffset.x = 9*baseLB - halfWeight - 6*9
        scrollKGView.contentOffset.x = 9*baseKG - halfWeight
    }
    
    private func calcValue() -> CGFloat {
        var value =  (scrollKGView.contentOffset.x + halfWeight) / 9
        
        if type == .lb {
            value =  (scrolLBView.contentOffset.x + halfWeight + 6*9) / 9
        }
        currentCountLabel.text = String(format: "%.1f", value)
        
        return value
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionKG(_ sender: UIButton) {
        type = .kg
    }
    
    @IBAction func actionLB(_ sender: UIButton) {
        type = .lb
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == .down {
            print("Swipe Down")
            dismiss(animated: true)
        }
    }
    
    @IBAction func actionUpdateWeight(_ sender: UIButton) {
        let targetWeightMeasure = type.api
        let targetWeight = Double(currentCountLabel.text!)!
        
        presenter.profileUpdate(weightMeasure: targetWeightMeasure, weight: targetWeight)
    }
}

//----------------------------------------------
// MARK: - UIScrollViewDelegate
//----------------------------------------------

extension EnergyUpdateWeightController: UIScrollViewDelegate {
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

extension EnergyUpdateWeightController: MenuOutputProtocol {
    func success() {
        delegate?.energyUpdateWeight(controller: self)
        dismiss(animated: true)
    }
    
    func failure() {
        
    }
}
