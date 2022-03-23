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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                                  forCellReuseIdentifier: AwardsTableCell.id)
    }
    
    @IBAction func backAction(_ sender: Any) {
      actionBack()
    }
    
}

extension ProfileController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: PositionTableCell.id) as! PositionTableCell
  
        switch indexPath.row {
        case 1:
            let caloriesCell = tableView.dequeueReusableCell(withIdentifier: ChartTableCell.id) as! ChartTableCell
            return caloriesCell
        case 2:
            let moodCell = tableView.dequeueReusableCell(withIdentifier: MoodTableCell.id) as! MoodTableCell
        
            return moodCell
        case 3:
            let weightCell = tableView.dequeueReusableCell(withIdentifier: WeightTableCell.id) as! WeightTableCell
            
            return weightCell
        case 4:
            let awardsCell = tableView.dequeueReusableCell(withIdentifier: AwardsTableCell.id) as! AwardsTableCell
            return awardsCell
        default: return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 4: return 266
        default: return 178
        }
    }
}

extension ProfileController: UITableViewDelegate {}
