//
//  ViewController.swift
//  logIn-iOS
//
//  Created by Cezary Muniak on 23/01/2021.
//  Copyright © 2021 Cezary Muniak. All rights reserved.
//

import UIKit
import KeychainSwift

class MainViewController: UIViewController {
    var keychain: KeychainSwift { return KeychainSwift() }
    
  //  guard let isUserLogged = KeyHolder.isUserLogged.description else { return }
    
    override func viewDidAppear(_ animated: Bool) {
        if keychain.getBool(KeyHolder.isUserLogged.description) ?? false {
            let VC = UIStoryboard(name: "DashboardViewController", bundle: nil).instantiateViewController(withIdentifier:  "DashboardViewController") 
            VC.modalPresentationStyle = .overFullScreen
            self.present(VC, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let VC1 = UIStoryboard(name: "LoginViewController", bundle: nil).instantiateViewController(withIdentifier:  "LoginViewController")
        
        VC1.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(VC1, animated: true)
    }
    
    @IBAction func registrationButtonTapped(_ sender: Any) {
        let VC2 = UIStoryboard(name: "RegistrationViewController", bundle: nil).instantiateViewController(withIdentifier:  "RegistrationViewController")
        VC2.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(VC2, animated: true)
    }
}

