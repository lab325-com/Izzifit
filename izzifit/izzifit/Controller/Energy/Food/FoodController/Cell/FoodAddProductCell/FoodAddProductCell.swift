//
//  FoodAddProductCell.swift
//  izzifit
//
//  Created by Andrey S on 23.08.2022.
//

import UIKit

protocol FoodAddProductDelegate: AnyObject {
    func addProduct(cell: FoodAddProductCell)
}

class FoodAddProductCell: UITableViewCell {

    @IBOutlet weak var addProductButton: UIButton!
    
    weak var delegate: FoodAddProductDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addProductButton.layer.borderWidth = 2
        addProductButton.layer.borderColor = UIColor(red: 0.8, green: 0.745, blue: 0.914, alpha: 1).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionAddProduct(_ sender: UIButton) {
        delegate?.addProduct(cell: self)
    }
    
}
