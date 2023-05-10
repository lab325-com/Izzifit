//
//  DietDetailReviewCell.swift
//  izzifit
//
//  Created by mob325 on 05.08.2022.
//

import UIKit

class DietDetailReviewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cellIdentifier = String(describing: WorkoutReviewCell.self)
    
    let modelReview = [ReviewModel(text: "I have been on a great many diets in my lifetime. I have only been on this diet for four days, so I can’t testify to the weight loss success.", isFive: true, name: "Daizi, 39 y.o."),
                       ReviewModel(text: "I really like how simple and easy this meal plan is to follow and I can get the results that I'm looking for.", isFive: false, name: "Lucy, 24 y.o."),
                       ReviewModel(text: "Love the fact that I can incorporate meals that fit into what I'm used to. Like that, I can access it whenever I'm ready.", isFive: false, name: "Ida, 41 y.o."),
                       ReviewModel(text: "This is EVERYTHING you need. The recipes are easy as heck. Nothing is extravagantly expensive. It doesn’t require you to buy the most expensive cut of meats. You’ll eat fresh whole foods and feel amazing by first week", isFive: true, name: "Jenny, 36.y.o."),
                                          ReviewModel(text: "I’ve tried keto multiple times, but always failed to stick to it, but I really love this meal plan. All dishes are not only healthy but also very tasty.", isFive: false, name: "Ada, 28 y.o.")]
    var pageControll = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
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
    
}


//----------------------------------------------
// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
//----------------------------------------------


extension DietDetailReviewCell: UICollectionViewDelegate, UICollectionViewDataSource {
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

extension DietDetailReviewCell: UICollectionViewDelegateFlowLayout {
    
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
