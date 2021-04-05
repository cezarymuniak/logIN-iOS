//
//  KeyHolder.swift
//  logIn-iOS
//
//  Created by CM on 05/04/2021.
//  Copyright © 2021 Cezary Muniak. All rights reserved.
//

enum KeyHolder: CustomStringConvertible {

    case isUserLogged
    case userLogin
    case userPassword
    
    var description: String   {
        get {
            switch self {
            case .isUserLogged:
                return "isUserLogged"
            case .userLogin:
                return "userLogin"
            case .userPassword:
                return "userPassword"
            }
        }
    }
}
