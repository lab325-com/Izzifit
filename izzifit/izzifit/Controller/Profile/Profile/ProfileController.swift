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
        profileTableView.backgroundColor = .white
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.separatorStyle = .none
        profileTableView.register(UINib(nibName: "ChartTableCell", bundle: nil),
                                  forCellReuseIdentifier: ChartTableCell.id)
    }
}

extension ProfileController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChartTableCell.id,
                                                 for: indexPath) as! ChartTableCell
        return cell
    }
}

extension ProfileController: UITableViewDelegate {}
