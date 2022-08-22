//
//  EncourageAnimView.swift
//  izzifit
//
//  Created by O l e h on 18.08.2022.
//

import UIKit
import Lottie

struct EncourageObject {
    let name: String
    let topC: CGFloat
    let width: CGFloat
    let height: CGFloat
    let header: String
    let centerH: CGFloat
}

class EncourageAnimView: UIView {
    
    var stringHeaders = [ "I`m so proud of you!",
                          "Great! Keep spinning",
                         "Nice, you`re hard player",
                         "There you go!",
                         "Keep it up.",
                         "Good job",
                         "Go for it",
                         "You`re doing awesome!",
                         "You can do it"]
    
    var encourageObjects = [EncourageObject(name: "0encourage", topC: 32, width: 300, height: 300, header: "I`m so proud of you!", centerH: 0),
                            EncourageObject(name: "1encourage", topC: 78, width: 200, height: 200, header: "Good job!", centerH: 0),
//                            EncourageObject(name: "2encourage", topC: 40, width: 250, height: 250, header: "Nice, you`re hard player", centerH: 0),
                            EncourageObject(name: "3encourage", topC: 20, width: 200, height: 200, header: "There you go!", centerH: 8),
                            EncourageObject(name: "4encourage", topC: 90, width: 140, height: 140, header: "Keep it up!", centerH: 0),
                            EncourageObject(name: "5encourage", topC: 60, width: 250, height: 250, header: "Great! Keep spinning!", centerH: 2),
                            EncourageObject(name: "6encourage", topC: 40, width: 240, height: 240, header: "Go for it!", centerH: 10),
                            EncourageObject(name: "7encourage", topC: 50, width: 250, height: 250, header: "You`re doing awesome!", centerH: -5),
                            EncourageObject(name: "8encourage", topC: 20, width: 300, height: 300, header: "Nice, you`re hard player", centerH: 0)]
    
    var mainImgVw = UIImageView()
    var headerLabel = UILabel()
    
    var anim: AnimationView!
    var animNumber: Int
    var animObject: EncourageObject!
    var closeBtn = UIButton()
    var okBtn = UIButton()
    var confettiAnim = AnimationView(name: "confettiEncourage")
    
    static var counter = 0
    
    init() {
        animNumber = EncourageAnimView.counter  //     Int(arc4random_uniform(8))
        animObject = encourageObjects[animNumber]
        anim = AnimationView(name: animObject.name)
        
        super.init(frame: .zero)
        
        guard EncourageAnimView.counter < 7 else { return }
        
        EncourageAnimView.counter += 1
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func draw(_ rect: CGRect) {
        setUI()
        layout()
    }

    func setUI() {
        
        layer.backgroundColor = UIColor(rgb: 0x3F3E56, alpha: 0.3).cgColor
        
        mainImgVw.image = RImage.encourageMainImgVw() ?? UIImage()
        mainImgVw.contentMode = .scaleAspectFill
        
        closeBtn.setImage(image(img: .backBtn), for: .normal)
        okBtn.setImage(RImage.encourageOkBtn() ?? UIImage(), for: .normal)
        ui.setLabel(label: headerLabel,
                    labelText: animObject.header,
                    textColor: UIColor(rgb: 0x6A534C),
                    textAlignment: .center,
                    fontSize: 20,
                    fontName: "Inter-Bold",
                    lines: 0)
        
        anim.contentMode = .scaleAspectFill
        anim.loopMode = .loop
        anim.play()
        confettiAnim.contentMode = .scaleAspectFill
        confettiAnim.loopMode = .loop
        confettiAnim.play()
    }
    
    func layout() {
        
        ui.genericlLayout(object: mainImgVw,
                          parentView: self,
                          width: 297,
                          height: 324,
                          topC: hRatio(cH:198),
                          centerH: 0)
        
        ui.genericlLayout(object: confettiAnim,
                          parentView: mainImgVw,
                          topC: 0,
                          bottomC: 0,
                          leadingC: 0,
                          trailingC: 0)
        
        ui.genericlLayout(object: anim,
                          parentView: mainImgVw,
                          width: animObject.width,
                          height: animObject.height,
                          topC: animObject.topC,
                          centerH: animObject.centerH)
        
        ui.genericlLayout(object: headerLabel,
                          parentView: mainImgVw,
                          width: 150,
                          topC: 34,
                          centerH: 0)
        
        ui.genericlLayout(object: closeBtn,
                          parentView: self,
                          width: 40,
                          height: 40,
                          topToO: mainImgVw.topAnchor,
                          topCG: -10,
                          trailingToO: mainImgVw.trailingAnchor,
                          trailingCG: -10)
        
        ui.genericlLayout(object: okBtn,
                          parentView: self,
                          width: 100,
                          height: 32,
                          centerH: 0,
                          bottomToO: mainImgVw.bottomAnchor,
                          bottomCG: 30)
    }
}
