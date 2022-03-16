//
//  FoodController.swift
//  izzifit
//
//  Created by Andrey S on 14.03.2022.
//

import UIKit

class FoodController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var arrowDownImageView: UIImageView!
    
    @IBOutlet weak var bottomPickerLayout: NSLayoutConstraint!
    
    @IBOutlet weak var searchLabel: UILabel!
    
    @IBOutlet weak var proteinGrammLabel: UILabel!
    @IBOutlet weak var proteingGLeftLabel: UILabel!
    
    @IBOutlet weak var fatsGLabel: UILabel!
    @IBOutlet weak var fatsGLeftLabel: UILabel!
    
    @IBOutlet weak var carbsGLabel: UILabel!
    @IBOutlet weak var carbsGLeftLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var clearSearchButton: UIButton!
    @IBOutlet weak var stackSearch: UIStackView!
    
    @IBOutlet weak var shadowSearchView: ShadowView!
    @IBOutlet weak var addProductButton: UIButton!
    
    @IBOutlet weak var addProductView: UIView!
    @IBOutlet weak var searchTypeScroll: UIScrollView!
    @IBOutlet weak var stackProteinView: UIStackView!
    
    @IBOutlet weak var allLabel: UILabel!
    @IBOutlet weak var proteinsLabel: UILabel!
    @IBOutlet weak var fatsLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let foodIdentifier = String(describing: FoodRecomendedCell.self)
    private let foodTopTitleIdentifier = String(describing: FoodTopTitleCell.self)
    
    private var selectedType: MealType = .mealTypeBreakfast {
        didSet {
            topLabel.text = selectedType.text
        }
    }
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        addTapOnScreen = false
        hiddenNavigationBar = true
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        
        addProductButton.layer.borderWidth = 2
        addProductButton.layer.borderColor = UIColor(red: 0.8, green: 0.745, blue: 0.914, alpha: 1).cgColor
        
        proteinGrammLabel.text = RLocalization.food_proteins(100)
        proteingGLeftLabel.text = RLocalization.food_gramm_lefts(23)
        
        fatsGLabel.text = RLocalization.food_fats(111)
        fatsGLeftLabel.text  = RLocalization.food_gramm_lefts(23)
        
        carbsGLabel.text = RLocalization.food_carbs(222)
        carbsGLeftLabel.text = RLocalization.food_gramm_lefts(23)
        
        
        searchLabel.text = RLocalization.food_search()
        
        
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: foodIdentifier, bundle: nil), forCellReuseIdentifier: foodIdentifier)
        tableView.register(UINib(nibName: foodTopTitleIdentifier, bundle: nil), forCellReuseIdentifier: foodTopTitleIdentifier)
        
        pickerView.selectRow(MealType.allCases.firstIndex(where: {$0 == selectedType}) ?? 0, inComponent: 0, animated: false)
        
        searchView.layer.borderWidth = 1
        
        setupSerach(isActive: false)
        updateLabels()
    }
    
    private func updateLabels() {
        
        allLabel.text = "All"
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 14), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56)]
        
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 14), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0xFF42A8)]
        
        let attributedString1 = NSMutableAttributedString(string: "Proteins", attributes:attrs1 as [NSAttributedString.Key : Any])
        
        let attributedString2 = NSMutableAttributedString(string:" 4", attributes:attrs2 as [NSAttributedString.Key : Any])
        
        let attributedString3 = NSMutableAttributedString(string:"/40g", attributes:attrs1 as [NSAttributedString.Key : Any])
        
        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        
        self.proteinsLabel.attributedText = attributedString1
        
        let attributedString4 = NSMutableAttributedString(string: "Fats", attributes:attrs1 as [NSAttributedString.Key : Any])
        
        let attributedString5 = NSMutableAttributedString(string:" 4", attributes:attrs2 as [NSAttributedString.Key : Any])
        
        let attributedString6 = NSMutableAttributedString(string:"/40g", attributes:attrs1 as [NSAttributedString.Key : Any])
        
        attributedString4.append(attributedString5)
        attributedString4.append(attributedString6)
        
        self.fatsLabel.attributedText = attributedString4
        
        let attributedString7 = NSMutableAttributedString(string: "Carbs", attributes:attrs1 as [NSAttributedString.Key : Any])
        
        let attributedString8 = NSMutableAttributedString(string:" 4", attributes:attrs2 as [NSAttributedString.Key : Any])
        
        let attributedString9 = NSMutableAttributedString(string:"/40g", attributes:attrs1 as [NSAttributedString.Key : Any])
        
        attributedString7.append(attributedString8)
        attributedString7.append(attributedString9)
        
        self.carbsLabel.attributedText = attributedString7
    }
    
    private func setupSerach(isActive: Bool) {
        if isActive {
            stackSearch.isHidden = true
            shadowSearchView.isHidden = false
            clearSearchButton.isHidden = false
            searchView.layer.borderColor = UIColor(rgb: 0xD6B3FA).cgColor
        } else {
            stackSearch.isHidden = false
            shadowSearchView.isHidden = true
            clearSearchButton.isHidden = true
            
            searchView.layer.borderColor = UIColor(red: 0.879, green: 0.878, blue: 0.917, alpha: 1).cgColor
        }
    }
    
    //----------------------------------------------
    // MARK: - IBAction
    //----------------------------------------------
    
    @IBAction func actionClear(_ sender: UIButton) {
        searchTextField.text = ""
        setupSerach(isActive: isShowKeyboard)
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func actionTypeEat(_ sender: UIButton) {
        hideKeyboard()
        UIView.animate(withDuration: 0.3) {
            self.arrowDownImageView.transform = self.arrowDownImageView.transform.rotated(by: .pi)
            self.bottomPickerLayout.constant = self.bottomPickerLayout.constant == 0 ? -220 : 0
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return false
    }
}

//----------------------------------------------
// MARK: - UITableViewDataSource
//----------------------------------------------

extension FoodController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.foodTopTitleIdentifier) as? FoodTopTitleCell else { return    UITableViewCell() }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.foodIdentifier) as? FoodRecomendedCell else { return    UITableViewCell() }
            return cell
        }
    }
}

//----------------------------------------------
// MARK: - UIPickerViewDataSource, UIPickerViewDelegate
//----------------------------------------------

extension FoodController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return MealType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedType =  MealType.allCases[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label:UILabel
        
        if let v = view as? UILabel{
            label = v
        }
        else{
            label = UILabel()
        }
        
        label.textColor = UIColor(rgb: 0x3F3E56)
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Medium", size: 24)
        
        label.text = MealType.allCases[safe: row]?.text
        
        return label
    }
}

//----------------------------------------------
// MARK: - UITextFieldDelegate
//----------------------------------------------

extension FoodController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        addProductView.isHidden = false
        stackProteinView.isHidden = true
        searchTypeScroll.isHidden = false
        
        setupSerach(isActive: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        addProductView.isHidden = true
        stackProteinView.isHidden = false
        searchTypeScroll.isHidden = true
        
        if textField.text!.count > 0 {
            setupSerach(isActive: true)
        } else {
            setupSerach(isActive: false)
        }
    }
}
