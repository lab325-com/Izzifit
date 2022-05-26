//
//  MenuFoodController.swift
//  izzifit
//
//  Created by Andrey S on 23.02.2022.
//

import UIKit

class MenuFoodController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var presenter = MenuPresenter(view: self)
    private lazy var presenterFood = QuizeFoodPresenter(view: self)
    
    private let cellIdentifier = String(describing: QuizeFoodCell.self)
    private let cellTitleIdentifier = String(describing: MenuFoodTitleCellCell.self)
    private let cellSwitcherIdentifier = String(describing: MenuFoodSwitchCell.self)
    
    private var foodTypes: [FoodGroupModel] = PreferencesManager.sharedManager.foods ?? []
    private var selectedType: FoodGroupModel? = KeychainService.standard.me?.FoodGroup {
        didSet {
            if selectedProducts.count == 0 && selectedType == nil {
                saveButton.alpha = 0.5
            } else {
                saveButton.alpha = 1.0
            }
        }
    }
    private var products: [ProductsMainModel] = []
    private var selectedProducts: Set<ProductsMainModel> = [] {
        didSet {
            if selectedProducts.count == 0 && selectedType == nil {
                saveButton.alpha = 0.5
            } else {
                saveButton.alpha = 1.0
            }
        }
    }
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        hiddenNavigationBar = true
        addTapOnScreen = false
        correctionKeyboard = 24
        super.viewDidLoad()

        setup()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        
        
        if let id = KeychainService.standard.me?.FoodGroup?.id, PreferencesManager.sharedManager.foods != nil {
            presenterFood.getProducts(foodGroupId: id)
        }
        
        presenterFood.getFoods()
        
        
        saveButton.alpha = 0.5
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.register(UINib(nibName: cellTitleIdentifier, bundle: nil), forCellReuseIdentifier: cellTitleIdentifier)
        tableView.register(UINib(nibName: cellSwitcherIdentifier, bundle: nil), forCellReuseIdentifier: cellSwitcherIdentifier)
        
        nameTitleLabel.text = RLocalization.menu_food_preferences()
        saveButton.setTitle(RLocalization.menu_save_changes(), for: .normal)
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 88, right: 0)
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func actionGoNext(_ sender: UIButton) {
        if let id = selectedType?.id {
            presenter.profileUpdate(foodGroupId: id)
        } else if selectedProducts.count > 0 {
            presenterFood.setProducts(productIds: selectedProducts.compactMap({$0.id}))
        }
    }
}



//----------------------------------------------
// MARK: - UITableViewDelegate, UITableViewDataSource
//----------------------------------------------

extension MenuFoodController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodTypes.count + 2 + products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellTitleIdentifier) as? MenuFoodTitleCellCell else { return UITableViewCell() }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            cell.setupCell(title: RLocalization.menu_food_preferences_title1())
            return cell
        case 1..<foodTypes.count + 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as? QuizeFoodCell else { return UITableViewCell() }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            cell.setupCell(model: foodTypes[indexPath.row - 1], selected: selectedType?.id == foodTypes[indexPath.row - 1].id)
            cell.delegate = self
            return cell
        case foodTypes.count + 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellTitleIdentifier) as? MenuFoodTitleCellCell else { return UITableViewCell() }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            cell.setupCell(title: RLocalization.menu_food_preferences_title2())
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellSwitcherIdentifier) as? MenuFoodSwitchCell else { return UITableViewCell() }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            cell.setupCell(model: products[indexPath.row - (foodTypes.count + 2)])
            cell.delegate = self
            return cell
        }
    }
}

//----------------------------------------------
// MARK: - MenuFoodSwitchDelegate
//----------------------------------------------

extension MenuFoodController: MenuFoodSwitchDelegate {
    func menuFoodSwitch(cell: MenuFoodSwitchCell, model: ProductsMainModel) {
        if selectedProducts.contains(model) {
            selectedProducts.remove(model)
        } else {
            selectedProducts.insert(model)
        }
    }
}

//----------------------------------------------
// MARK: - QuizeFoodCellDelegate
//----------------------------------------------

extension MenuFoodController: QuizeFoodCellDelegate {
    func quizeFoodCellSelected(cell: QuizeFoodCell, model: FoodGroupModel) {
        selectedType = model
        guard let id = selectedType?.id else { return }
        presenterFood.getProducts(foodGroupId: id)
        tableView.reloadData()
    }
}

//----------------------------------------------
// MARK: - QuizeFoodOutputProtocol
//----------------------------------------------

extension MenuFoodController: QuizeFoodOutputProtocol {
    func successSetProduct() {
        actionBack()
    }
    
    func successProducts(models: [ProductsMainModel]) {
        selectedProducts.removeAll()
        self.products = models
        tableView.reloadData()
    }
    
    func success(model: FoodGroupsModel) {
        foodTypes = model.foodGroups
        tableView.reloadData()
    }
}

//----------------------------------------------
// MARK: - MenuOutputProtocol
//----------------------------------------------

extension MenuFoodController: MenuOutputProtocol {
    func success() {
        if selectedProducts.count > 0 {
            presenterFood.setProducts(productIds: selectedProducts.compactMap({$0.id}))
        } else {
            actionBack()
        }
    }
    
    func failure() {}
}
