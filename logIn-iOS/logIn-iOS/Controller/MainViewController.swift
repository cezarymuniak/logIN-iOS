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
    let keychain = KeychainSwift()
    
    override func viewDidAppear(_ animated: Bool) {
        if keychain.getBool("isUserLogged") == true {
         //   keychain.get("userLogin")
         //   keychain.get("userPassword")
            let VC = UIStoryboard(name: "DashboardViewController", bundle: nil).instantiateViewController(withIdentifier:  "DashboardViewController") as! DashboardViewController
            VC.modalPresentationStyle = .overFullScreen
            self.present(VC, animated: true, completion: nil)
        } 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let VC1 = UIStoryboard(name: "LoginViewController", bundle: nil).instantiateViewController(withIdentifier:  "LoginViewController") as! LoginViewController
        
        VC1.modalPresentationStyle = .fullScreen
        self.present(VC1, animated: true, completion: nil)
    }
    
    @IBAction func registrationButtonTapped(_ sender: Any) {
        let VC2 = UIStoryboard(name: "RegistrationViewController", bundle: nil).instantiateViewController(withIdentifier:  "RegistrationViewController") as! RegistrationViewController
        
        VC2.modalPresentationStyle = .fullScreen
        self.present(VC2, animated: true, completion: nil)
    }
}

