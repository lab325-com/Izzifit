//
//  SlotTableCell.swift
//  izzifit
//
//  Created by O l e h on 08.04.2022.
//
import UIKit

class SlotTableViewCell: BaseTableViewCell {
    
    static let id = "SlotTableCell"
    
    let slotBtn = UIButton()
    let borderView = UIView()
    var tagBtn = Int()
    
    var slotImgsDict = [1: SlotImgs.dollar,
                        2: SlotImgs.snowflake,
                        3: SlotImgs.moneyBag,
                        4: SlotImgs.hammer,
                        5: SlotImgs.lightning]
    
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
                     topC: 0,
                     bottomC: 0,
                     leadingC: 3,
                     trailingC: 3)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        slotBtn.tag = tagBtn
        slotBtn.setImage(slotImgsDict[tagBtn]!,
                         for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10,
                                                                     left: 8,
                                                                     bottom: 10,
                                                                     right: 8))
    }
    
    func fillCellby(tagBtn: Int) {
        slotBtn.tag = tagBtn
        slotBtn.setImage(slotImgsDict[tagBtn]!,
                         for: .normal)
        borderView.isHidden = true
        slotBtn.clipsToBounds = true
    }
}
