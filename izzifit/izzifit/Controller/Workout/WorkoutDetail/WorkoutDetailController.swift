//
//  WorkoutDetailController.swift
//  izzifit
//
//  Created by Andrey S on 28.03.2022.
//

import UIKit

class WorkoutDetailController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startWorkoutButton: UIButton!
    @IBOutlet weak var botomView: UIView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let cellIdentifier = String(describing: WorkoutDetailHeaderCell.self)
    private let cellIDescriptiondentifier = String(describing: WorkoutDetailDescriptionCell.self)
    private let cellTrainingIdentifier = String(describing: WorkoutDetailTrainCell.self)
    
    private let sectionTitleIdentifier = String(describing: WorkoutDetailSectionCell.self)
    
    private lazy var presenter = WorkoutDetailPresenter(view: self)
    private lazy var presenterSubscribe = SubscribePresenter(view: self)
    
    private var selectedId: String?
    
    private let id: String
    private let idSpecialId: String?
    
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(id: String, idSpecialId: String? = nil) {
        self.id = id
        self.idSpecialId = idSpecialId
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        AnalyticsHelper.sendFirebaseEvents(events: .workout_open)
        
        startWorkoutButton.setTitle("", for: .normal)
        
        tableView.isHidden = true
        presenter.getWorkouts(id: id)
        
        if let idSpecialId = idSpecialId {
            presenter.retriveNotAutoProduct(id: [idSpecialId])
        }
        
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.register(UINib(nibName: cellTrainingIdentifier, bundle: nil), forCellReuseIdentifier: cellTrainingIdentifier)
        tableView.register(UINib(nibName: cellIDescriptiondentifier, bundle: nil), forCellReuseIdentifier: cellIDescriptiondentifier)
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        tableView.register(UINib(nibName: sectionTitleIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: sectionTitleIdentifier)
    }
    
    @IBAction func actionStartWorkout(_ sender: UIButton) {
        if let  idSpecialId = idSpecialId, presenter.workout?.isAvailable != true  {
            AnalyticsHelper.sendFirebaseEvents(events: .pay_paid_mk_open, params: ["id": idSpecialId])
            presenterSubscribe.purchaseProduct(id: idSpecialId, screen: .wokoutInApp, place: .workout) { [weak self] result, error in
                guard let `self` = self else { return }
                if result {
                    self.presenter.getWorkouts(id: self.id)
                }
            }
        } else {
            AnalyticsHelper.sendFirebaseEvents(events: .workout_start)
            guard let exercisesGroup = presenter.workout?.exerciseGroups?.flatMap({$0.exercises}), let model = presenter.workout else { return }
            
            var exercises: [ExerciseModel] = []
            
            for group in exercisesGroup {
                exercises.append(contentsOf: group)
            }
            
            if idSpecialId != nil, let firstExercises = exercisesGroup.first {
                exercises.removeAll()
                exercises.append(contentsOf: firstExercises)
            }
            
            WorkoutRouter(presenter: navigationController).pushVideoPlayer(workout: model, exercises: exercises)
        }
    }
}

//----------------------------------------------
// MARK: - UITableViewDelegate, UITableViewDataSource
//----------------------------------------------

extension WorkoutDetailController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return idSpecialId != nil ? 1 : (1 + (presenter.workout?.exerciseGroups?.count ?? 0))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        
        return (presenter.workout?.exerciseGroups?[safe: section - 1]?.exercises?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as? WorkoutDetailHeaderCell else { return UITableViewCell() }
                cell.delegate = self
                cell.setupCell(model: presenter.workout)
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIDescriptiondentifier) as? WorkoutDetailDescriptionCell else { return UITableViewCell() }
                cell.delegate = self
                cell.setupCell(model: presenter.workout, isSpecial: idSpecialId != nil, paymentInfo: presenter.paymentsInfo.first(where: {$0.product == idSpecialId}))
                return cell
            default:
                return UITableViewCell()
            }
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellTrainingIdentifier) as? WorkoutDetailTrainCell else { return UITableViewCell() }
            if let model = presenter.workout?.exerciseGroups?[safe: indexPath.section - 1]?.exercises?[safe: indexPath.row] {
                let nextExecise = presenter.workout?.exerciseGroups?[safe: indexPath.section - 1]?.exercises?[safe: indexPath.row + 1]
                
                cell.setupCell(model: model, isSelected: selectedId == model.id, isHiddenSepate: nextExecise == nil ? true : false)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        } else {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "WorkoutDetailSectionCell") as! WorkoutDetailSectionCell
            headerView.nameLabel.text = presenter.workout?.exerciseGroups?[safe: section - 1]?.title
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0.1 : 22
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        AudioManager.sharedManager.playSound()
        if indexPath.section != 0, let id = presenter.workout?.exerciseGroups?[safe: indexPath.section - 1]?.exercises?[safe: indexPath.row]?.id, presenter.workout?.exerciseGroups?[safe: indexPath.section - 1]?.exercises?[safe: indexPath.row]?.isRest != true {
            
            
            selectedId = selectedId == id ? nil : id
            self.tableView.reloadData()
        }
    }
}

//----------------------------------------------
// MARK: - WorkoutDetailHeaderProtocol
//----------------------------------------------

extension WorkoutDetailController: WorkoutDetailHeaderProtocol {
    func workoutDetailHeaderBack(cell: WorkoutDetailHeaderCell) {
        if let idSpecialId = idSpecialId {
            AnalyticsHelper.sendFirebaseEvents(events: .pay_paid_mk_close, params: ["id": idSpecialId])
        }
        actionBack()
    }
}

//----------------------------------------------
// MARK: - WorkoutDetailOutputProtocol
//----------------------------------------------

extension WorkoutDetailController: WorkoutDetailOutputProtocol {
    func success() {
        startWorkoutButton.setTitle(presenter.workout?.isAvailable == true ? RLocalization.workout_detail_start() : "Buy Now", for: .normal)
        
        tableView.isHidden = false
        tableView.reloadData()
    }
    
    func failure() {
       actionBack()
    }
}

//----------------------------------------------
// MARK: - WorkoutDetailOutputProtocol
//----------------------------------------------

extension WorkoutDetailController: WorkoutDetailDescriptionProtocol {
    func workoutDetailDescriptionMuscle(cell: WorkoutDetailDescriptionCell, muscles: [String]) {
        WorkoutRouter(presenter: navigationController).pushDetailMuscle(muscles: muscles)
    }
}

//----------------------------------------------
// MARK: - SubscribeOutputProtocol
//----------------------------------------------

extension WorkoutDetailController: SubscribeOutputProtocol {
    func successRetrive() {
        
    }
    
    func failure(error: String) {
        
    }
}
