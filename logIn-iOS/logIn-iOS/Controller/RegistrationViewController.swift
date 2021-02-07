//
//  RegistrationViewController.swift
//  logIn-iOS
//
//  Created by Cezary Muniak on 23/01/2021.
//  Copyright © 2021 Cezary Muniak. All rights reserved.
//

import Foundation
import UIKit
import CryptoKit


class RegistrationViewController: UIViewController {

    let password = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*?[A-Z])(?=.*[A-Z]).{5,}$")
    let login = NSPredicate(format: "SELF MATCHES %@ ", "^.{5,}$")
    override func viewDidLoad() {
        super.viewDidLoad()
        hidePasswordButton.layer.cornerRadius = 5
        hidePasswordButton.layer.borderWidth = 1
        hidePasswordButton.layer.borderColor = UIColor.black.cgColor
        self.passwordTextField.isSecureTextEntry = true
        self.repeatPasswordTextField.isSecureTextEntry = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "Info", message: "Login powinien mieć przynajmniej 5 znaków, hasło powinno mieć jedną wielką literę i jedną cyfrę oraz hasło i powtórzenie muszą być takie same. ", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        self.passwordTextField.textContentType = .oneTimeCode
        self.repeatPasswordTextField.textContentType = .oneTimeCode
    }
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var hidePasswordButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBAction func hidePasswordButtonTapped(_ sender: Any) {
        if  self.passwordTextField.isSecureTextEntry == true {
            self.passwordTextField.isSecureTextEntry = false
            self.repeatPasswordTextField.isSecureTextEntry = false
        } else {
            self.passwordTextField.isSecureTextEntry = true
            self.repeatPasswordTextField.isSecureTextEntry = true
        }
    }
    @IBAction func registrationButtonTapped(_ sender: Any) {
        if repeatPasswordTextField.text == passwordTextField.text, password.evaluate(with: repeatPasswordTextField.text), login.evaluate(with: repeatPasswordTextField.text) {
            
            let passwordValue = String(describing: SHA256.hash(data: (self.passwordTextField.text ?? "").data(using: .utf8)!))
            
            RegistrationLoginData.shared.shouldSaveUserLogin = self.loginTextField.text ?? ""
            RegistrationLoginData.shared.shouldSaveUserPassword = passwordValue
            RegistrationLoginData.shared.save()
            
            let registrationAlert = UIAlertController(title: "Użytkownik zarejestrowany", message: "Rejestracja zakończona powodzeniem", preferredStyle: UIAlertController.Style.alert)
            
            registrationAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                print("Logika przycisku OK")
            }))
            
            self.present(registrationAlert, animated: true, completion: nil)
            
        } else {
            let registrationFailedAlert = UIAlertController(title: "Użytkownik niezarejestrowany", message: "Rejestracja zakończona niepowodzeniem", preferredStyle: UIAlertController.Style.alert)
            registrationFailedAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                print("Logika przycisku OK")
            }))
            
            self.present(registrationFailedAlert, animated: true, completion: nil)
        }
    }
}

