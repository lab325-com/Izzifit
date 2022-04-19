//
//  VideoPlayerController.swift
//  izzifit
//
//  Created by Andrey S on 12.04.2022.
//

import UIKit
import AVFoundation
import Kingfisher

enum PlayerType {
    case start
    case getReady
    case getReadyPause
    case plaing
    case playingPause
    case rest
    case restPause
}

class VideoPlayerController: BaseController, VideoPlayerOutputProtocol {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var nextTitleLabel: UILabel!
    @IBOutlet weak var nextSubTitleLabel: UILabel!
    
    @IBOutlet weak var progressStackView: UIStackView!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var nextView: UIView!
    
    @IBOutlet weak var bublesImageView: UIImageView!
    
    @IBOutlet weak var muteButton: UIButton!
    @IBOutlet weak var mainCircleView: UIView!
    @IBOutlet weak var circleView: CircularProgressBarView!
    @IBOutlet weak var timeCircleLabel: UILabel!
    
    @IBOutlet weak var restView: UIView!
    
    @IBOutlet weak var playerLandskapeShaowImageView: UIImageView!
    @IBOutlet weak var repsLabel: UILabel!
    
    @IBOutlet weak var workoutImageView: UIImageView!
    
    //----------------------------------------------
    // MARK: - Propety
    //----------------------------------------------
    
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer!
    private let exercises: [ExerciseModel]
    
    private var pogresses: [PlainHorizontalProgressBar] = []
    
    private var currentIndex = 0 {
        didSet {
            if let model = exercises[safe: currentIndex], model.isRest == true {
                timerRest?.invalidate()
                timerRest = nil
                timeRest = (model.duration?.minutes ?? 0) * 60 + (model.duration?.seconds ?? 0)
                palyerType = .rest
            } else {
                if let urlVideo = exercises[safe: currentIndex]?.video?.url {
                    let url = URL(string: urlVideo)!
                    player?.replaceCurrentItem(with: AVPlayerItem(url: url))
                } else {
                    let url = URL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")!
                    player?.replaceCurrentItem(with: AVPlayerItem(url: url))
                }
                
                palyerType = .start
                palyerType = .getReady
                timerPlayerTime = (exercises[safe: currentIndex]?.duration?.minutes ?? 0) * 60 + (exercises[safe: currentIndex]?.duration?.seconds ?? 0)
            }
            
            workoutImageView.kf.setImage(with: URL(string: exercises[safe: currentIndex]?.image?.urlIosFull ?? ""), placeholder: RImage.placeholder_big_sport_ic(), options: [.transition(.fade(0.25))])
            
            repsLabel.text = "\(exercises[safe: currentIndex]?.rapes ?? 0) \(RLocalization.video_player_reps())"
            updateNext()
        }
    }
    
    private var timer: Timer?
    private var timerRest: Timer?
    private var timerPlayer: Timer?
    
    private var timeRest = 0
    private var timerPlayerTime = 0
    
    private var getReadyTime = 16 {
        didSet {
            if getReadyTime == 0 {
                palyerType = .plaing
            } else if getReadyTime > 0 {
                mainLabel.text = "\(RLocalization.video_player_get_ready())\n00:\(String(format: "%02d", getReadyTime))"
            }
        }
    }
    
    private var palyerType: PlayerType = .start {
        didSet {
            updatePlayer()
        }
    }
    
    private lazy var presenter = VideoPlayerPresenter(view: self)
    private let workout: WorkoutByIdMainModel
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(workout: WorkoutByIdMainModel, exercises: [ExerciseModel]) {
        self.workout = workout
        self.exercises = exercises
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer.frame = videoView.bounds
    }
    
    override func viewDidLoad() {
        hiddenNavigationBar = true
        super.viewDidLoad()

        setup()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
            coordinator.animate(alongsideTransition: { (context) in
            }) { [weak self] (context) in
                guard let `self` = self else { return }
                
                if UIDevice.current.orientation.isPortrait {
                    self.updateUI(isPortait: true)
                } else {
                    self.updateUI(isPortait: false)
                }
                
                self.playerLayer.frame = self.videoView.bounds
            }
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(backgorundNotification), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(foregroundNotification), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        presenter.startWorkout(workoutId: workout.id)
        
        if let urlVideo = exercises[safe: currentIndex]?.video?.url {
            let url = URL(string: urlVideo)!
            player = AVPlayer(url: url)
        } else {
            let url = URL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")!
            player = AVPlayer(url: url)
        }
        
        if let model = exercises[safe: currentIndex] {
            workoutImageView.kf.setImage(with: URL(string: model.image?.urlIosFull ?? ""), placeholder: RImage.placeholder_big_sport_ic(), options: [.transition(.fade(0.25))])
            
            if model.isRest == true {
                timeRest = (model.duration?.minutes ?? 0) * 60 + (model.duration?.seconds ?? 0)
            } else {
                timerPlayerTime = (model.duration?.minutes ?? 0) * 60 + (model.duration?.seconds ?? 0)
            }
        }
        
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspectFill
        
        videoView.layer.addSublayer(playerLayer)
        
        mainCircleView.isHidden = true
        circleView.progressAnimation(duration: 0.0, toValue: 0.0)
        timeCircleLabel.text = "00:00"
        mainLabel.text = RLocalization.video_player_start()
        restView.isHidden = true
        repsLabel.text = "\(exercises[safe: currentIndex]?.rapes ?? 0) \(RLocalization.video_player_reps())"
        setupProgresStack()
        updateNext()
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        DispatchQueue.main.async {
            self.circleView.createCircularPath(backColor: UIColor(red: 0.247, green: 0.245, blue: 0.338, alpha: 0.2), frontColor: UIColor(rgb: 0xFF42A8), radius: 70, lineWidth: 8)
        }
        
    }
    
    
    private func setupProgresStack() {
        progressStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for index in 0..<exercises.count  {
            let view = PlainHorizontalProgressBar()
            
            if index == 0 {
                view.layer.cornerRadius = 4
                view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                
                view.progressLayer.cornerRadius = 4
                view.progressLayer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                
            } else if index == exercises.count - 1 {
                view.layer.cornerRadius = 4
                view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
                
                view.progressLayer.cornerRadius = 4
                view.progressLayer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            }
            
            view.color = UIColor(rgb: 0x513A84)
            view.layer.backgroundColor = UIColor(rgb: 0x513A84, alpha: 0.1).cgColor
            progressStackView.addArrangedSubview(view)
            
            pogresses.append(view)
        }
    }
    
    private func updateNext() {
        if let model = exercises[safe: currentIndex + 1] {
            let hour = String(format: "%02d", model.duration?.minutes ?? 0)
            let minutes = String(format: "%02d", model.duration?.seconds ?? 0)
            
            nextTitleLabel.text = "\(RLocalization.video_player_next()) | \(hour):\(minutes)"
            nextSubTitleLabel.text = model.title
            
            nextView.isHidden = false
            bublesImageView.isHidden = false
            
            nextButton.setImage(RImage.player_next_ic(), for: .normal)
        } else {
            nextView.isHidden = true
            bublesImageView.isHidden = true
        
            nextButton.setImage(RImage.player_next_inactive_ic(), for: .normal)
        }
        
        if let _ = exercises[safe: currentIndex - 1] {
            previousButton.setImage(RImage.player_prev_active_ic(), for: .normal)
        } else {
            previousButton.setImage(RImage.player_prev_ic(), for: .normal)
        }
    }
    
    private func updatePlayer() {
        switch palyerType {
        case .start:
            circleView.progressAnimation(duration: 0.0, toValue: 0.0)
            timeCircleLabel.text = "00:00"
            
            mainCircleView.isHidden = UIDevice.current.orientation == .portrait
            restView.isHidden = true
            
            getReadyTime = 15
            timer?.invalidate()
            timer = nil
            timerRest?.invalidate()
            timerRest = nil
            timerPlayer?.invalidate()
            timerPlayer = nil
            
            player?.pause()
            break
        case .getReady:
            circleView.progressAnimation(duration: 0.0, toValue: 0.0)
            timeCircleLabel.text = "00:00"
            playButton.setImage(RImage.player_stop_ic(), for: .normal)
            mainCircleView.isHidden = UIDevice.current.orientation == .portrait
            restView.isHidden = true
            playerLandskapeShaowImageView.isHidden = false
            timerRest?.invalidate()
            timerRest = nil
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(getReadyTimer), userInfo: nil, repeats: true)
            timer?.fire()
        case .getReadyPause:
            circleView.progressAnimation(duration: 0.0, toValue: 0.0)
            timeCircleLabel.text = "00:00"
            playButton.setImage(RImage.player_play_ic(), for: .normal)
            mainCircleView.isHidden = UIDevice.current.orientation == .portrait
            restView.isHidden = true
            playerLandskapeShaowImageView.isHidden = false
            
            timer?.invalidate()
            timer = nil
            timerRest?.invalidate()
            timerRest = nil
            timerPlayer?.invalidate()
            timerPlayer = nil
            
            player?.pause()
        case .plaing:
            playButton.setImage(RImage.player_stop_ic(), for: .normal)
            mainCircleView.isHidden = false
            restView.isHidden = true
            playerLandskapeShaowImageView.isHidden = true
            mainLabel.text = ""
            
            timer?.invalidate()
            timer = nil
            timerRest?.invalidate()
            timerRest = nil
            
            timerPlayer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(getPlayerTimer), userInfo: nil, repeats: true)
            timerPlayer?.fire()
            
            player?.play()
        case .playingPause:
            playButton.setImage(RImage.player_play_ic(), for: .normal)
            mainCircleView.isHidden = false
            restView.isHidden = true
            playerLandskapeShaowImageView.isHidden = true
            
            player?.pause()
        
            timerPlayer?.invalidate()
            timerPlayer = nil
            
        case .rest:
            mainCircleView.isHidden = false
            restView.isHidden = false
            playerLandskapeShaowImageView.isHidden = true
            mainLabel.text = ""
            
            timer?.invalidate()
            timer = nil
            timerPlayer?.invalidate()
            timerPlayer = nil
            
            timerRest = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(getReastTimer), userInfo: nil, repeats: true)
            timerRest?.fire()
            
        case .restPause:
            mainCircleView.isHidden = false
            restView.isHidden = false
            playerLandskapeShaowImageView.isHidden = true
            mainLabel.text = ""
            
            timerPlayer?.invalidate()
            timerPlayer = nil
            timer?.invalidate()
            timer = nil
            timerRest?.invalidate()
            timerRest = nil
        }
    }
    
    
    private func nextVideo() {
        if let _ = exercises[safe: currentIndex + 1] {
            currentIndex += 1
        } else if pogresses.first(where: {$0.progress != 1.0}) != nil {
            
            player = nil
            NotificationCenter.default.removeObserver(self)
            timer?.invalidate()
            timer = nil
            timerRest?.invalidate()
            timerRest = nil
            timerPlayer?.invalidate()
            timerPlayer = nil
            
            guard let atteptId = presenter.attemptId else { return }
            
            WorkoutRouter(presenter: navigationController).pushVideoNotFinished(delegate: self, attemptId: atteptId)
        } else {
            player = nil
            NotificationCenter.default.removeObserver(self)
            timer?.invalidate()
            timer = nil
            timerRest?.invalidate()
            timerRest = nil
            timerPlayer?.invalidate()
            timerPlayer = nil
            
            guard let atteptId = presenter.attemptId else { return }
            WorkoutRouter(presenter: navigationController).pushVideoFinished(attemptId: atteptId, workout: workout)
        }
    }
    
    private func updateUI(isPortait: Bool) {
        if isPortait {
            switch palyerType {
            case .start, .getReady, .getReadyPause:
                mainCircleView.isHidden = true
            case .plaing, .playingPause, .rest, .restPause:
                mainCircleView.isHidden = false
            }
            
            for view in pogresses {
                view.color = UIColor(rgb: 0x513A84)
                view.layer.backgroundColor = UIColor(rgb: 0x513A84, alpha: 0.1).cgColor
            }
            
            timeCircleLabel.textColor = UIColor(rgb: 0x3F3E56)
            mainLabel.textColor = UIColor(rgb: 0x3F3E56)
            circleView.updatePath(radius: 75, backColor: UIColor(red: 0.247, green: 0.245, blue: 0.338, alpha: 0.2))
            
            muteButton.setImage(player?.isMuted == true ? RImage.player_portrait_unmute_ic() : RImage.player_portrait_mute_ic(), for: .normal)
        } else {
            mainCircleView.isHidden = false
            mainLabel.textColor = UIColor.white
            circleView.updatePath(radius: 35, backColor: UIColor(rgb: 0xFFFFFF, alpha: 0.2))
            timeCircleLabel.textColor = UIColor.white
            muteButton.setImage(player?.isMuted == true ? RImage.player_landscape_unmute_ic() : RImage.player_landscape_mute_ic(), for: .normal)
            
            for view in pogresses {
                view.color = UIColor(rgb: 0xFFFFFF, alpha: 0.8)
                view.layer.backgroundColor = UIColor(rgb: 0xFFFFFF, alpha: 0.2).cgColor
            }
        }
    }
    
    //----------------------------------------------
    // MARK: - IBAction
    //----------------------------------------------
    
    @IBAction func actionMute(_ sender: UIButton) {
        player?.isMuted = !(player?.isMuted ?? false)
        
        updateUI(isPortait: UIDevice.current.orientation == .portrait)
    }
    
    @IBAction func previsAction(_ sender: Any) {
        if let _ = exercises[safe: currentIndex - 1] {
            currentIndex -= 1
        }
    }
    
    @IBAction func actionPlay(_ sender: UIButton) {
        
        switch palyerType {
        case .start:
            palyerType = .getReady
        case .getReady:
            palyerType = .getReadyPause
        case .getReadyPause:
            palyerType = .getReady
        case .plaing:
            palyerType = .playingPause
        case .playingPause:
            palyerType = .plaing
        case .rest:
            palyerType = .restPause
        case .restPause:
            palyerType = .rest
        }
        
    }
    
    @IBAction func actionNext(_ sender: UIButton) {
        nextVideo()
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        player = nil
        NotificationCenter.default.removeObserver(self)
        timer?.invalidate()
        timer = nil
        timerRest?.invalidate()
        timerRest = nil
        timerPlayer?.invalidate()
        timerPlayer = nil
        
        actionBack()
    }
    
    @objc func getReastTimer() {
        timeRest -= 1
        
        if timeRest < 0 {
            if let exerciseId = exercises[safe: currentIndex]?.id {
                presenter.doExercisese(exerciseId: exerciseId)
            }
            nextVideo()
        } else {
            if let model = exercises[safe: currentIndex] {
                let timeAll = (model.duration?.minutes ?? 0) * 60 + (model.duration?.seconds ?? 0)
                
                let diffTime = (timeAll - timeRest)
                
                self.timeCircleLabel.text = "\(String(format: "%02d", Int((timeAll - diffTime) % 3600 / 60))):\(String(format: "%02d", Int(((timeAll - diffTime) % 3600) % 60)))"
                
                let timeCurrect = Float(diffTime)
                
                let progress = CGFloat(timeCurrect / Float(timeAll))
                
                self.circleView.progressNew(duration: 1.0, toValue: progress, fromValue: CGFloat((timeCurrect - 1.0) / Float(timeAll)))
                
                if self.pogresses[safe: self.currentIndex]?.progress ?? 0.0 < progress {
                    self.pogresses[safe: self.currentIndex]?.progress = progress
                }
            }
        }
    }
    
    @objc func getPlayerTimer() {
        timerPlayerTime -= 1
        
        if timerPlayerTime < 0 {
            if let exerciseId = exercises[safe: currentIndex]?.id {
                presenter.doExercisese(exerciseId: exerciseId)
            }
            nextVideo()
        } else {
            if let model = exercises[safe: currentIndex] {
                let timeAll = (model.duration?.minutes ?? 0) * 60 + (model.duration?.seconds ?? 0)
                
                let diffTime = (timeAll - timerPlayerTime)
                
                self.timeCircleLabel.text = "\(String(format: "%02d", Int((timeAll - diffTime) % 3600 / 60))):\(String(format: "%02d", Int(((timeAll - diffTime) % 3600) % 60)))"
                
                let timeCurrect = Float(diffTime)
                
                let progress = CGFloat(timeCurrect / Float(timeAll))
                
                self.circleView.progressNew(duration: 1.0, toValue: progress, fromValue: CGFloat((timeCurrect - 1.0) / Float(timeAll)))
                
                if self.pogresses[safe: self.currentIndex]?.progress ?? 0.0 < progress {
                    self.pogresses[safe: self.currentIndex]?.progress = progress
                }
            }
        }
    }
    
    @objc func getReadyTimer() {
        getReadyTime -= 1
    }
    
    @objc func playerDidFinishPlaying(notification: NSNotification) {
        if palyerType == .plaing {
            player?.seek(to: CMTime.zero)
            player?.play()
        }
    }
    
    @objc func backgorundNotification() {
        timer?.invalidate()
        timer = nil
        timerRest?.invalidate()
        timerRest = nil
        timerPlayer?.invalidate()
        timerPlayer = nil
        player?.pause()
    }
    
    @objc func foregroundNotification() {
        updatePlayer()
    }
}

//----------------------------------------------
// MARK: - VideoNotFinishedProtocol
//----------------------------------------------

extension VideoPlayerController: VideoNotFinishedProtocol {
    func videoNotFinishedGoBack(controller: VideoNotFinished) {
        currentIndex = 0
    }
}
