//
//  DietSectionCell.swift
//  izzifit
//
//  Created by Andrey S on 05.08.2022.
//

import UIKit

protocol DietSectionDelegate: AnyObject {
    func dietSectionSelect(cell: DietSectionCell, day: Int)
}

class DietSectionCell: UITableViewHeaderFooterView {

    @IBOutlet weak var cornerView: UIView!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    
    weak var delegate: DietSectionDelegate?
    
    private var day: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        cornerView.clipsToBounds = true
        cornerView.layer.cornerRadius = 10
        cornerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
    }
    
    func setupCell(day: Int, isOpen: Bool) {
        self.day = day
        dayLabel.text = "Day \(day)"
        
        UIView.animate(withDuration: 0.3) {
            if !isOpen {
                self.arrowImage.transform = self.arrowImage.transform.rotated(by: .pi)
                self.contentView.layoutIfNeeded()
            } else {
                self.arrowImage.transform = self.arrowImage.transform.rotated(by: 0)
                self.contentView.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func actionSelectSection(_ sender: UIButton) {
        guard let day = day else {
            return
        }
        delegate?.dietSectionSelect(cell: self, day: day)
    }
}
