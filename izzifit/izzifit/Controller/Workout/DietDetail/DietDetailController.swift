//
//  DietDetailController.swift
//  izzifit
//
//  Created by Andrey S on 05.08.2022.
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
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let cellIdentifier = String(describing: WorkoutDetailHeaderCell.self)
    private let cellSpecialIdentifier = String(describing: DietDetailCell.self)
    private let cellReviewIdentifier = String(describing: DietDetailReviewCell.self)
    
    private let sectionTitleIdentifier = String(describing: DietSectionCell.self)
    
    private lazy var presenterSubscribe = SubscribePresenter(view: self)
    
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
        tableView.isHidden = true
        
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.register(UINib(nibName: cellSpecialIdentifier, bundle: nil), forCellReuseIdentifier: cellSpecialIdentifier)
        tableView.register(UINib(nibName: cellReviewIdentifier, bundle: nil), forCellReuseIdentifier: cellReviewIdentifier)
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        tableView.register(UINib(nibName: sectionTitleIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: sectionTitleIdentifier)
    }
}

//----------------------------------------------
// MARK: - UITableViewDelegate, UITableViewDataSource
//----------------------------------------------

extension DietDetailController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        case 2:
            return 1
        default: return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as? WorkoutDetailHeaderCell else { return UITableViewCell() }
                cell.delegate = self
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellSpecialIdentifier) as? DietDetailCell else { return UITableViewCell() }
                return cell
            default:
                return UITableViewCell()
            }
        case 1:
            return UITableViewCell()
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellReviewIdentifier) as? DietDetailReviewCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DietSectionCell") as! DietSectionCell
            return headerView
        } else {
           return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0.1 : 33
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
        actionBack()
    }
}

//----------------------------------------------
// MARK: - WorkoutDetailOutputProtocol
//----------------------------------------------

extension DietDetailController: WorkoutDetailOutputProtocol {
    func success() {
        if KeychainService.standard.me?.Subscription != nil {
            priceContinueView.isHidden = true
        } else {
//            if presenter.workout?.isAvailable == true {
//                startWorkoutButton.setTitle(RLocalization.workout_detail_start(), for: .normal)
//                priceContinueView.isHidden = true
//            } else {
                activityIndicator.stopAnimating()
                priceLabel.text = "Start by \(presenterSubscribe.paymentsInfo.first?.currencySymbol ?? "$")\(String(format: "%.2f", presenterSubscribe.paymentsInfo.first?.price ?? 1.99))"
                
                
                let price = floor((presenterSubscribe.paymentsInfo.first?.price ?? 1.99) * 10)
                let fraction = (presenterSubscribe.paymentsInfo.first?.price ?? 1.99).truncatingRemainder(dividingBy: 1)

                discountLabel.text = "\(presenterSubscribe.paymentsInfo.first?.currencySymbol ?? "$")\(String(format: "%.2f", price + fraction))"
                
                priceLabel.isHidden = false
                discountLabel.isHidden = false
                separatorDiscount.isHidden = false
          //  }
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
        if KeychainService.standard.me?.Subscription != nil {
            priceContinueView.isHidden = true
        } else {
//            if presenter.workout?.isAvailable == true {
//                startWorkoutButton.setTitle(RLocalization.workout_detail_start(), for: .normal)
//                priceContinueView.isHidden = true
//            } else {
                activityIndicator.stopAnimating()
                priceLabel.text = "Start by \(presenterSubscribe.paymentsInfo.first?.currencySymbol ?? "$")\(String(format: "%.2f", presenterSubscribe.paymentsInfo.first?.price ?? 1.99))"
                
                
                let price = floor((presenterSubscribe.paymentsInfo.first?.price ?? 1.99) * 10)
                let fraction = (presenterSubscribe.paymentsInfo.first?.price ?? 1.99).truncatingRemainder(dividingBy: 1)

                discountLabel.text = "\(presenterSubscribe.paymentsInfo.first?.currencySymbol ?? "$")\(String(format: "%.2f", price + fraction))"
                
                priceLabel.isHidden = false
                discountLabel.isHidden = false
                separatorDiscount.isHidden = false
          //  }
        }
        
        
        tableView.isHidden = false
        tableView.reloadData()
    }
    
    func failure(error: String) {
        
    }
}
