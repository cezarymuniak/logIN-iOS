//
//  LoginViewController.swift
//  logIn-iOS
//
//  Created by Cezary Muniak on 23/01/2021.
//  Copyright © 2021 Cezary Muniak. All rights reserved.
//

import Foundation
import UIKit
import CryptoKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Logowanie testowe aaaSSS1! ; aaaSSS1
    
    @IBOutlet weak var topBar: TopBar!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func loginButtonTapped(_ sender: Any) {
        var loginPlaceholder = loginTextField.placeholder ?? ""
        var passwordPlaceholder = passwordTextField.placeholder ?? ""
        
        if loginTextField.hasText {
            loginPlaceholder = "login"
            loginTextField.textColor = .black
            loginTextField.attributedPlaceholder = NSAttributedString(string: loginPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        } else {
            loginPlaceholder = "Pole loginu nie może być puste"
            loginTextField.attributedPlaceholder = NSAttributedString(string: loginPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        }
        if passwordTextField.hasText {
            passwordPlaceholder = "hasło"
            passwordTextField.textColor = .black
            passwordTextField.attributedPlaceholder = NSAttributedString(string: loginPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        } else {
            passwordPlaceholder = "Pole hasła nie może być puste"
            passwordTextField.attributedPlaceholder = NSAttributedString(string: passwordPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        }
        
        if   RegistrationLoginData.getRegistrationLoginData()?.shouldSaveUserLogin == loginTextField.text, RegistrationLoginData.getRegistrationLoginData()?.shouldSaveUserPassword ==  String(describing: SHA256.hash(data: (self.passwordTextField.text ?? "").data(using: .utf8)!)) {
//            let refreshAlert = UIAlertController(title: "Logowanie", message: "Użytkownik zalogowany poprawnie", preferredStyle: UIAlertController.Style.alert)
//
//            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
//                print("Logika przycisku OK")
//            }))
//            self.present(refreshAlert, animated: true, completion: nil)
//
            
            let VC = UIStoryboard(name: "DashboardViewController", bundle: nil).instantiateViewController(withIdentifier:  "DashboardViewController") as! DashboardViewController
            
            VC.modalPresentationStyle = .fullScreen
            self.present(VC, animated: true, completion: nil)
            
            
        } else {
            let refreshAlert = UIAlertController(title: "Logowanie", message: "Użytkownik zalogowany niepoprawnie", preferredStyle: UIAlertController.Style.alert)
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                print("Logika przycisku OK")
            }))
            
            self.present(refreshAlert, animated: true, completion: nil)
        }
    }
}

