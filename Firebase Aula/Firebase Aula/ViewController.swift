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
        createNewUser()
    }
    
    private func createNewUser(){
        let usersChild = firebaseDatabase.child("users")
        let userNew = usersChild.child("005")
        userNew.child("name").setValue("José")
        userNew.child("last_name").setValue("Moreira")
        userNew.child("email").setValue("jose@gmail.com")
    }
    
}

