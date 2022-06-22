
import UIKit

class EnergyStepsCell: UITableViewCell {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "Steps"
        }
    }
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var stepsCollectionView: UICollectionView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    private var lineLayer: CAShapeLayer = {
        let lineLayer = CAShapeLayer()
        lineLayer.lineWidth = 1
        lineLayer.lineDashPattern = [6, 4]
        lineLayer.strokeColor = UIColor(named: Clrs.pinkTarget.rawValue)?.cgColor
        return lineLayer
    }()
    
    private var steps = [CurrentStepsModel]()
    
    static let id = "EnergyStepsCell"

    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        backView.clipsToBounds = true
        backView.layer.cornerRadius = 20
        stepsCollectionView.showsVerticalScrollIndicator = false
        stepsCollectionView.backgroundColor = .clear
        stepsCollectionView.dataSource = self
        stepsCollectionView.delegate = self
        stepsCollectionView.register(UINib(nibName: "EnergyStepsCollectionCell", bundle: nil), forCellWithReuseIdentifier: EnergyStepsCollectionCell.id)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(model: [CurrentStepsModel]) {
        steps = model
        
        let targetInt = calculateMeasureY(value: KeychainService.standard.me?.gender == .genderTypeMan ? 950.0 : 650.0)
        
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: targetInt),
                                CGPoint(x: CGFloat(31 * 41), y: targetInt)])
        lineLayer.path = path
        stepsCollectionView.layer.addSublayer(lineLayer)
        
        targetLabel.text = RLocalization.profile_target()
        targetLabel.topAnchor.constraint(equalTo: stepsCollectionView.topAnchor,
                                         constant: targetInt - 13).isActive = true
    }
    
    func calculateMeasureY(value: CGFloat,
                           upper: CGFloat = 1200,
                           lower: CGFloat = 0) -> CGFloat {
        switch value {
        case let x where x > upper: return 0.0
        case let x where x < lower: return 89.0
        default: break
        }
        let neededValue = value - lower
        let measureDistance = upper - lower
        let measureRatio = measureDistance / 89.0
        let pointY = neededValue / measureRatio.rounded(toPlaces: 1)
        let residualValue = 89.0 - pointY.rounded(toPlaces: 1)
        return residualValue
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDataSource
//----------------------------------------------

extension EnergyStepsCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        steps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EnergyStepsCollectionCell.id, for: indexPath) as! EnergyStepsCollectionCell
        cell.fillCellBy(steps[indexPath.row])
        return cell
    }
}
