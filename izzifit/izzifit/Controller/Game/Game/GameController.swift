//
//  GameController.swift
//  izzifit
//
//  Created by O l e h on 27.07.2022.
//

import UIKit

class GameController: BaseController {
 
    var gameView: SpinGameViewProtocol
    var initMapName: MapName
    private var collectionView: UICollectionView!
    
    init() {
        switch PreferencesManager.sharedManager.currentMapName {
        case .snow_map:     self.gameView = ArcticGameView()
        case .england_map:  self.gameView = EnglandGameView()
        case .france_map:   self.gameView = FranceGameView()
        case .none:         self.gameView = ArcticGameView()
        }
        
        self.initMapName = PreferencesManager.sharedManager.currentMapName ?? .snow_map
        super.init(nibName: nil, bundle: nil)
        
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenNavigationBar = true
        showCorrectView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let mapName = PreferencesManager.sharedManager.currentMapName,
               mapName != initMapName {
            showCorrectView()
        }
    }
    
    func showCorrectView() {
        gameView.removeFromSuperview()
        
        switch PreferencesManager.sharedManager.currentMapName {
        case .snow_map:     self.gameView = ArcticGameView()
        case .england_map:  self.gameView = EnglandGameView()
        case .france_map:   self.gameView = FranceGameView()
        case .none:         self.gameView = ArcticGameView()
        }
        self.initMapName = PreferencesManager.sharedManager.currentMapName ?? .snow_map
        
        view.ui.genericlLayout(object: gameView,
                               parentView: view,
                               topC: 0,
                               bottomC: 0,
                               leadingC: 0,
                               trailingC: 0)
        
        
        gameView.hummerBtn.isHidden = true
        gameView.hummerCountLbl.isHidden = true
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
        
        view.ui.genericlLayout(object: collectionView,
                               parentView: gameView.slotBackImgVw,
                               width: view.h / 3.90,
                               height: view.h / 5.77,
                               centerV: -view.h / 73,
                               centerH: view.h / 116)
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
