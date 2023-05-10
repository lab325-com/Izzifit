//
//  DietDetailController.swift
//  izzifit
//
//  Created by mob325 on 05.08.2022.
//

import UIKit

class DietDetailController: BaseController {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var priceContinueView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var separatorDiscount: UIView!
    @IBOutlet weak var discountLabel: UILabel!
    
    @IBOutlet weak var startWorkoutButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let cellIdentifier = String(describing: WorkoutDetailHeaderCell.self)
    private let cellSpecialIdentifier = String(describing: DietDetailCell.self)
    private let cellReviewIdentifier = String(describing: DietDetailReviewCell.self)
    private let cellDietMealIdentifier = String(describing: DietMealCell.self)
    
    
    private let sectionTitleIdentifier = String(describing: DietSectionCell.self)
    
    private lazy var presenterSubscribe = SubscribePresenter(view: self)
    private lazy var presenter = DietDetailPresenter(view: self)
    
    private let id: String
    private let idSpecialId: String
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(id: String, idSpecialId: String) {
        self.id = id
        self.idSpecialId = idSpecialId
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setup() {
        presenterSubscribe.retriveNotAutoProduct(id: [idSpecialId])
        presenter.getDiet(id: id)
        tableView.isHidden = true
        
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.register(UINib(nibName: cellSpecialIdentifier, bundle: nil), forCellReuseIdentifier: cellSpecialIdentifier)
        tableView.register(UINib(nibName: cellReviewIdentifier, bundle: nil), forCellReuseIdentifier: cellReviewIdentifier)
        tableView.register(UINib(nibName: cellDietMealIdentifier, bundle: nil), forCellReuseIdentifier: cellDietMealIdentifier)
        
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        tableView.register(UINib(nibName: sectionTitleIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: sectionTitleIdentifier)
    }
    
    
    @IBAction func actionStartWorkout(_ sender: UIButton) {
        if presenter.diet?.isAvailable != true, KeychainService.standard.me?.Subscription == nil  {
            AnalyticsHelper.sendFirebaseEvents(events: .pay_paid_diet_tap, params: ["id": idSpecialId])
            presenterSubscribe.purchaseProduct(id: idSpecialId, screen: .dietPlan, place: .dashboard) { [weak self] result, error in
                guard let `self` = self else { return }
                if result {
                    self.priceContinueView.isHidden = true
                    self.startWorkoutButton.isHidden = true
                    self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    self.presenter.getDiet(id: self.id)
                }
            }
        }
    }
}

//----------------------------------------------
// MARK: - UITableViewDelegate, UITableViewDataSource
//----------------------------------------------

extension DietDetailController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 + ((KeychainService.standard.me?.Subscription != nil || presenter.diet?.isAvailable == true) ? presenter.diet?.schedule.count ?? 0 : 1)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1 + ((KeychainService.standard.me?.Subscription != nil || presenter.diet?.isAvailable == true) ? presenter.diet?.schedule.count ?? 0 : 1):
            return 1
        default:
            return presenter.openDay == section ?  presenter.diet?.schedule.first(where: {$0.day == section})?.meals.count ?? 0 : 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as? WorkoutDetailHeaderCell else { return UITableViewCell() }
                cell.delegate = self
                cell.setupCell(model: presenter.diet)
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellSpecialIdentifier) as? DietDetailCell else { return UITableViewCell() }
                cell.setupCell(model: presenter.diet)
                return cell
            default:
                return UITableViewCell()
            }
        case 1 + ((KeychainService.standard.me?.Subscription != nil || presenter.diet?.isAvailable == true) ? presenter.diet?.schedule.count ?? 0 : 1):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellReviewIdentifier) as? DietDetailReviewCell else { return UITableViewCell() }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellDietMealIdentifier) as? DietMealCell else { return UITableViewCell() }
            let showGradient = (KeychainService.standard.me?.Subscription != nil || presenter.diet?.isAvailable == true) ? false : true
            let schedule = presenter.diet?.schedule.first(where: {$0.day == indexPath.section})
            let isGradient = showGradient ? indexPath.row == (schedule?.meals.count ?? 0) - 1 : false
            cell.setupCell(isShowGradient: isGradient, scheduleMeals: schedule?.meals[safe: indexPath.row], isHiddenSeparator: indexPath.row == (schedule?.meals.count ?? 0) - 1)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 || section == 1 + ((KeychainService.standard.me?.Subscription != nil || presenter.diet?.isAvailable == true) ? presenter.diet?.schedule.count ?? 0 : 1) {
            return nil
        } else {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DietSectionCell") as! DietSectionCell
            headerView.delegate = self
            headerView.setupCell(day: section, isOpen: section == presenter.openDay)
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 || section == 1 + ((KeychainService.standard.me?.Subscription != nil || presenter.diet?.isAvailable == true) ? presenter.diet?.schedule.count ?? 0 : 1) ? 0.1 : 41
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}

//----------------------------------------------
// MARK: - WorkoutDetailHeaderProtocol
//----------------------------------------------

extension DietDetailController: WorkoutDetailHeaderProtocol {
    func workoutDetailHeaderBack(cell: WorkoutDetailHeaderCell) {
        AnalyticsHelper.sendFirebaseEvents(events: .pay_paid_diet_close, params: ["id": idSpecialId])
        actionBack()
    }
}

//----------------------------------------------
// MARK: - DietDetailOutputProtocol
//----------------------------------------------

extension DietDetailController: DietDetailOutputProtocol {
    func success() {
        if KeychainService.standard.me?.Subscription != nil {
            priceContinueView.isHidden = true
            startWorkoutButton.isHidden = true
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            if presenter.diet?.isAvailable == true {
                startWorkoutButton.isHidden = true
                priceContinueView.isHidden = true
                tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            } else {
                activityIndicator.stopAnimating()
                priceLabel.text = "Start by \(presenterSubscribe.paymentsInfo.first?.currencySymbol ?? "$")\(String(format: "%.2f", presenterSubscribe.paymentsInfo.first?.price ?? 1.99))"
                
                
                let price = floor((presenterSubscribe.paymentsInfo.first?.price ?? 1.99) * 10)
                let fraction = (presenterSubscribe.paymentsInfo.first?.price ?? 1.99).truncatingRemainder(dividingBy: 1)

                discountLabel.text = "\(presenterSubscribe.paymentsInfo.first?.currencySymbol ?? "$")\(String(format: "%.2f", price + fraction))"
                
                priceLabel.isHidden = false
                discountLabel.isHidden = false
                separatorDiscount.isHidden = false
            }
        }
        
        
        tableView.isHidden = false
        tableView.reloadData()
    }
    
    func failure() {
       actionBack()
    }
}

//----------------------------------------------
// MARK: - SubscribeOutputProtocol
//----------------------------------------------

extension DietDetailController: SubscribeOutputProtocol {
    func successRetrive() {
       
    }
    
    func failure(error: String) {
        
    }
}

//----------------------------------------------
// MARK: - DietSectionDelegate
//----------------------------------------------

extension DietDetailController: DietSectionDelegate {
    func dietSectionSelect(cell: DietSectionCell, day: Int) {
        if presenter.openDay == day {
            presenter.openDay = nil
        } else {
            presenter.openDay = day
        }
        
        let indexSet = IndexSet(integersIn: 1..<1 + ((KeychainService.standard.me?.Subscription != nil || presenter.diet?.isAvailable == true) ? presenter.diet?.schedule.count ?? 0 : 1))
        
        tableView.reloadSections(indexSet, with: .automatic)
    }
}
