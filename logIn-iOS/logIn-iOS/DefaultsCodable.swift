//
//  DefaultsCodable.swift
//  logIn-iOS
//
//  Created by Cezary Muniak on 31/01/2021.
//  Copyright © 2021 Cezary Muniak. All rights reserved.
//



import Foundation

public protocol DefaultsCodable: Codable {
    static var defaultsKey: String { get }
}

extension DefaultsCodable {
    public func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: Self.defaultsKey)
        }
    }
    
    static func saveArray(_ array: [Self]) {
        if let data = try? PropertyListEncoder().encode(array) {
            UserDefaults.standard.set(data, forKey: Self.defaultsKey)
        }
    }
    
    public static func read<T>() -> T? where T: DefaultsCodable {
        let defaults = UserDefaults.standard
        if let data = defaults.object(forKey: T.defaultsKey) as? Data {
            let decoder = JSONDecoder()
            if let model = try? decoder.decode(T.self, from: data) {
                return model
            }
        }
        
        return nil
    }
    
    static func readArray<T>() -> [T] where T: DefaultsCodable {
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: T.defaultsKey), let array = try? PropertyListDecoder().decode([T].self, from: data) {
            return array
        }
        
        return []
    }
}
