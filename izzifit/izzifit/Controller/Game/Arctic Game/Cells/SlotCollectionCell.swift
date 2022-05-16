//
//  SlotCollectionCell.swift
//  izzifit
//
//  Created by O l e h on 08.04.2022.
//

import UIKit

class SlotCollectionCell: UICollectionViewCell {
    
    static let id = "SlotCell"
    
    var section = Int()
    
    let tableView = UITableView()
    
    private var model: MapModel?
    
    private lazy var contentSizeHeight: CGFloat = {
        CGFloat((h / 12.78) * 9001)
    }()
    private lazy var arrays: [[Int]] = {
        [OffsetCounter.firstArray,
         OffsetCounter.secondArray,
         OffsetCounter.thirdArray]
    }()
    
    lazy var rowHeight: CGFloat = {
        print(tableView.sizeHeight)
        print(tableView.sizeHeight / 2.9)
        return tableView.sizeHeight / 2.9
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
        print(h)
        print(contentSizeHeight)
    
        DispatchQueue.main.async {
            self.tableView.scrollToRow(at: [0,8998],
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
    
    func setupCell(model: MapModel?) {
        if self.model == nil {
            self.model = model
            tableView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SlotCollectionCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 9001
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SlotTableViewCell.id,
                                                 for: indexPath) as! SlotTableViewCell
        cell.fillCellby(tagBtn: arrays[section][indexPath.row], model: model)
        cell.tag = arrays[section][indexPath.row]
        cell.tagBtn = arrays[section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.sizeHeight / 2.9
    }
}



