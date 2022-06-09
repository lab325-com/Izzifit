//
//  LevelPopUpController.swift
//  izzifit
//
//  Created by O l e h on 09.06.2022.
//

import UIKit

class LevelPopUpController: BaseController {

    
    let popUp = LevelPopUpView(title: "England")
    
    
    override func loadView() {
        self.view = popUp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
