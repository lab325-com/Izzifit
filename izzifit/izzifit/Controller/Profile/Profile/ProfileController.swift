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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PositionTableCell.id,
                                                 for: indexPath) as! PositionTableCell
        
        let caloriesCell = tableView.dequeueReusableCell(withIdentifier: ChartTableCell.id,
                                                         for: indexPath) as! ChartTableCell
        
        let weightCell = tableView.dequeueReusableCell(withIdentifier: WeightTableCell.id,                                               for: indexPath) as! WeightTableCell
        
        switch indexPath.row {
        case 0: return cell
        case 1: return caloriesCell
        case 2: return caloriesCell
        case 3: return weightCell
        case 4: return caloriesCell
        default: break
        }
        return cell
    }
}

extension ProfileController: UITableViewDelegate {}
