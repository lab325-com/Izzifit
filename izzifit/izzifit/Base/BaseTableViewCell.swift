//
//  BaseTableViewCell.swift
//  izzifit
//
//  Created by mob325 on 27.04.2022.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addActionSound()
    }
    
    private func addActionSound(){
        for view in self.contentView.subviews as [UIView] {
            if let btn = view as? UIButton {
                btn.addTarget(self, action: #selector(playTapInButton), for: .touchUpInside)
            }
            
            for viewTwo in view.subviews as [UIView] {
                if let btn = viewTwo as? UIButton {
                    btn.addTarget(self, action: #selector(playTapInButton), for: .touchUpInside)
                }
            }
        }
    }
    
    @objc func playTapInButton() {
        AudioManager.sharedManager.playSound()
    }
}
