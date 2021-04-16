//
//  User.swift
//  Firebase Aula
//
//  Created by Gilberto Silva on 15/04/21.
//

import Foundation

private extension String {
    static let name = "name"
    static let lastName = "last_name"
    static let email = "email"
}

public class User {
    public let code: String
    public let name: String
    public let lastName: String
    public let email: String
    
    public init(code: String, userDictionary: [String: Any]) {
        self.code = code
        self.name = userDictionary[.name] as? String ?? ""
        self.lastName = userDictionary[.lastName] as? String ?? ""
        self.email = userDictionary[.email] as? String ?? ""
    }
    
    public func toString() -> String {
        "Code: \(self.code), Name: \(self.name), Lastname: \(self.lastName), Email: \(self.email)"
    }
}
