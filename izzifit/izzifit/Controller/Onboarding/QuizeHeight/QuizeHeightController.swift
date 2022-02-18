//
//  QuizeHeightController.swift
//  izzifit
//
//  Created by Andrey S on 15.02.2022.
//

import UIKit

enum QuizeHeightType: Codable {
    case sm
    case ft
    
    var api: MeasureGrowth {
        switch self {
        case .sm:
            return .measureGrowthTypeSm
        case .ft:
            return .measureGrowthTypeFt
        }
    }
}

class QuizeHeightController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var goNextButton: UIButton!
    
    @IBOutlet weak var smView: UIView!
    @IBOutlet weak var ftView: UIView!
    
    @IBOutlet weak var smLabel: UILabel!
    @IBOutlet weak var ftLabel: UILabel!
    
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var leadingBorderLayout: NSLayoutConstraint!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private var smData = Array(120...230)
    
    private var ftData = Array(3...7)
    private var inchData = Array(1...11)
    
    private var quizeType: QuizeHeightType = .sm {
        didSet {
            if quizeType == oldValue {
                return
            }
            
            pickerView.reloadAllComponents()
            UIView.animate(withDuration: 0.3) {
                self.leadingBorderLayout.constant = self.quizeType == .sm ? 0 : self.smView.frame.width
                self.view.layoutIfNeeded()
            }
        }
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
        if let gender = PreferencesManager.sharedManager.tempPorifle.gender {
            switch gender {
            case .female:
                pickerView.selectRow(40, inComponent: 0, animated: false)
            case .male:
                pickerView.selectRow(60, inComponent: 0, animated: false)
            case .other:
                pickerView.selectRow(50, inComponent: 0, animated: false)
            }
        }
        
        borderView.layer.cornerRadius = 16
        borderView.layer.borderWidth = 2
        borderView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
        
        countLabel.text = RLocalization.onboarding_count(5, 9)
        mainTitleLabel.text = RLocalization.onboarding_height_title()
        smLabel.text = RLocalization.onboarding_height_sm()
        ftLabel.text = RLocalization.onboarding_height_ft()
        goNextButton.setTitle(RLocalization.onboarding_go_next(), for: .normal)
        
        smView.clipsToBounds = true
        smView.layer.cornerRadius = 16
        smView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        ftView.clipsToBounds = true
        ftView.layer.cornerRadius = 16
        ftView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func actionSM(_ sender: UIButton) {
        quizeType = .sm
    }
    
    @IBAction func actionFT(_ sender: UIButton) {
        quizeType = .ft
    }
    
    @IBAction func actionGoNext(_ sender: UIButton) {
        var model = PreferencesManager.sharedManager.tempPorifle
        model.setHeightMetric(quizeType)
        
        if quizeType == .sm {
            let index = pickerView.selectedRow(inComponent: 0)
            model.setSmHeight(smData[index])
        } else {
            let indexFt = pickerView.selectedRow(inComponent: 0)
            let indexInch = pickerView.selectedRow(inComponent: 1)
            
            model.setFtHeight(ft: ftData[indexFt], inch: inchData[indexInch])
        }
        PreferencesManager.sharedManager.tempPorifle = model
        OnboardingRouter(presenter: navigationController).pushWeight()
    }
}

//----------------------------------------------
// MARK: - UIPickerViewDataSource, UIPickerViewDelegate
//----------------------------------------------

extension QuizeHeightController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return quizeType == .sm ? 1 : 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if quizeType == .sm {
            return smData.count
        } else if component == 0 {
            return ftData.count
        } else {
            return inchData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Inter-Regular", size: 48)
            pickerLabel?.textAlignment = .center
        }
        
        if quizeType == .sm {
            pickerLabel?.text = String(smData[row])
        } else if component == 0 {
            pickerLabel?.text = String(ftData[row])
        } else {
            pickerLabel?.text = String(inchData[row])
        }
        
        pickerLabel?.textColor = UIColor(rgb: 0x3F3E56)
        
        return pickerLabel!
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80
    }
}
