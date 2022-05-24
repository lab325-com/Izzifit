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
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var coinsLabel: UILabel!
    @IBOutlet weak var energyLabel: UILabel!
    @IBOutlet weak var profileLbl: UILabel!
    @IBOutlet weak var profileTableView: UITableView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    private lazy var presenter = ProfilePresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        AnalyticsHelper.sendFirebaseEvents(events: .profile_open)
        profileLbl.text = RLocalization.profile()
        coinsLabel.text = "\(KeychainService.standard.me?.coins ?? 0)"
        energyLabel.text = "\(Int(KeychainService.standard.me?.energy ?? 0))"
        
        if let name = KeychainService.standard.me?.name {
            nameLabel.text = name
        } else {
            nameLabel.isHidden = true
        }
        avatarImageView.kf.setImage(with: URL(string: KeychainService.standard.me?.Avatar?.url ?? ""),
                                    placeholder: RImage.placeholder_food_ic(),
                                    options: [.transition(.fade(0.25))])
        
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
    
    //----------------------------------------------
    // MARK: - IBActions
    //----------------------------------------------
    @IBAction func backAction(_ sender: Any) {
        actionBack()
    }
}


//----------------------------------------------
// MARK: - UITableViewDelegate, UITableViewDataSource
//----------------------------------------------
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
            if let weightWidgetModel = presenter.weightsWidget {
                weightCell.fillCellBy(weightWidgetModel)
            }
            return weightCell
        default:
            let awardsCell = tableView.dequeueReusableCell(withIdentifier: PolicyCell.id) as! PolicyCell
            awardsCell.delegate = self
            return awardsCell
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

extension ProfileController: PolicyCellDelegate {
    func policyCellPolicy(cell: PolicyCell) {
        AnalyticsHelper.sendFirebaseEvents(events: .other_legal_open, params: ["open": "privacy", "screen": "profile"])
        guard let url = URL(string: "https://mob325.com/izzifit/privacy_policy.html") else { return }
        UIApplication.shared.open(url)
    }
    
    func policyCellTerms(cell: PolicyCell) {
        AnalyticsHelper.sendFirebaseEvents(events: .other_legal_open, params: ["open": "terms", "screen": "profile"])
        guard let url = URL(string: "https://mob325.com/izzifit/terms_and_conditions.html") else { return }
        UIApplication.shared.open(url)
    }
    
    func policyCellWriteToUs(cell: PolicyCell) {
        MenuRouter(presenter: navigationController).pushMenuQuiestion()
    }
}
