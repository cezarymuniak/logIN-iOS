//
//  DashboardViewController.swift
//  logIn-iOS
//
//  Created by CM on 07/02/2021.
//  Copyright © 2021 Cezary Muniak. All rights reserved.
//

import Foundation
import UIKit

class DashboardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBOutlet weak var logoutButton: UIButton!
    @IBAction func logoutButtonTaped(_ sender: Any) {
        RegistrationLoginData.shared.isUserExist = false
        let VC = UIStoryboard(name: "MainViewController", bundle: nil).instantiateViewController(withIdentifier:  "MainViewController") as! MainViewController
        
        self.modalPresentationStyle = .fullScreen
        self.present(VC, animated: true, completion: nil)
        
    }
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func segmentedControllTapped(_ sender: Any) {
        
      
 
    switch segmentedControl.selectedSegmentIndex
      {
      case 0:
          print("First Segment Selected" )
      case 1:
        print( "Second Segment Selected" )
    case 2:
        print( "Second Segment Selected" )
        logoutButton.isHidden = false

        
       
      default:
          break
      }
    
    
    }
    
}
