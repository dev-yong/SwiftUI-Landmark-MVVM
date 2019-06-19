//
//  UserDefault.swift
//  SwiftUIExample
//
//  Created by United Merchant Services.inc on 6/13/19.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefault<Value: Codable> {
    let key: String
    let `default`: Value
    
    var value: Value {
        get {
            guard let data = UserDefaults.standard.data(forKey: key) else {
                return `default`
            }
            do {
                return try JSONDecoder().decode(Value.self, from: data)
            } catch {
                fatalError(error.localizedDescription)
            }
        }
        set {
            do {
                let data = try JSONEncoder().encode(newValue)
                UserDefaults.standard.set(data, forKey: key)
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
}
