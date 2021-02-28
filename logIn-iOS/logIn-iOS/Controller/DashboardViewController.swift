//
//  DashboardViewController.swift
//  logIn-iOS
//
//  Created by CM on 07/02/2021.
//  Copyright © 2021 Cezary Muniak. All rights reserved.
//

import Foundation
import UIKit
import KeychainSwift

class DashboardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let keychain = KeychainSwift()
    
    
    @IBOutlet weak var productQuantityLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var homeContainerView: UIView!
    @IBOutlet weak var categoriesContainerView: UIView!
    @IBOutlet weak var settingsContainerView: UIView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBAction func logoutButtonTaped(_ sender: Any) {
        RegistrationLoginData.shared.isUserExist = false
        keychain.set(false, forKey: "isUserLogged")
        let VC = UIStoryboard(name: "MainViewController", bundle: nil).instantiateViewController(withIdentifier:  "MainViewController") as! MainViewController
        
        VC.modalPresentationStyle = .fullScreen
        self.present(VC, animated: true, completion: nil)
        
    }
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func segmentedControllTapped(_ sender: Any) {
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            self.homeContainerView.alpha = 1
            self.categoriesContainerView.alpha = 0
            self.settingsContainerView.alpha = 0
            print("First Segment Selected" )
        case 1:
            self.homeContainerView.alpha = 0
            self.categoriesContainerView.alpha = 1
            self.settingsContainerView.alpha = 0
            print( "Second Segment Selected" )
        case 2:
            self.homeContainerView.alpha = 0
            self.categoriesContainerView.alpha = 0
            self.settingsContainerView.alpha = 1
            print( "Second Segment Selected" )
        default:
            break
        }
    }    
}
