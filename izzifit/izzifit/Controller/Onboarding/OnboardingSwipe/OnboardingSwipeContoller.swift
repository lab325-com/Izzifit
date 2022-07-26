//
//  OnboardingSwipeContoller.swift
//  izzifit
//
//  Created by Andrey S on 15.06.2022.
//

import UIKit

class OnboardingSwipeContoller: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var pageTopLayout: NSLayoutConstraint!
    @IBOutlet weak var pageBottomLayout: NSLayoutConstraint!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let cellIdentifier = String(describing: OnboardingSwipeCell.self)
    private let isHiddenBackButton: Bool
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(isHiddenBackButton: Bool = false) {
        self.isHiddenBackButton = isHiddenBackButton
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
        
        AnalyticsHelper.sendFirebaseEvents(events: .quiz_popup_show)
        
        if (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0) == 0  {
            pageTopLayout.constant = 20
            pageBottomLayout.constant = 20
            self.view.layoutIfNeeded()
        }
        
        backButton.isHidden = isHiddenBackButton
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: cellIdentifier,
                                           bundle: nil),
                                forCellWithReuseIdentifier: cellIdentifier)
        collectionView.reloadData()
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionStart(_ sender: UIButton) {
        OnboardingRouter(presenter: navigationController).pushName()
    }
    
    @IBAction func actionClose(_ sender: UIButton) {
        actionBack()
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
//----------------------------------------------

extension OnboardingSwipeContoller: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  cellIdentifier, for: indexPath) as! OnboardingSwipeCell
        cell.setupCell(model: OnboardingSwipeModel.models[indexPath.row])
        return cell
        
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDelegateFlowLayout
//----------------------------------------------

extension OnboardingSwipeContoller: UICollectionViewDelegateFlowLayout {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

struct OnboardingSwipeModel {
    let image: String
    let title: String
    let header: String
    
    static var models: [OnboardingSwipeModel] {
        return [OnboardingSwipeModel(image: "onboading_swipe_1_ic", title: "Workouts & training plan", header: "Workout, calculate calories, mark your\nactivity and get the energy for game\nplaying"),
                OnboardingSwipeModel(image: "onboading_swipe_2_ic", title: "Release your energy", header: "Turning your energy into wheel spins!\nYou can lose weight by having fun by\nparticipating in an engaging casual\ngame"),
                OnboardingSwipeModel(image: "onboading_swipe_3_ic", title: "Create amazing worlds", header: "Build and improve your worlds! Level\nup your gaming experience by earning\nand spending points and thus keep\npace with workouts and nutrition"),
                OnboardingSwipeModel(image: "onboading_swipe_4_ic", title: "Weight loss easier", header: "A few studies have proven that making\na tedius exercise more fun can improve\nprouctivity. Lose weight easier and\nmore fun!")]
    }
}
