//
//  WorkoutDetailSpecialCell.swift
//  izzifit
//
//  Created by mob325 on 03.08.2022.
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
    
    let modelReview = [ReviewModel(text: "Anyone who feels lost in their weight loss journey needs to try it ASAP. I loved the product and see the changes in a few weeks, doing yoga a few times per week. But keep control on diet and water balance.", isFive: true, name: "Ann, 36 y.o."),
                       ReviewModel(text: "I don't really do it to lose weight as I am thin but more to keep fit as I am 44 but I can promise my body is definitely tighter and firmer and I feel wonderful.", isFive: false, name: "Clara, 44 y.o."),
                       ReviewModel(text: "This is really the first program that has made a difference in my body.", isFive: false, name: "Stella, 27 y.o."),
                       ReviewModel(text: "I like that the workouts are 15 minutes long and you can do as many rounds as you have the time and energy to spare.", isFive: true, name: "Ruby 24 y.o."),
                                          ReviewModel(text: "Like with everything else it takes a little bit time to get used the poses, but If one really listen carefully to the instructions you get a lot of help. It gets better and easier for each time you practice, like everything else new that you learn.", isFive: false, name: "Evelyn 33 y.o.")]
    var pageControll = 0
    
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
        
        collectionView.decelerationRate = .fast
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
        cell.setupCell(model: modelReview[indexPath.row])
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
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageWidth = Float(UIScreen.main.bounds.size.width - 16 - 24)
        let targetXContentOffset = Float(targetContentOffset.pointee.x)
        let contentWidth = Float(collectionView!.contentSize.width  )
        var newPage = Float(pageControll)
        if velocity.x == 0 {
            newPage = floor( (targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0
        } else {
            newPage = Float(velocity.x > 0 ? pageControll + 1 : pageControll - 1)
            if newPage < 0 {
                newPage = 0
            }
            if (newPage > contentWidth / pageWidth) {
                newPage = ceil(contentWidth / pageWidth) - 1.0
            }
        }
        pageControll = Int(newPage)
        let point = CGPoint (x: CGFloat(newPage * pageWidth), y: targetContentOffset.pointee.y)
        targetContentOffset.pointee = point
    }
}

