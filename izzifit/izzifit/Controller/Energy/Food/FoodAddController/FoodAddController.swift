//
//  FoodAddController.swift
//  izzifit
//
//  Created by Andrey S on 21.03.2022.
//

import UIKit

protocol FoodAddControllerProtocol: AnyObject {
    func foodAddReload(controller: FoodAddController)
}

class FoodAddController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var mainView: ShadowView!
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var grammView: UIView!
    @IBOutlet weak var textView: UIView!
    
    @IBOutlet weak var grammTextField: UITextField!
    
    @IBOutlet weak var updataAddButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var proteinGrammLabel: UILabel!
    @IBOutlet weak var proteingGLeftLabel: UILabel!
    
    @IBOutlet weak var fatsGLabel: UILabel!
    @IBOutlet weak var fatsGLeftLabel: UILabel!
    
    @IBOutlet weak var carbsGLabel: UILabel!
    @IBOutlet weak var carbsGLeftLabel: UILabel!
    
    @IBOutlet weak var shadowView: ShadowView!
    
    @IBOutlet weak var grammsLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private var sourceByMeal: [SourcesByMealMainModel] = []
    private let isUpdate: Bool
    private let model: ProductsMainModel
    private let mealId: String
    
    private lazy var presenter = FoodAddPresenter(view: self)
    weak var delegate: FoodAddControllerProtocol?
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(sourceByMeal: [SourcesByMealMainModel], isUpdate: Bool, model: ProductsMainModel, mealID: String, delegate: FoodAddControllerProtocol) {
        self.mealId = mealID
        self.sourceByMeal = sourceByMeal
        self.isUpdate = isUpdate
        self.model = model
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
        addTapOnScreen = false
        super.viewDidLoad()
        
        setup()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        mainTitleLabel.text = model.name
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        mainView.addGestureRecognizer(swipeDown)
        
        setupProteintsView()
        
        updataAddButton.layer.cornerRadius = 24
        
        deleteButton.layer.cornerRadius = 24
        deleteButton.layer.borderWidth = 2
        deleteButton.layer.borderColor = UIColor(red: 0.799, green: 0.745, blue: 0.913, alpha: 1).cgColor
        
        grammView.layer.cornerRadius = 10
        grammView.layer.borderWidth = 1
        grammView.layer.borderColor = UIColor(red: 0.879, green: 0.878, blue: 0.917, alpha: 1).cgColor
        
        shadowView.isHidden = true
        shadowView.layer.cornerRadius = 10
        
        textView.layer.cornerRadius = 10
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor(red: 0.879, green: 0.878, blue: 0.917, alpha: 1).cgColor
        
        mainView.layer.cornerRadius = 30
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = UIColor(red: 0.34, green: 0.293, blue: 0.438, alpha: 0.2)
        }
        
        deleteButton.setTitle(RLocalization.food_delete(), for: .normal)
        
        if isUpdate {
            updataAddButton.setTitle(RLocalization.food_update(), for: .normal)
        } else {
            updataAddButton.setTitle("\(RLocalization.food_add()) \(model.name ?? "")", for: .normal)
            deleteButton.isHidden = true
        }
        
        grammsLabel.text = model.measure == .productMeasureTypePcs ? "pcs" : "gramm"
    
    }
    
    private func setupProteintsView() {
        
        let proteins = sourceByMeal.first(where: {$0.name == .sourceEntityTypeProteins})
        proteinGrammLabel.text = RLocalization.food_proteins(proteins?.eaten ?? 0)
        proteingGLeftLabel.text = RLocalization.food_gramm_lefts(proteins?.needed ?? 0)
        
        let fats = sourceByMeal.first(where: {$0.name == .sourceEntityTypeFats})
        fatsGLabel.text = RLocalization.food_fats(fats?.eaten ?? 0)
        fatsGLeftLabel.text  = RLocalization.food_gramm_lefts(fats?.needed ?? 0)
        
        let carbs = sourceByMeal.first(where: {$0.name == .sourceEntityTypeCarbs})
        carbsGLabel.text = RLocalization.food_carbs(carbs?.eaten ?? 0)
        carbsGLeftLabel.text = RLocalization.food_gramm_lefts(carbs?.needed ?? 0)
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == .down {
            print("Swipe Down")
            dismiss(animated: true)
        }
    }
    
    @IBAction func actionUpdateOrAdd(_ sender: UIButton) {
        if isUpdate, let gramm = Int(grammTextField.text!), grammTextField.text!.count > 0 {
            presenter.update(mealId: mealId, productId: model.id ?? "", amount: gramm)
        } else if let gramm = Int(grammTextField.text!), grammTextField.text!.count > 0 {
            presenter.add(mealId: mealId, productId: model.id ?? "", amount: gramm)
        }
    }
    
    @IBAction func actionDelete(_ sender: UIButton) {
        presenter.remove(mealId: mealId, productId: model.id ?? "")
    }
}

//----------------------------------------------
// MARK: - UITextFieldDelegate
//----------------------------------------------

extension FoodAddController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        shadowView.isHidden = false
        
        textView.backgroundColor = UIColor.white
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor(red: 0.84, green: 0.702, blue: 0.979, alpha: 1).cgColor
    }
}

//----------------------------------------------
// MARK: - FoodAddOutputProtocol
//----------------------------------------------

extension FoodAddController: FoodAddOutputProtocol {
    func success() {
        delegate?.foodAddReload(controller: self)
        dismiss(animated: true)
    }
    
    func successUpdate() {
        delegate?.foodAddReload(controller: self)
        dismiss(animated: true)
    }
    
    func successRemove() {
        delegate?.foodAddReload(controller: self)
        dismiss(animated: true)
    }
    
    func failure() {
        
    }
}
