//
//  ProfileController.swift
//  izzifit
//
//  Created by Oleh Study on 16.03.2022.
//

import UIKit

class ProfileController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    @IBOutlet weak var profileLbl: UILabel! {
        didSet {
            profileLbl.text = RLocalization.profile()
        }
    }
    
    @IBOutlet weak var profileTableView: UITableView!
    private lazy var presenter = ProfilePresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        profileTableView.isHidden = true
        
        let dateFormmater = DateFormatter()
        dateFormmater.locale = Locale(identifier: "en_US_POSIX")
        dateFormmater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let today = dateFormmater.string(from: Date())
        let calendat = Calendar.current
        let sixDayAgo = calendat.date(byAdding: .day, value: -6, to: Date())
        let sixDayAgoString = dateFormmater.string(from: sixDayAgo!)
        presenter.getRankTypes(from: sixDayAgoString, to: today)
        hiddenNavigationBar = true
        profileTableView.backgroundColor = .white
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.separatorStyle = .none
        profileTableView.register(UINib(nibName: "ChartTableCell", bundle: nil),
                                  forCellReuseIdentifier: ChartTableCell.id)
        profileTableView.register(UINib(nibName: "PositionTableCell", bundle: nil),
                                  forCellReuseIdentifier: PositionTableCell.id)
        profileTableView.register(UINib(nibName: "WeightTableCell", bundle: nil),
                                  forCellReuseIdentifier: WeightTableCell.id)
        profileTableView.register(UINib(nibName: "MoodTableCell", bundle: nil),
                                  forCellReuseIdentifier: MoodTableCell.id)
        profileTableView.register(UINib(nibName: "AwardsTableCell", bundle: nil),
                                  forCellReuseIdentifier: PolicyCell.id)
    }
    
    @IBAction func backAction(_ sender: Any) {
        actionBack()
    }
}

extension ProfileController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let caloriesCell = tableView.dequeueReusableCell(withIdentifier: ChartTableCell.id) as! ChartTableCell
            if let model = presenter.caloriesWidget?.caloriesWidget {
                caloriesCell.fillCellBy(model)
            }
            return caloriesCell
        case 1:
            let moodCell = tableView.dequeueReusableCell(withIdentifier: MoodTableCell.id) as! MoodTableCell
            if let moodModels = presenter.moods {
                moodCell.fillCellby(moodModels)
            }
            return moodCell
        case 2:
            let weightCell = tableView.dequeueReusableCell(withIdentifier: WeightTableCell.id) as! WeightTableCell
            return weightCell
        default:
            let awardsCell = tableView.dequeueReusableCell(withIdentifier: PolicyCell.id) as! PolicyCell
            return awardsCell
            //            let cell = tableView.dequeueReusableCell(withIdentifier: PositionTableCell.id) as! PositionTableCell
            //            if let model = presenter.rank {
            //                cell.fillCell(by: model)
            //            }
            //            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 3: return 50
        default: return 178
        }
    }
}

extension ProfileController: UITableViewDelegate {}

extension ProfileController: ProfileOutputProtocol {
    func success() {
        profileTableView.isHidden = false
        profileTableView.reloadData()
    }
    func failure() {
    }
}
