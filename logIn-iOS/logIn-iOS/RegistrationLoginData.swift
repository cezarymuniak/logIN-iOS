//
//  RegistrationLoginData.swift
//  logIn-iOS
//
//  Created by Cezary Muniak on 31/01/2021.
//  Copyright © 2021 Cezary Muniak. All rights reserved.
//

import Foundation
import CoreLocation


struct RegistrationLoginData: DefaultsCodable {
    static var defaultsKey = "RegistrationLoginData"
    
    static var shared = RegistrationLoginData()
    
    var isUserExist: Bool?
    var shouldSaveUserLogin: String
    var shouldSaveUserPassword: String
    
    init(isUserExist: Bool = true, shouldSaveUserLogin: String = "", shouldSaveUserPassword: String = "" ) {
        self.isUserExist = isUserExist
        self.shouldSaveUserLogin = shouldSaveUserLogin
        self.shouldSaveUserPassword = shouldSaveUserPassword
    }
    
    static func getRegistrationLoginData() -> RegistrationLoginData? {
        guard let content: RegistrationLoginData = RegistrationLoginData.read() else {
            return nil
        }
        return content
    }   
}
