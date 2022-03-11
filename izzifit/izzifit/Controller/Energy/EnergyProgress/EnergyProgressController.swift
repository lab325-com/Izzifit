//
//  EnergyProgressController.swift
//  izzifit
//
//  Created by Andrey S on 11.03.2022.
//

import UIKit

class EnergyProgressController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var progressTitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let cellIdentifier = String(describing: ProgressCell.self)
    private let calendarManager = CalendarManager()
    private var currentDay = Date()
    
    private var currentMonthDay = 0
    private var currentFirstWeekDay = 0
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        hiddenNavigationBar = true
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        currentMonthDay = calendarManager.daysInMonth(date: currentDay)
        
        let firstDayImMonth = calendarManager.startOfMonth(date: currentDay)
        currentFirstWeekDay = calendarManager.weekDay(date: firstDayImMonth)
        
        collectionView.register(UINib.init(nibName: cellIdentifier,
                                           bundle: nil),
                                forCellWithReuseIdentifier: cellIdentifier)
    }
    
    //----------------------------------------------
    // MARK: - IBAction
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
//----------------------------------------------


extension EnergyProgressController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentMonthDay + currentFirstWeekDay
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  cellIdentifier, for: indexPath) as! ProgressCell
        cell.setupCell(progress: 70)
        return cell
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDelegateFlowLayout
//----------------------------------------------

extension EnergyProgressController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (UIScreen.main.bounds.size.width - 48 - 60) / 7
        return CGSize(width: height , height: height)
    }
}
