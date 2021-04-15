//
//  UserService.swift
//  Firebase Aula
//
//  Created by Gilberto Silva on 15/04/21.
//

import Foundation
import Firebase

public class UserService {
    let firebaseDatabase = Database.database().reference()
    let usersReference: DatabaseReference
    
    public init(){
        self.usersReference = firebaseDatabase.child("users")
    }
    
    public func getUsers(completion: @escaping ([User]) -> Void) {
        usersReference.observe(.value) { (dataSnapshot) in
            let userDataReponse = UserDataResponse(dataSnapshot: dataSnapshot)
            completion(userDataReponse.users)
        }
    }
    
    public func createNewUser(usersChild: DatabaseReference){
        let userNew = usersReference.child("005")
        userNew.child("name").setValue("José")
        userNew.child("last_name").setValue("Moreira")
        userNew.child("email").setValue("jose@gmail.com")
    }
    
}
