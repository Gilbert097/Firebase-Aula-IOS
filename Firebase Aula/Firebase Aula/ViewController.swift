//
//  ViewController.swift
//  Firebase Aula
//
//  Created by Gilberto Silva on 14/04/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    let firebaseDatabase = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let usersChild = firebaseDatabase.child("users")
        //createNewUser()
        getUsers(usersChild: usersChild)
    }
    
    private func getUsers(usersChild: DatabaseReference){
        usersChild.observe(.value) { (dataSnapshot) in
            let userDataReponse = UserDataResponse(dataSnapshot: dataSnapshot)
            userDataReponse.users.forEach{ print($0.toString()) }
            print("Sucesso!")
        }
    }
    
    private func createNewUser(usersChild: DatabaseReference){
        let userNew = usersChild.child("005")
        userNew.child("name").setValue("José")
        userNew.child("last_name").setValue("Moreira")
        userNew.child("email").setValue("jose@gmail.com")
    }
    
}

