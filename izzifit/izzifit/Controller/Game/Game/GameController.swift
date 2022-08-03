//
//  GameController.swift
//  izzifit
//
//  Created by O l e h on 27.07.2022.
//

import UIKit

class GameController: BaseController {
 
    var gameView: SpinGameViewProtocol?
    private var collectionView: UICollectionView!
    var firstLaunch = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        hiddenNavigationBar = true
        GameNetworkLayer.shared.getMap(view: self) {
            self.showCorrectView()
            self.firstLaunch = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard !firstLaunch  else { return }
        GameNetworkLayer.shared.getMap(view: self) {
            self.showCorrectView()
        }
    }
    
    func showCorrectView() {
        gameView?.removeFromSuperview()
        switch PreferencesManager.sharedManager.currentMapName {
        case .snow_map:     self.gameView = ArcticGameView()
        case .england_map:  self.gameView = EnglandGameView()
        case .france_map:   self.gameView = FranceGameView()
        case .none:         self.gameView = ArcticGameView()
        }
        
        view.ui.genericlLayout(object: gameView ?? UIView(),
                               parentView: view,
                               topC: 0,
                               bottomC: 0,
                               leadingC: 0,
                               trailingC: 0)
        
        gameView?.hummerBtn.isHidden = true
        gameView?.hummerCountLbl.isHidden = true
        setCollectionView()
    }
    
    private func setCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.h / 12.68,
                                 height: view.h / 4.41)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = view.h / 101.5
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collectionView.backgroundColor = . clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SlotCollectionCell.self,
                                forCellWithReuseIdentifier: SlotCollectionCell.id)
        
        var width = CGFloat()
        var centerH = CGFloat()
        switch PreferencesManager.sharedManager.currentMapName {
        case .snow_map:     width = view.h / 3.90 ; centerH = view.h / 116
        case .england_map:  width = view.h / 3.70 ; centerH = view.h / 126
        case .france_map:   width = view.hRatio(cH: 220); centerH = view.hRatio(cH: 9)
        case .none:         break
        }
        
        view.ui.genericlLayout(object: collectionView,
                               parentView: gameView?.slotBackImgVw ?? UIImageView(),
                               width: width,
                               height: view.h / 5.77,
                               centerV: -view.h / 73,
                               centerH: centerH)
    }
}


//----------------------------------------------
// MARK: - UICollectionViewDataSource
//----------------------------------------------

extension GameController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 3 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlotCollectionCell.id, for: indexPath) as! SlotCollectionCell
        cell.section = indexPath.row
        cell.setupCell()
        return cell
    }
}
