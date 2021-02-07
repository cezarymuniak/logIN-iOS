//
//  TopBar.swift
//  logIn-iOS
//
//  Created by CM on 07/02/2021.
//  Copyright © 2021 Cezary Muniak. All rights reserved.
//

import Foundation
import UIKit

class TopBar: UIView {

    
    @IBOutlet weak var customTopBar: UIView!
    
    @IBOutlet weak var defaultBackButton: UIButton!
    
    @IBAction func customBackButtonTapped(_ sender: Any) {
        self.customTopBar.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    


    override func awakeFromNib() {
        Bundle.main.loadNibNamed("TopBar", owner: self, options: nil)
        addSubview(customTopBar)
    }
}
