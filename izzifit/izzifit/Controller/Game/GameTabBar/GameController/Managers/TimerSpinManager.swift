//
//  TimerSpinManager.swift
//  izzifit
//
//  Created by mob325 on 31.05.2022.
//

import UIKit

class TimerSpinManager {
    
    var collectionView: UICollectionView
    weak var delegate: SpinAwardProtocol?
    var combinationManager = CombinationsAwardsManager()
    var counter = OffsetCounter(strideOffset: UIScreen.main.bounds.size.height / 12.799)

    private var timerCounters: [Int]
    private var tableContentOffsets: [CGFloat] = [0,0,0]
    private var timers = [Timer(), Timer(), Timer()]
    
    private lazy var tables: [UITableView] = {
        var tables = [UITableView]()
        tables.append(getTableView(by: 0))
        tables.append(getTableView(by: 1))
        tables.append(getTableView(by: 2))
        return tables
    }()
    
    private lazy var speeds: [CGFloat] = {
        [getSpeed(by: 0),
         getSpeed(by: 1),
         getSpeed(by: 2)]
    }()
    
    var combinationCounter = 0 {
        didSet { speeds = [getSpeed(by: 0),
                           getSpeed(by: 1),
                           getSpeed(by: 2)] }
    }
    
    init(collectionView: UICollectionView,
         delegate: SpinAwardProtocol) {
        self.collectionView = collectionView
        self.delegate = delegate
        timerCounters = [87, 87, 87]
    }
    
    func getTableView(by index: Int) -> UITableView {
        guard let cell = collectionView.cellForItem(at: [0,index]) as? SlotCollectionCell else { return UITableView() }
        return cell.tableView
    }
    
    func convertSpinTypeObjectToInt(_ object: SpinObjectType) -> Int {
        var int: Int
        switch object {
        case .spinObjectTypeCoin:       int = 1
        case .spinObjectTypeManyCoin:   int = 2
        case .spinObjectTypeEnergy:     int = 3
        case .spinObjectTypeManyEnergy: int = 4
        case .spinObjectTypeBuild:      int = 5
        case .__unknown(let rawValue):  int = 1
        }
        return int
    }
    func convertSpinTypes(_ array: [SpinObjectType]) -> [Int] {
        var spinTags = [Int]()
        for type in array {
            let tag = convertSpinTypeObjectToInt(type)
            spinTags.append(tag)
        }
        return spinTags
    }
    
    func getSpeed(by index: Int) -> CGFloat {
        guard counter.combinations.count > combinationCounter else { return 0.0 }
        let spinTag = convertSpinTypeObjectToInt(counter.combinations[combinationCounter].spinObjectIds[index])
        return counter.spiningStride(to: spinTag,
                                     from: index,
                                     currentArray: counter.arrays[index])
    }
    
    func spinner(by index: Int, completion: @escaping () -> ()) {
        timerCounters[index] -= 1
        var multiplier: CGFloat = 0
        
        switch timerCounters[index]{
        case 86: tableContentOffsets[index] = tables[index].contentOffset.y
            multiplier =           StrideConstants.firstStride
        case 84,85: multiplier =   StrideConstants.firstStride
        case 81...83: multiplier = StrideConstants.secondStride
        case 78...80: multiplier = StrideConstants.thirdStride
        case 75...77: multiplier = StrideConstants.fourthStride
        case 72...74: multiplier = StrideConstants.fifthStride
        case 69...71: multiplier = StrideConstants.sixthStride
        case 66...68: multiplier = StrideConstants.seventhStride
        case 63...65: multiplier = StrideConstants.eighthStride
        case 60...62: multiplier = StrideConstants.ninethStride
        case 59: multiplier =      StrideConstants.tenthStride
        case 30 : multiplier =     StrideConstants.tenthStride
        case 27...29: multiplier = StrideConstants.ninethStride
        case 24...26: multiplier = StrideConstants.eighthStride
        case 21...23: multiplier = StrideConstants.seventhStride
        case 18...20: multiplier = StrideConstants.sixthStride
        case 15...17: multiplier = StrideConstants.fifthStride
        case 12...14: multiplier = StrideConstants.fourthStride
        case 9...11: multiplier =  StrideConstants.thirdStride
        case 6...8: multiplier =   StrideConstants.secondStride //6
        case 3...5: multiplier =   StrideConstants.firstStride  //3
        default: multiplier =      speeds[index]
        }
        
        tableContentOffsets[index] -= multiplier
        UIView.animate(withDuration: 0.03,
                       delay: 0.0,
                       options: .curveEaseIn) {
            self.tables[index].contentOffset.y = self.tableContentOffsets[index]
            self.tables[index].layoutIfNeeded()
        } completion: { bool in
            guard self.timerCounters[index] == 3 || self.timerCounters[index] == 87 else { return }
            let cells = self.tables[index].visibleCells
            if let indexPath = self.tables[index].indexPath(for: cells[1]) {
                self.tables[index].scrollToRow(at: indexPath, at: .middle, animated: true)
            }
        }
        guard timerCounters[index] == 3 else { return }
        timerCounters[index] = 87
        self.timers[index].invalidate()
        completion()
    }
    
    func generalSpin(resultLbl: UILabel,
                     resultStackView: UIStackView,
                     coinsLbl: UILabel,
                     energyCountLbl: UILabel,
                     spinBtn: UIButton,
                     showProgress: () -> (),
                     spinsRunOut: () -> (),
                     presentPaywall: () -> ()) {
        
        guard counter.combinations.count != combinationCounter else { spinsRunOut()
            return }
    
        guard KeychainService.standard.me?.energy ?? 0.0 > 0.99 else { presentPaywall()
            return }
        
        resultLbl.text = ""
        resultStackView.isHidden = true
        AudioManager.sharedManager.playSound(type: .spinTap_10)
        AnalyticsHelper.sendFirebaseEvents(events: .spin_tap)
        combinationManager.spinAction(coinsLbl: coinsLbl,
                                      energyLbl: energyCountLbl,
                                      resultLbl: resultLbl,
                                      collectionView: collectionView,
                                      spinBtn: spinBtn) {
            showProgress()
            timers[0] = Timer.scheduledTimer(timeInterval: 0.03,
                                             target: self,
                                             selector: #selector(xSpin),
                                             userInfo: nil,
                                             repeats: true)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.timers[1] = Timer.scheduledTimer(timeInterval: 0.03,
                                                      target: self,
                                                      selector: #selector(self.x2Spin),
                                                      userInfo: nil,
                                                      repeats: true)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.timers[2] = Timer.scheduledTimer(timeInterval: 0.03,
                                                      target: self,
                                                      selector: #selector(self.x3Spin),
                                                      userInfo: nil,
                                                      repeats: true)
            }
        }
    }
    
    @objc func xSpin() { spinner(by: 0) {} }
    @objc func x2Spin() { spinner(by: 1) {} }
    @objc func x3Spin() {
        spinner(by: 2) { [self] in
            guard combinationCounter < counter.combinations.count else { return }
            GameNetworkLayer.shared.getSpin(spinId: counter.combinations[combinationCounter].id,
                                            view: delegate!)
        }
    }
}
