//
//  VideoFinishedController.swift
//  izzifit
//
//  Created by Andrey S on 18.04.2022.
//

import UIKit

class VideoFinishedController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var moreView: UIView!
    @IBOutlet weak var excellentView: UIView!
    @IBOutlet weak var hardView: UIView!
    
    @IBOutlet weak var totalEnergyLabel: UILabel!
    @IBOutlet weak var caloriesCountLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var energyCountLabel: UILabel!
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var caorriesLabel: UILabel!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainEnergyLabel: UILabel!
    @IBOutlet weak var howFeelingLabel: UILabel!
    @IBOutlet weak var canMoreLabel: UILabel!
    @IBOutlet weak var excellentLabel: UILabel!
    @IBOutlet weak var hardLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var preseneter = VideoPlayerPresenter(view: self)
    private let attemptId: String
    private let workout: WorkoutByIdMainModel
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(attemptId: String, workout: WorkoutByIdMainModel) {
        self.workout = workout
        self.attemptId = attemptId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        hiddenNavigationBar = true
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        mainLabel.text = RLocalization.payer_finished_title()
        subtitleLabel.text = RLocalization.payer_finished_subTitle()
        caorriesLabel.text = RLocalization.payer_finished_calories()
        mainTitleLabel.text = RLocalization.payer_finished_time()
        mainEnergyLabel.text = RLocalization.payer_finished_energy()
        howFeelingLabel.text = RLocalization.payer_finished_feeling()
        canMoreLabel.text = RLocalization.payer_finished_cand_do_more()
        excellentLabel.text = RLocalization.payer_finished_excellent()
        hardLabel.text = RLocalization.payer_finished_hard()
        
        totalEnergyLabel.text = "\(workout.energyTotal ?? 0)/\(workout.energyTotal ?? 0)"
        caloriesCountLabel.text = "\(workout.kCal ?? 0)"
        timeLabel.text = "\(workout.duration?.time ?? "") min"
        energyCountLabel.text = "\(workout.energyTotal ?? 0)"
        
        moreView.layer.borderWidth = 2
        moreView.layer.borderColor = UIColor(red: 0.799, green: 0.745, blue: 0.913, alpha: 1).cgColor

        excellentView.layer.borderWidth = 2
        excellentView.layer.borderColor = UIColor(red: 0.799, green: 0.745, blue: 0.913, alpha: 1).cgColor
        
        hardView.layer.borderWidth = 2
        hardView.layer.borderColor = UIColor(red: 0.799, green: 0.745, blue: 0.913, alpha: 1).cgColor
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
           self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
    }
    
    @IBAction func actionCanDoMore(_ sender: UIButton) {
        preseneter.updateEnd(of: .workoutAttemptFeedbackTypeCanDoMore, attemptId: attemptId)
    }
    
    @IBAction func actionExcelent(_ sender: UIButton) {
        preseneter.updateEnd(of: .workoutAttemptFeedbackTypeExcellent, attemptId: attemptId)
    }
    
    @IBAction func actionHard(_ sender: UIButton) {
        preseneter.updateEnd(of: .workoutAttemptFeedbackTypeHard, attemptId: attemptId)
    }
}

//----------------------------------------------
// MARK: - VideoPlayerOutputProtocol
//----------------------------------------------

extension VideoFinishedController: VideoPlayerOutputProtocol {
    func successUpdate() {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
           self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
    }
}
