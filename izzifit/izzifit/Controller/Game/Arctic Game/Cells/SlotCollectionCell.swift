//
//  SlotCollectionCell.swift
//  izzifit
//
//  Created by O l e h on 08.04.2022.
//

import UIKit

class SlotCollectionCell: UICollectionViewCell {
    
    static let id = "SlotCell"
    var array: [Int] = {
        var array = [Int]()
        for i in 0...4 {
            array.append(i)
        }
        array.shuffle()
        return array
    }()
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        tableView.register(SlotTableCell.self,
                           forCellReuseIdentifier: SlotTableCell.id)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        self.addSubview(tableView)
        
        ui.layout(tableView: tableView,
                  view: self,
                  topC: 0,
                  bottomC: 0,
                  leadingC: 0,
                  trailingC: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SlotCollectionCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SlotTableCell.id,
                                                 for: indexPath) as! SlotTableCell
        cell.fillCellby(tagBtn: array[indexPath.row])
        cell.tag = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  tableView.bounds.size.height / 2.9
    }
}

