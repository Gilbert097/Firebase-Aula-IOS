//
//  DataResponse.swift
//  Firebase Aula
//
//  Created by Gilberto Silva on 15/04/21.
//

import Foundation
import Firebase

public class UserDataResponse {
    public let users: [User]
    
    public init(dataSnapshot: DataSnapshot){
        guard
            let value = dataSnapshot.value as? [String: Any]
        else {
            self.users = []
            return
        }
        
        self.users = value.map({ (item) -> User in
            let (key, value) = item
            return User(code: key, userDictionary: value as? [String: Any] ?? [:])
        })
        
    }
    
}
