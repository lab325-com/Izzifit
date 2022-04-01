//
//  WorkoutDetailMuscleController.swift
//  izzifit
//
//  Created by Andrey S on 29.03.2022.
//

import UIKit

class WorkoutDetailMuscleController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let cellIdentifier = String(describing: WorkoutDetailMuscleСell.self)
    private let muscles: [String]
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(muscles: [String]) {
        self.muscles = muscles
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
        mainTitleLabel.text = RLocalization.workout_detail_muscle()
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    //----------------------------------------------
    // MARK: - IBAction
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
}

//----------------------------------------------
// MARK: - UITableViewDelegate, UITableViewDataSource
//----------------------------------------------

extension WorkoutDetailMuscleController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return muscles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as? WorkoutDetailMuscleСell else { return UITableViewCell() }
        cell.setupCell(title: muscles[indexPath.row])
        return cell
        
    }
}
