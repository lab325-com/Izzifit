//
//  SpinGameViewProtocol.swift
//  izzifit
//
//  Created by O l e h on 27.07.2022.
//

import Foundation
import UIKit


protocol SpinGameViewProtocol: UIView, GameAnimationProtocol {
    var hummerBtn: UIButton { get set }
    var hummerCountLbl: UILabel { get set }
    var spinBtn: UIButton { get set }
    var slotBackImgVw: UIImageView { get set}
    var resultStackView: UIStackView! { get set }
}
