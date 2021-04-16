//
//  ViewController.swift
//  Firebase Aula
//
//  Created by Gilberto Silva on 14/04/21.
//

import UIKit
private extension String {
    static let successTitle = "Sucesso"
    static let errorTitle = "Erro"
    static let alertActionTitle = "Ok"
}

class ViewController: UIViewController {
    typealias  AuthLogin = (email: String, password: String)
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let userAuthenticationService = UserAuthenticationService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonClick(_ sender: UIButton) {
        if let authLogin = validateFieldsFilled() {
            userAuthenticationService.signIn(email: authLogin.email, password: authLogin.password)
            { [weak self] (userAuthentication, errorMessage) in
                guard let self = self else { return }
                self.showSiginMessage(userAuthentication: userAuthentication, errorMessage: errorMessage)
            }
        }
    }
    
    @IBAction func createUserButtonClick(_ sender: UIButton) {
        if let authLogin = validateFieldsFilled() {
            userAuthenticationService.createUserAuthentication(email: authLogin.email, password: authLogin.password)
            { [weak self] (userAuthentication, errorMessage) in
                guard let self = self else { return }
                self.showCreateUserMessage(userAuthentication: userAuthentication, errorMessage: errorMessage)
            }
        }
    }
    @IBAction func signOutButtonClick(_ sender: UIButton) {
        userAuthenticationService.signOut()
    }
    
    private func validateFieldsFilled() -> AuthLogin? {
        guard
            let email = self.emailTextField.text,
            let password = self.passwordTextField.text
        else {
            self.showMessage(title: "Campos obrigatórios", message: "Preencha todos os campos!")
            return nil
        }
        return (email: email, password: password)
    }
    
    private func showSiginMessage(userAuthentication: UserAuthentication?,errorMessage: String?) {
        if userAuthentication != nil {
            showMessage(title: .successTitle, message: "Usuário logado com sucesso!")
        } else if let errorMessage = errorMessage {
            showMessage(title: .errorTitle, message: errorMessage)
        }
    }
    
    private func showCreateUserMessage(userAuthentication: UserAuthentication?,errorMessage: String?) {
        if let userAuthentication = userAuthentication {
            showMessage(title: .successTitle, message: "Usuário \(userAuthentication.email) criado com sucesso!")
        } else if let errorMessage = errorMessage {
            showMessage(title: .errorTitle, message: errorMessage)
        }
    }
    
    private func showMessage(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: .alertActionTitle, style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
