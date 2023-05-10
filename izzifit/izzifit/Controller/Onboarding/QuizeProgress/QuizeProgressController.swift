//
//  QuizeProgressController.swift
//  izzifit
//
//  Created by mob325 on 17.02.2022.
//

import UIKit

class QuizeProgressController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var processingLabel: UILabel!
    @IBOutlet weak var subtitleProcesingLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    //----------------------------------------------
    // MARK: - Propery
    //----------------------------------------------
    
    private lazy var presenter = QuizeProgressPresenter(view: self)
    private var circularProgressBarView: CircularProgressBarView!
    private var circularViewDuration: TimeInterval = 4
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        hiddenNavigationBar = true
        super.viewDidLoad()

        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        hiddenNavigationBar = true
        super.viewDidAppear(animated)
    }
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    private func setup() {
        processingLabel.text = RLocalization.onboarding_processing_title()
        subtitleProcesingLabel.text = RLocalization.onboarding_processing_subTitle()
        
        setUpCircularProgressBarView()
        presenter.profileUpdate()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    func setUpCircularProgressBarView() {
        DispatchQueue.main.async {
            // set view
            self.circularProgressBarView = CircularProgressBarView(frame: .zero)
            self.circularProgressBarView.createCircularPath(backColor: UIColor(rgb: 0xDBD6E6), frontColor: UIColor(rgb: 0xFF42A8))
            // align to the center of the screen
            self.circularProgressBarView.center = self.mainView.center
            // call the animation with circularViewDuration
            self.circularProgressBarView.progressAnimation(duration: self.circularViewDuration)
            // add this view to the view controller
            self.view.addSubview(self.circularProgressBarView)
        }
       
    }
}

//----------------------------------------------
// MARK: - QuizeProgressOutputProtocol
//----------------------------------------------

extension QuizeProgressController: QuizeProgressOutputProtocol {
    func success() {
        AnalyticsHelper.sendFirebaseEvents(events: .quiz_finish)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) { [weak self] in
            guard let `self` = self else { return }
            if PreferencesManager.sharedManager.preOnboardingRemote?.afterPogess == true, let screen =  PreferencesManager.sharedManager.preOnboardingRemote?.screen {
                switch screen {
                case .video:
                    OnboardingRouter(presenter: self.navigationController).presentVideo(delegate: self)
                }
            } else {
                if PaywallRouter(presenter: self.navigationController).presentPaywall(delegate: self, place: .afterOnboarding) == false {
                    RootRouter.sharedInstance.loadMain(toWindow: RootRouter.sharedInstance.window!)
                }
            }
            
            
        }
    }
    
    func failure() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.actionBack()
        }
    }
}

//----------------------------------------------
// MARK: - PaywallProtocol
//----------------------------------------------

extension QuizeProgressController: PaywallProtocol {
    func paywallActionBack(controller: BaseController) {
        RootRouter.sharedInstance.loadMain(toWindow: RootRouter.sharedInstance.window!)
    }
    
    func paywallSuccess(controller: BaseController) {
        
        RootRouter.sharedInstance.loadMain(toWindow: RootRouter.sharedInstance.window!)
    }
}

//----------------------------------------------
// MARK: - QuizeVideoPotocol
//----------------------------------------------

extension QuizeProgressController: QuizeVideoPotocol {
    func quizeVideoEnd(contoller: QuizeVideoController) {
        if PaywallRouter(presenter: self.navigationController).presentPaywall(delegate: self, place: .afterOnboarding) == false {
            RootRouter.sharedInstance.loadMain(toWindow: RootRouter.sharedInstance.window!)
        }
    }
}
