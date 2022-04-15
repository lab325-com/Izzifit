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
    @IBOutlet weak var monthDateLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var addActivityButton: UIButton!
    
    @IBOutlet weak var sunLabel: UILabel!
    @IBOutlet weak var monLabel: UILabel!
    @IBOutlet weak var tueLabel: UILabel!
    @IBOutlet weak var wedLabel: UILabel!
    @IBOutlet weak var thuLabel: UILabel!
    @IBOutlet weak var friLabel: UILabel!
    @IBOutlet weak var satLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let cellIdentifier = String(describing: ProgressCell.self)
    private let calendarManager = CalendarManager()
    private var currentDay = Date() {
        didSet {
            if Calendar.current.isDateInToday(currentDay) {
                nextButton.setImage(RImage.progress_forward_ic(), for: .normal)
            } else {
                nextButton.setImage(RImage.arrow_right_ic(), for: .normal) 
            }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "LLLL yyyy"
            dateFormatter.locale =  Locale(identifier: "en_US_POSIX")
            monthDateLabel.text = dateFormatter.string(from: currentDay)
        }
    }
    
    private var currentMonthDay = 0
    private var currentFirstWeekDay = 0
    private var todayNumberDays = 0
    
    
    private lazy var presenter = EnergyProgressesPresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        hiddenNavigationBar = true
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        progressTitleLabel.text = RLocalization.progress_title()
        addActivityButton.setTitle(RLocalization.progress_activity(), for: .normal)
        
        sunLabel.text = RLocalization.progress_sun()
        monLabel.text = RLocalization.progress_mon()
        tueLabel.text = RLocalization.progress_tue()
        wedLabel.text = RLocalization.progress_wed()
        thuLabel.text = RLocalization.progress_thu()
        friLabel.text = RLocalization.progress_fri()
        satLabel.text = RLocalization.progress_sat()
        
        addActivityButton.layer.borderWidth = 2
        addActivityButton.layer.borderColor = UIColor(red: 0.799, green: 0.745, blue: 0.913, alpha: 1).cgColor
        
        collectionView.register(UINib.init(nibName: cellIdentifier,
                                           bundle: nil),
                                forCellWithReuseIdentifier: cellIdentifier)
        
        changeDate(date: Date())
    }
    
    private func changeDate(date: Date) {
        currentDay = date
        presenter.getProgresses(dateOne: calendarManager.startOfMonth(date: currentDay), dateTwo: calendarManager.endOfMonth(date: currentDay))
        currentMonthDay = calendarManager.daysInMonth(date: currentDay)
        
        let firstDayImMonth = calendarManager.startOfMonth(date: currentDay)
        currentFirstWeekDay = calendarManager.weekDay(date: firstDayImMonth) - 1
        
        if currentFirstWeekDay == -1 {
            currentFirstWeekDay = 0
        }
        
        todayNumberDays = calendarManager.dayOfMonth(date: currentDay)
        collectionView.reloadData()
    }
    
    //----------------------------------------------
    // MARK: - IBAction
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func actionPreviusDate(_ sender: UIButton) {
        changeDate(date: calendarManager.minusMonth(date: currentDay))
    }
    
    @IBAction func actionNextButton(_ sender: UIButton) {
        if !currentDay.isInThisMonth {
            changeDate(date: calendarManager.plusMonth(date: currentDay))
        }
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
        if currentFirstWeekDay <= 0 {
            cell.setupCell(progress: 0, isHidden: false, day: indexPath.row - currentFirstWeekDay + 1)
        } else {
            if currentDay.isInThisMonth {
                if indexPath.row >= todayNumberDays + currentFirstWeekDay {
                    cell.setupCell(progress: 0, isHidden: Array(0..<currentFirstWeekDay).contains(indexPath.row), day: indexPath.row - currentFirstWeekDay + 1)
                } else {
                    let indexDay = indexPath.row - currentFirstWeekDay + 1
                    cell.setupCell(progress: CGFloat(presenter.progersses.first(where: {$0.date == indexDay})?.progress ?? 0), isHidden: Array(0..<currentFirstWeekDay).contains(indexPath.row), day: indexPath.row - currentFirstWeekDay + 1, isToday: indexPath.row == todayNumberDays + currentFirstWeekDay - 1)
                }
            } else {
                cell.setupCell(progress: 0, isHidden: Array(0..<currentFirstWeekDay).contains(indexPath.row), day: indexPath.row - currentFirstWeekDay + 1)
            }
        }
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

//----------------------------------------------
// MARK: - EnergyProgressesOutputProtocol
//----------------------------------------------

extension EnergyProgressController: EnergyProgressesOutputProtocol {
    func success() {
        collectionView.reloadData()
    }
    
    func failure() {
        
    }
}
