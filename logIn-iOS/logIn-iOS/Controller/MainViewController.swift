//
//  ViewController.swift
//  logIn-iOS
//
//  Created by Cezary Muniak on 23/01/2021.
//  Copyright © 2021 Cezary Muniak. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let VC = UIStoryboard(name: "LoginViewController", bundle: nil).instantiateViewController(withIdentifier:  "LoginViewController") as! LoginViewController
        
        self.modalPresentationStyle = .fullScreen
        self.present(VC, animated: true, completion: nil)
    }
    
    @IBAction func registrationButtonTapped(_ sender: Any) {
        
        let VC = UIStoryboard(name: "RegistrationViewController", bundle: nil).instantiateViewController(withIdentifier:  "RegistrationViewController") as! RegistrationViewController
        
        self.modalPresentationStyle = .fullScreen
        self.present(VC, animated: true, completion: nil)
    }
}

