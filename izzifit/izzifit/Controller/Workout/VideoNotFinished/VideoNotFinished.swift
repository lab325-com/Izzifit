//
//  VideoNotFinished.swift
//  izzifit
//
//  Created by Andrey S on 15.04.2022.
//

import UIKit

protocol VideoNotFinishedProtocol: AnyObject {
    func videoNotFinishedGoBack(controller: VideoNotFinished)
}

class VideoNotFinished: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var hardView: UIView!
    @IBOutlet weak var toLongToMe: UIView!
    @IBOutlet weak var justWatchView: UIView!
    @IBOutlet weak var otherView: UIView!
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var goBackButton: UIButton!
    @IBOutlet weak var hardLabel: UILabel!
    @IBOutlet weak var longLabel: UILabel!
    @IBOutlet weak var watchingLabel: UILabel!
    @IBOutlet weak var otherLabel: UILabel!
    
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    weak var delegate: VideoNotFinishedProtocol?
    private lazy var preseneter = VideoPlayerPresenter(view: self)
    let attemptId: String
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(delegate: VideoNotFinishedProtocol, attemptId: String) {
        self.attemptId = attemptId
        self.delegate = delegate
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
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        AnalyticsHelper.sendFirebaseEvents(events: .workout_skip)
        
        mainTitleLabel.text = RLocalization.player_not_finisged_title()
        subTitleLabel.text = RLocalization.player_not_finisged_subtTite()
        goBackButton.setTitle(RLocalization.player_not_finisged_go_back(), for: .normal)
        hardLabel.text = RLocalization.player_not_finisged_hard()
        longLabel.text = RLocalization.player_not_finisged_long()
        watchingLabel.text = RLocalization.player_not_finisged_watching()
        otherLabel.text = RLocalization.player_not_finisged_other()
        
        hardView.layer.borderWidth = 2
        hardView.layer.borderColor = UIColor(red: 0.799, green: 0.745, blue: 0.913, alpha: 1).cgColor
        
        toLongToMe.layer.borderWidth = 2
        toLongToMe.layer.borderColor = UIColor(red: 0.799, green: 0.745, blue: 0.913, alpha: 1).cgColor
        
        justWatchView.layer.borderWidth = 2
        justWatchView.layer.borderColor = UIColor(red: 0.799, green: 0.745, blue: 0.913, alpha: 1).cgColor
        
        otherView.layer.borderWidth = 2
        otherView.layer.borderColor = UIColor(red: 0.799, green: 0.745, blue: 0.913, alpha: 1).cgColor
    }
    
    //----------------------------------------------
    // MARK: - IBAction
    //----------------------------------------------

    @IBAction func acionBack(_ sender: UIButton) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
           self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
    }
    
    @IBAction func actionContinue(_ sender: UIButton) {
        delegate?.videoNotFinishedGoBack(controller: self)
        actionBack()
    }
    
    @IBAction func actinHard(_ sender: UIButton) {
        preseneter.updateEnd(of: .workoutAttemptFeedbackTypeHard, attemptId: attemptId)
    }
    
    @IBAction func actionToLong(_ sender: UIButton) {
        preseneter.updateEnd(of: .workoutAttemptFeedbackTypeLong, attemptId: attemptId)
    }
    
    @IBAction func actionWatching(_ sender: UIButton) {
        preseneter.updateEnd(of: .workoutAttemptFeedbackTypeWatching, attemptId: attemptId)
    }
    
    @IBAction func actionOther(_ sender: UIButton) {
        preseneter.updateEnd(of: .workoutAttemptFeedbackTypeOther, attemptId: attemptId)
    }
}

//----------------------------------------------
// MARK: - VideoPlayerOutputProtocol
//----------------------------------------------

extension VideoNotFinished: VideoPlayerOutputProtocol {
    func successUpdate() {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
           self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
    }
}
