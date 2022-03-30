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
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var flashLabel: UILabel!
    
    @IBOutlet weak var workoutTable: UITableView!
    
    //----------------------------------------------
    // MARK: - Public Property
    //----------------------------------------------
    
    lazy var presenter = WorkoutPresenter(view: self)
    
    let workoutActivitiesIdentifier = String(describing: WorkoutActivitiesCell.self)
    let workoutSpecialIdentifier = String(describing: WorkoutSpecialCell.self)
    let workoutExercisesIdentifier = String(describing: WorkoutExercisesCell.self)

    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getWorkoutTypes()

        setup()
        setupTable()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        topView.layer.cornerRadius = 30
        topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        avatarView.gradientBorder(width: 2, colors: [UIColor(rgb: 0xFF42A8), UIColor(rgb: 0x7759B7)], startPoint: .unitCoordinate(.top), endPoint: .unitCoordinate(.bottom), andRoundCornersWithRadius: 20)
    }
    
    private func setupTable() {
        workoutTable.tableFooterView = UIView()
        workoutTable.rowHeight = UITableView.automaticDimension
        
        workoutTable.register(UINib(nibName: workoutActivitiesIdentifier, bundle: nil), forCellReuseIdentifier: workoutActivitiesIdentifier)
        workoutTable.register(UINib(nibName: workoutSpecialIdentifier, bundle: nil), forCellReuseIdentifier: workoutSpecialIdentifier)
        workoutTable.register(UINib(nibName: workoutExercisesIdentifier, bundle: nil), forCellReuseIdentifier: workoutExercisesIdentifier)
    }
}

extension WorkoutController: WorkoutOutputProtocol {
    func successGetWorkoutTypes() {
        workoutTable.reloadData()
    }
    
    func failure(error: String) {
        
    }
}
