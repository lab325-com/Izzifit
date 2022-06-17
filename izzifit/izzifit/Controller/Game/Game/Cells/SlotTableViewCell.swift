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
    
    var slotImgsDict = [1: SlotImgs.dollar,
                        2: SlotImgs.moneyBag,
                        3: SlotImgs.lightning,
                        4: SlotImgs.snowflake,
                        5: SlotImgs.hammer]
    
    var englandImgsDict = [1: UK_SlotImgs.pound,
                           2: UK_SlotImgs.moneyBag,
                           3: UK_SlotImgs.lightning,
                           4: UK_SlotImgs.flag,
                           5: UK_SlotImgs.hammer]
    
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
        
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10,
//                                                                     left: 8,
//                                                                     bottom: 10,
//                                                                     right: 8))
    }
    
    func fillCellby(tagBtn: Int, model: MapModel?,game: Games) {
        slotBtn.tag = tagBtn
        switch game {
        case .arctic:
            let image = model?.map.spinObjects.first(where: {$0.id == "\(tagBtn)"})?.image.urlIosFull
            
            //slotBtn.kf.setImage(with: URL(string: image ?? ""), for: .normal)
            slotBtn.kf.setImage(with: URL(string: image ?? ""), for: .normal,
                                placeholder: slotImgsDict[tagBtn]!,
                                options: [.transition(.fade(0.25))])
        case .england:
            slotBtn.setImage(englandImgsDict[tagBtn] ?? UIImage(), for: .normal)
        }
        
        borderView.isHidden = true
        slotBtn.clipsToBounds = true
    }
}

enum Games {
    case arctic, england
}
