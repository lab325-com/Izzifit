//
//  SlotTableCell.swift
//  izzifit
//
//  Created by O l e h on 08.04.2022.
//
import UIKit
import Kingfisher

class SlotTableViewCell: BaseTableViewCell {
    
    static let id = "SlotTableCell"
    
    let slotBtn = UIButton()
    let borderView = UIView()
    var tagBtn = Int()

    override init(style: BaseTableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        
        slotBtn.isUserInteractionEnabled = false
        borderView.layer.cornerRadius = 5
        borderView.layer.masksToBounds = true
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = UIColor.blue.cgColor
        
        ui.layout(vw: borderView,
                  view: contentView,
                  topC: 0,
                  bottomC: 0,
                  leadingC: 0,
                  trailingC: 0)
        
        ui.setButton(button: slotBtn,
                     view: contentView,
                     controlState: .normal)
     
        ui.btnLayout(button: slotBtn,
                     view: contentView,
                     width: (UIScreen.main.bounds.size.height / 12.799) * 0.83,
                     height:  (UIScreen.main.bounds.size.height / 12.799) * 0.83,
                     centerV: 0,
                     centerH: 0)
                    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func fillCellby(tagBtn: Int) {
        slotBtn.tag = tagBtn
   
            if let urls = GameNetworkLayer.shared.slotURLs {
            slotBtn.kf.setImage(with: urls[tagBtn - 1], for: .normal)
        }
        
        borderView.isHidden =   true
        slotBtn.clipsToBounds = true
    }
}

enum Games {
    case arctic, england, france
}
