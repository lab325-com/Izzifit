//
//  WorkoutController.swift
//  izzifit
//
//  Created by Andrey S on 21.02.2022.
//

import UIKit

class WorkoutController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var topView: ShadowView!
    
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var flashLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //----------------------------------------------
    // MARK: - Public Property
    //----------------------------------------------
    
    lazy var presenter = WorkoutPresenter(view: self)
    
    let workoutActivitiesIdentifier = String(describing: WorkoutActivitiesCell.self)
    let workoutSpecialIdentifier = String(describing: WorkoutSpecialCell.self)
    let workoutExercisesIdentifier = String(describing: WorkoutExercisesCell.self)
    
    var selectedTypeId: Int? {
        didSet {
            if selectedTypeId != oldValue {
                AnalyticsHelper.sendFirebaseEvents(events: .exe_filter_tap, params: ["id": selectedTypeId ?? 0])
                presenter.getWorkoutsAll(categoryId: selectedTypeId)
            }
        }
    }

    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getWorkout()

        setup()
        setupCollection()
    }

    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        AnalyticsHelper.sendFirebaseEvents(events: .exe_open)
        collectionView.isHidden = true
        
        updateMe()
        
        topView.layer.cornerRadius = 30
        topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        avatarView.gradientBorder(width: 2, colors: [UIColor(rgb: 0xFF42A8), UIColor(rgb: 0x7759B7)], startPoint: .unitCoordinate(.top), endPoint: .unitCoordinate(.bottom), andRoundCornersWithRadius: 20)
        
        avatarImageView.kf.setImage(with: URL(string: KeychainService.standard.me?.Avatar?.url ?? ""), placeholder: RImage.placeholder_food_ic(), options: [.transition(.fade(0.25))])
    }
    
    private func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: workoutActivitiesIdentifier,
                                           bundle: nil),
                                forCellWithReuseIdentifier: workoutActivitiesIdentifier)
        
        collectionView.register(UINib.init(nibName: workoutSpecialIdentifier,
                                           bundle: nil),
                                forCellWithReuseIdentifier: workoutSpecialIdentifier)
        
        collectionView.register(UINib.init(nibName: workoutExercisesIdentifier,
                                           bundle: nil),
                                forCellWithReuseIdentifier: workoutExercisesIdentifier)
        
    }
    
    func updateMe() {
        coinLabel.text = "\(KeychainService.standard.me?.coins ?? 0)"
        flashLabel.text = "\(KeychainService.standard.me?.energy ?? 0)"
        
        if let name = KeychainService.standard.me?.name {
            nameLabel.text = name
        } else {
            nameLabel.isHidden = true
        }
    }
}

extension WorkoutController: WorkoutOutputProtocol {
    func success() {
        collectionView.isHidden = false
        collectionView.reloadData()
    }
    
    func failure() {
        
    }
}
