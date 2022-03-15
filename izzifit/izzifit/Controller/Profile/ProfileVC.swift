//
//  ProfileVC.swift
//  izzifit
//
//  Created by Oleh Study on 15.03.2022.
//

import UIKit

class ProfileVC: UIViewController {
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.white.cgColor
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ProfileTableCell.self, forCellReuseIdentifier: ProfileTableCell.id)
        
        view.ui.genericlLayout(object: tableView,
                               parentView: view,
                               topC: view.hRatio(cH: 152),
                               bottomC: 0,
                               leadingC: 0,
                               trailingC: 0)
    }
}

extension ProfileVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableCell.id,
                                                 for: indexPath) as! ProfileTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        168
    }
}

extension ProfileVC: UITableViewDelegate {}
