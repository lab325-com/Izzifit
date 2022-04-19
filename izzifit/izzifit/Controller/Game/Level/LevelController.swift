//
//  LevelController.swift
//  izzifit
//
//  Created by O l e h on 14.04.2022.
//

import UIKit

class LevelController: BaseController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var shipBtn: UIButton!
    @IBOutlet weak var fishBtn: UIButton!
    @IBOutlet weak var igluBtn: UIButton!
    @IBOutlet weak var goldBtn: UIButton!
    @IBOutlet weak var deerBtn: UIButton!
    
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var energyLbl: UILabel!
    @IBOutlet weak var coinsLbl: UILabel!
    
    
    private var player = PlayerModel(shipState: .start,
                                     fishState: .finish,
                                     igluState: .fourth,
                                     goldState: .third,
                                     deerState: .second)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        hiddenNavigationBar = true
        drawStates()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let x = (439 - UIScreen.main.bounds.size.width) / 2
        self.scrollView.setContentOffset(CGPoint(x: x,
                                                 y: 0),
                                         animated: true)
    }
    
    private func setup() {
        
        coinsLbl.text = "\(KeychainService.standard.me?.coins ?? 0)"
        energyLbl.text = "\(KeychainService.standard.me?.energy ?? 0)"
        
        if let name = KeychainService.standard.me?.name {
            nameLabel.text = RLocalization.energy_header_title(name)
        } else {
            nameLabel.isHidden = true
        }
        
        avatarImageView.kf.setImage(with: URL(string: KeychainService.standard.me?.Avatar?.url ?? ""),
                                    placeholder: RImage.placeholder_food_ic(),
                                    options: [.transition(.fade(0.25))])
    }
    
    private func drawStates() {
        switch player.shipState {
        case .start:
            shipBtn.setImage(view.image(img: .shipStart),
                             for: .normal)
        case .first:
            shipBtn.setImage(view.image(img: .shipFirst),
                             for: .normal)
        case .second:
            shipBtn.setImage(view.image(img: .shipSecond),
                             for: .normal)
        case .third:
            shipBtn.setImage(view.image(img: .shipThird),
                             for: .normal)
        case .fourth:
            shipBtn.setImage(view.image(img: .shipFourth),
                             for: .normal)
        case .finish:
            shipBtn.setImage(view.image(img: .shipFinish),
                             for: .normal)
        }
        
        switch player.fishState {
        case .start:
            fishBtn.setImage(view.image(img: .fishStart),
                             for: .normal)
        case .first:
            fishBtn.setImage(view.image(img: .fishFirst),
                             for: .normal)
        case .second:
            fishBtn.setImage(view.image(img: .fishSecond),
                             for: .normal)
        case .third:
            fishBtn.setImage(view.image(img: .fishThird),
                             for: .normal)
        case .fourth:
            fishBtn.setImage(view.image(img: .fishFourth),
                             for: .normal)
        case .finish:
            fishBtn.setImage(view.image(img: .fishFinish),
                             for: .normal)
        }
        
        switch player.igluState {
        case .start:
            igluBtn.setImage(view.image(img: .igluStart),
                             for: .normal)
        case .first:
            igluBtn.setImage(view.image(img: .igluFirst),
                             for: .normal)
        case .second:
            igluBtn.setImage(view.image(img: .igluSecond),
                             for: .normal)
        case .third:
            igluBtn.setImage(view.image(img: .igluThird),
                             for: .normal)
        case .fourth:
            igluBtn.setImage(view.image(img: .igluFourth),
                             for: .normal)
        case .finish:
            igluBtn.setImage(view.image(img: .igluFinish),
                             for: .normal)
        }
        
        switch player.goldState {
        case .start:
            goldBtn.setImage(view.image(img: .goldStart),
                             for: .normal)
        case .first:
            goldBtn.setImage(view.image(img: .goldFirst),
                             for: .normal)
        case .second:
            goldBtn.setImage(view.image(img: .goldSecond),
                             for: .normal)
        case .third:
            goldBtn.setImage(view.image(img: .goldThird),
                             for: .normal)
        case .fourth:
            goldBtn.setImage(view.image(img: .goldFourth),
                             for: .normal)
        case .finish:
            goldBtn.setImage(view.image(img: .goldFinish),
                             for: .normal)
        }
        
        switch player.deerState {
        case .start:
            deerBtn.setImage(view.image(img: .deersStart),
                             for: .normal)
        case .first:
            deerBtn.setImage(view.image(img: .deersFirst),
                             for: .normal)
        case .second:
            deerBtn.setImage(view.image(img: .deersSecond),
                             for: .normal)
        case .third:
            deerBtn.setImage(view.image(img: .deersThird),
                             for: .normal)
        case .fourth:
            deerBtn.setImage(view.image(img: .deersFourth),
                             for: .normal)
        case .finish:
            deerBtn.setImage(view.image(img: .deersFinish),
                             for: .normal)
        }
    }
}
