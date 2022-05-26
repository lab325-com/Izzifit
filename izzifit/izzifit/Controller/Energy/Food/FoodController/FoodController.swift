//
//  FoodController.swift
//  izzifit
//
//  Created by Andrey S on 14.03.2022.
//

import UIKit

enum SearchSourceType {
    case all
    case protein
    case fats
    case carbs
}

protocol FoodControllerProtocol: AnyObject {
    func foodControllerUpdate(controller: FoodController)
}

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
    
    @IBOutlet weak var allView: UIView!
    @IBOutlet weak var proteinView: UIView!
    @IBOutlet weak var fatsView: UIView!
    @IBOutlet weak var carbsView: UIView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let foodIdentifier = String(describing: FoodRecomendedCell.self)
    private let foodTopTitleIdentifier = String(describing: FoodTopTitleCell.self)
    
    private lazy var presenter  = FoodPresenter(view: self)
    private let mealsWidget: MealsWidgetMainModel
    private var currentMealType: MealType {
        didSet {
            topLabel.text = currentMealType.text
            presenter.getProducts(mealTypes: currentMealType, mealId: mealsWidget.meals?.first(where: {$0?.type == currentMealType})??.id ?? "")
        }
    }
    
    private var searchSource: SearchSourceType = .all {
        didSet {
            if searchSource != oldValue {
                
                startSearh()
                
                setupSearchSource()
                updateLabels()
            }
        }
    }
    
    private var isSearch = false {
        didSet {
            tableView.reloadData()
        }
    }
    
    weak var delegate: FoodControllerProtocol?
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(mealsWidget: MealsWidgetMainModel, currentMealType: MealType, delegate: FoodControllerProtocol) {
        self.mealsWidget = mealsWidget
        self.currentMealType = currentMealType
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
        hiddenNavigationBar = true
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        stackProteinView.isHidden = true
        
        tableView.isHidden = true
        
        topLabel.text = currentMealType.text
        presenter.getProducts(mealTypes: currentMealType, mealId: mealsWidget.meals?.first(where: {$0?.type == currentMealType})??.id ?? "")
        
        addProductButton.layer.borderWidth = 2
        addProductButton.layer.borderColor = UIColor(red: 0.8, green: 0.745, blue: 0.914, alpha: 1).cgColor
        
        searchLabel.text = RLocalization.food_search()
        
        
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: foodIdentifier, bundle: nil), forCellReuseIdentifier: foodIdentifier)
        tableView.register(UINib(nibName: foodTopTitleIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: foodTopTitleIdentifier)
        
        pickerView.selectRow(MealType.allCases.firstIndex(where: {$0 == currentMealType}) ?? 0, inComponent: 0, animated: false)
        
        searchView.layer.borderWidth = 1
        
        setupSerach(isActive: false)
        
    }
    
    private func updateLabels() {
        
        allLabel.text = "All"
        allLabel.textColor = searchSource == .all ? UIColor.white : UIColor(rgb: 0x3F3E56)
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 14), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56)]
        
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 14), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0xFF42A8)]
        
        let attrsWhite = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 14), NSAttributedString.Key.foregroundColor : UIColor.white]
        
        let proteins = presenter.sourceByMeal.first(where: {$0.name == .sourceEntityTypeProteins})
        let attributedString1 = NSMutableAttributedString(string: RLocalization.food_main_proteins(), attributes: searchSource == .protein ? attrsWhite as [NSAttributedString.Key : Any] : attrs1 as [NSAttributedString.Key : Any])
        
        let attributedString2 = NSMutableAttributedString(string:" \(proteins?.eaten  ?? 0)", attributes: searchSource == .protein ? attrsWhite as [NSAttributedString.Key : Any] : attrs2 as [NSAttributedString.Key : Any])
        
        let attributedString3 = NSMutableAttributedString(string:"/\(proteins?.needed ?? 0)g", attributes: searchSource == .protein ? attrsWhite as [NSAttributedString.Key : Any] : attrs1 as [NSAttributedString.Key : Any])
        
        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        
        self.proteinsLabel.attributedText = attributedString1
        
        let fats = presenter.sourceByMeal.first(where: {$0.name == .sourceEntityTypeFats})
        let attributedString4 = NSMutableAttributedString(string: RLocalization.food_main_fats(), attributes: searchSource == .fats ? attrsWhite as [NSAttributedString.Key : Any] : attrs1 as [NSAttributedString.Key : Any])
        
        let attributedString5 = NSMutableAttributedString(string:" \(fats?.eaten  ?? 0)", attributes: searchSource == .fats ? attrsWhite as [NSAttributedString.Key : Any] : attrs2 as [NSAttributedString.Key : Any])
        
        let attributedString6 = NSMutableAttributedString(string:"/\(fats?.needed ?? 0)g", attributes: searchSource == .fats ? attrsWhite as [NSAttributedString.Key : Any] : attrs1 as [NSAttributedString.Key : Any])
        
        attributedString4.append(attributedString5)
        attributedString4.append(attributedString6)
        
        self.fatsLabel.attributedText = attributedString4
        
        let carbs = presenter.sourceByMeal.first(where: {$0.name == .sourceEntityTypeCarbs})
        let attributedString7 = NSMutableAttributedString(string: RLocalization.food_main_carbs(), attributes: searchSource == .carbs ? attrsWhite as [NSAttributedString.Key : Any] : attrs1 as [NSAttributedString.Key : Any])
        
        let attributedString8 = NSMutableAttributedString(string:" \(carbs?.eaten  ?? 0)", attributes: searchSource == .carbs ? attrsWhite as [NSAttributedString.Key : Any] : attrs2 as [NSAttributedString.Key : Any])
        
        let attributedString9 = NSMutableAttributedString(string:"/\(carbs?.needed ?? 0)g", attributes: searchSource == .carbs ? attrsWhite as [NSAttributedString.Key : Any] : attrs1 as [NSAttributedString.Key : Any])
        
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
    
    private func setupProteintsView() {
        
        let proteins = presenter.sourceByMeal.first(where: {$0.name == .sourceEntityTypeProteins})
        proteinGrammLabel.text = RLocalization.food_proteins(proteins?.eaten ?? 0)
        proteingGLeftLabel.text = RLocalization.food_gramm_lefts(proteins?.needed ?? 0)
        
        let fats = presenter.sourceByMeal.first(where: {$0.name == .sourceEntityTypeFats})
        fatsGLabel.text = RLocalization.food_fats(fats?.eaten ?? 0)
        fatsGLeftLabel.text  = RLocalization.food_gramm_lefts(fats?.needed ?? 0)
        
        let carbs = presenter.sourceByMeal.first(where: {$0.name == .sourceEntityTypeCarbs})
        carbsGLabel.text = RLocalization.food_carbs(carbs?.eaten ?? 0)
        carbsGLeftLabel.text = RLocalization.food_gramm_lefts(carbs?.needed ?? 0)
    }
    
    private func setupSearchSource() {
        switch searchSource {
        case .all:
            allView.backgroundColor = UIColor(rgb: 0xFF42A8)
           proteinView.backgroundColor = UIColor(rgb: 0xF1EFF5)
           fatsView.backgroundColor = UIColor(rgb: 0xF1EFF5)
           carbsView.backgroundColor = UIColor(rgb: 0xF1EFF5)
        case .protein:
            allView.backgroundColor = UIColor(rgb: 0xF1EFF5)
           proteinView.backgroundColor = UIColor(rgb: 0xFF42A8)
           fatsView.backgroundColor = UIColor(rgb: 0xF1EFF5)
           carbsView.backgroundColor = UIColor(rgb: 0xF1EFF5)
        case .fats:
            allView.backgroundColor = UIColor(rgb: 0xF1EFF5)
           proteinView.backgroundColor = UIColor(rgb: 0xF1EFF5)
           fatsView.backgroundColor = UIColor(rgb: 0xFF42A8)
           carbsView.backgroundColor = UIColor(rgb: 0xF1EFF5)
        case .carbs:
            allView.backgroundColor = UIColor(rgb: 0xF1EFF5)
           proteinView.backgroundColor = UIColor(rgb: 0xF1EFF5)
           fatsView.backgroundColor = UIColor(rgb: 0xF1EFF5)
           carbsView.backgroundColor = UIColor(rgb: 0xFF42A8)
        }
    }
    
    private func startSearh() {
        switch searchSource {
        case .all:
            presenter.search(text: searchTextField.text!, id: nil)
        case .protein:
            presenter.search(text: searchTextField.text!, id: presenter.sourceByMeal.first(where: {$0.name == .sourceEntityTypeProteins})?.id)
        case .carbs:
            presenter.search(text: searchTextField.text!, id: presenter.sourceByMeal.first(where: {$0.name == .sourceEntityTypeCarbs})?.id)
        case .fats:
            presenter.search(text: searchTextField.text!, id: presenter.sourceByMeal.first(where: {$0.name == .sourceEntityTypeFats})?.id)
        }
    }
    
    //----------------------------------------------
    // MARK: - IBAction
    //----------------------------------------------
    
    @IBAction func actionClear(_ sender: UIButton) {
        searchTextField.text = ""
        
        isSearch = isShowKeyboard
        
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
    
    @IBAction func addOwnProduct(_ sender: UIButton) {
        EnergyRouter(presenter: navigationController).pushWriteToUs()
    }
    
    @IBAction func textFieldChangeAction(_ sender: UITextField) {
        startSearh()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        
        if textField.text!.count > 0 {
            startSearh()
        }
        
        if textField.text == "" {
            isSearch = false
        }
        
        return false
    }
    
    @IBAction func actionAll(_ sender: UIButton) {
        searchSource = .all
    }
    
    @IBAction func actionProtein(_ sender: UIButton) {
        searchSource = .protein
    }
    
    @IBAction func actionFats(_ sender: UIButton) {
        searchSource = .fats
    }
    
    @IBAction func actionCarbs(_ sender: UIButton) {
        searchSource = .carbs
    }
}

//----------------------------------------------
// MARK: - UITableViewDataSource
//----------------------------------------------

extension FoodController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return isSearch ? 1 : presenter.sections.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearch ? presenter.searchProducts.count : presenter.sections[section]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearch {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.foodIdentifier) as? FoodRecomendedCell else { return    UITableViewCell() }
            cell.delegate = self
            if let model = presenter.searchProducts[safe: indexPath.row] {
                cell.setupCell(model: model, isActive: false)
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.foodIdentifier) as? FoodRecomendedCell else { return    UITableViewCell() }
            cell.delegate = self
            
            if let models = presenter.sections[indexPath.section], let model = models[safe: indexPath.row] {
                cell.setupCell(model: model, isActive: presenter.namesSections[safe: indexPath.section] == RLocalization.food_already_eate())
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if isSearch {
            return nil
        } else {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FoodTopTitleCell") as! FoodTopTitleCell
            headerView.nameLabel.text = presenter.namesSections[safe: section]
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return isSearch ? 16 : 44
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
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
        currentMealType =  MealType.allCases[row]
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
        //addProductView.isHidden = false
        AnalyticsHelper.sendFirebaseEvents(events: .dash_meal_food_search)
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

//----------------------------------------------
// MARK: - FoodOutputProtocol
//----------------------------------------------

extension FoodController: FoodOutputProtocol {
    func success() {
        updateLabels()
        setupProteintsView()
        stackProteinView.isHidden = false
        tableView.isHidden = false
        tableView.reloadData()
    }
    
    func successSeach() {
        isSearch = true
    }
    
    func failure() {
        
    }
}

//----------------------------------------------
// MARK: - FoodRecomendedProtocol
//----------------------------------------------

extension FoodController: FoodRecomendedProtocol {
    func foodRecomendedAdd(cell: FoodRecomendedCell, isUpdate: Bool, model: ProductsMainModel) {
        hideKeyboard()
        EnergyRouter(presenter: navigationController).presentAddProduct(sourceByMeal: presenter.sourceByMeal, isUpdate: isUpdate, model: model, mealId: mealsWidget.meals?.first(where: {$0?.type == currentMealType})??.id ?? "", delegate: self)
    }
}

//----------------------------------------------
// MARK: - FoodAddControllerProtocol
//----------------------------------------------

extension FoodController: FoodAddControllerProtocol {
    func foodAddReload(controller: FoodAddController) {
        isSearch = false
        hideKeyboard()
        delegate?.foodControllerUpdate(controller: self)
        presenter.getProducts(mealTypes: currentMealType, mealId: mealsWidget.meals?.first(where: {$0?.type == currentMealType})??.id ?? "")
    }
}
