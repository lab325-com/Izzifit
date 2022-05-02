//
//  SlotCollectionCell.swift
//  izzifit
//
//  Created by O l e h on 08.04.2022.
//

import UIKit

class SlotCollectionCell: UICollectionViewCell {
    
    static let id = "SlotCell"
    
    let tableView = UITableView()
    private lazy var contentSizeHeight: CGFloat = {
        CGFloat((h / 12.78) * 2801)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        tableView.register(SlotTableViewCell.self,
                           forCellReuseIdentifier: SlotTableViewCell.id)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
     
        tableView.estimatedRowHeight = 0
        tableView.isScrollEnabled = false
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        
        // TO DO:  Возможно здесь придется считать пропорционально размеру экрана
        tableView.contentSize = CGSize(width: 61.3,
                                       height: contentSizeHeight)
        print(contentSizeHeight)
    
        DispatchQueue.main.async {
            self.tableView.scrollToRow(at: [0,2798],
                                  at: .middle,
                                  animated: true)
        }
     
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
        
        return SpinLogicManager.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SlotTableViewCell.id,
                                                 for: indexPath) as! SlotTableViewCell
        cell.fillCellby(tagBtn: SpinLogicManager.array[indexPath.row])
        cell.tag = SpinLogicManager.array[indexPath.row]
        cell.tagBtn = SpinLogicManager.array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.sizeHeight / 2.9
    }
}



