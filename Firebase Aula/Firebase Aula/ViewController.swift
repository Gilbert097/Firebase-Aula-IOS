//
//  ViewController.swift
//  Firebase Aula
//
//  Created by Gilberto Silva on 14/04/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let userAuthenticationService = UserAuthenticationService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonClick(_ sender: UIButton) {
    }
    
   
    @IBAction func createUserButtonClick(_ sender: UIButton) {
        guard
            let email = self.emailTextField.text,
            let password = self.passwordTextField.text
        else {
            self.showMessage(title: "Campos obrigatórios", message: "Preencha todos os campos!")
            return
        }
        
        userAuthenticationService.createUserAuthentication(email: email, password: password)
        { [weak self] (userAuthentication, errorMessage) in
            guard let self = self else { return }
            self.showMessageByUserAthenticationReturn(userAuthentication, errorMessage)
        }
    }
    
    private func showMessageByUserAthenticationReturn(_ userAuthentication: UserAuthentication?, _ errorMessage: String?) {
        if let userAuthentication = userAuthentication {
            showMessage(title: "Sucesso", message: "Usuário \(userAuthentication.email) criado com sucesso!")
        } else {
            guard let errorMessage = errorMessage else { return }
            showMessage(title: "Error", message: errorMessage)
        }
    }
    
    private func showMessage(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
