//
//  LevelController.swift
//  izzifit
//
//  Created by O l e h on 14.04.2022.
//

import UIKit

class LevelController: BaseController {

    @IBOutlet weak var scrollView: UIScrollView!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let x = (439 - UIScreen.main.bounds.size.width) / 2
        self.scrollView.setContentOffset(CGPoint(x: x,
                                            y: 0),
                                    animated: true)
    }
    
    
}
