//
//  ViewController.swift
//  Firebase Aula
//
//  Created by Gilberto Silva on 14/04/21.
//

import UIKit

class ViewController: UIViewController {
    let userService = UserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userService.getUsers{ users in
            users.forEach{ print($0.toString()) }
        }
    }
    
}
