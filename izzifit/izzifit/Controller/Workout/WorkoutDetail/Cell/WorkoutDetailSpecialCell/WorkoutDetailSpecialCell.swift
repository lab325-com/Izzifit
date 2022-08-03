//
//  WorkoutDetailSpecialCell.swift
//  izzifit
//
//  Created by Andrey S on 03.08.2022.
//

import UIKit

struct ReviewModel {
    let text: String
    let isFive: Bool
    let name: String
}

class WorkoutDetailSpecialCell: UITableViewCell {

    @IBOutlet weak var specialView: UIView!
    @IBOutlet weak var lastMonthLabel: UILabel!
    @IBOutlet weak var averageWeekLabel: UILabel!
    
    @IBOutlet weak var yogaInstructarLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private let cellIdentifier = String(describing: WorkoutReviewCell.self)
    
    let modelReview = [ReviewModel(text: "asdfasdf asdfasdfasdfasddf", isFive: true, name: "asdfasdfasdf"),
                       ReviewModel(text: "asdfasdf asdfasdfasdfasddf", isFive: true, name: "asdfasdfasdf"),
                       ReviewModel(text: "asdfasdf asdfasdfasdfasddf", isFive: true, name: "asdfasdfasdf"),
                       ReviewModel(text: "asdfasdf asdfasdfasdfasddf", isFive: true, name: "asdfasdfasdf"),
                                          ReviewModel(text: "asdfasdf asdfasdfasdfasddf", isFive: true, name: "asdfasdfasdf"),
                                          ReviewModel(text: "asdfasdf asdfasdfasdfasddf", isFive: true, name: "asdfasdfasdf")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        specialView.clipsToBounds = true
        specialView.layer.cornerRadius = 4
        specialView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: cellIdentifier,
                                           bundle: nil),
                                forCellWithReuseIdentifier: cellIdentifier)
        
        //collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

        collectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell(model: WorkoutByIdMainModel?) {
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0xA3A1AF)]
        
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: "Inter-Bold", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56)]
        
        let attrsItalic1 = [NSAttributedString.Key.font : UIFont(name: "Inter-Italic", size: 14), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0xA3A1AF)]
        
        let attrsItalic2 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 14), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56)]
        
        let attributedString1 = NSMutableAttributedString(string: "Last month\npurchased ", attributes:attrs1 as [NSAttributedString.Key : Any])
        let attributedString2 = NSMutableAttributedString(string:"34 817", attributes:attrs2 as [NSAttributedString.Key : Any])
        
        let attributedString3 = NSMutableAttributedString(string: "Average weekly\nweight loss ", attributes:attrs1 as [NSAttributedString.Key : Any])
        let attributedString4 = NSMutableAttributedString(string:"-2kg", attributes:attrs2 as [NSAttributedString.Key : Any])
        
        attributedString1.append(attributedString2)
        attributedString3.append(attributedString4)
        
        lastMonthLabel.attributedText = attributedString1
        averageWeekLabel.attributedText = attributedString3
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.24
        descriptionLabel.attributedText = NSMutableAttributedString(string: model?.description ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        let attributedString5 = NSMutableAttributedString(string: "It was made by certified yoga\ninstructor ", attributes:attrsItalic1 as [NSAttributedString.Key : Any])
        let attributedString6 = NSMutableAttributedString(string:"Faut", attributes:attrsItalic2 as [NSAttributedString.Key : Any])
        attributedString5.append(attributedString6)
        
        yogaInstructarLabel.attributedText = attributedString5
    }
    
}

//----------------------------------------------
// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
//----------------------------------------------


extension WorkoutDetailSpecialCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelReview.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  cellIdentifier, for: indexPath) as! WorkoutReviewCell
        return cell
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDelegateFlowLayout
//----------------------------------------------

extension WorkoutDetailSpecialCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.size.width - 16 - 24, height: 256)
    }
    
    
}

