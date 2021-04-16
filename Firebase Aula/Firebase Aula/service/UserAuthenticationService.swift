//
//  UserAuthenticationService.swift
//  Firebase Aula
//
//  Created by Gilberto Silva on 15/04/21.
//

import Foundation
import Firebase

private extension String {
    static let operationNotAllowed = "Administrador desabilitou o logon com o provedor de identidade especificado."
    static let emailAlreadyInUse = "E-mail usado para tentar uma inscrição já está em uso."
    static let invalidEmail = "E-mail é inválido."
    static let weakPassword = "Senha considerada muito fraca."
    static let createUserError = "Erro ao tentar criar usuário."
}

public class UserAuthenticationService {
    
    public func createUserAuthentication(
        email: String,
        password: String,
        completion: @escaping (UserAuthentication?, String?) -> Void
    ){
        Auth.auth().createUser(withEmail: email, password: password) {
           [weak self] (authDataResult: AuthDataResult?, error: Error?) in
            guard let self = self else { return }
            if let authDataResult = authDataResult {
                self.notifyAuthenticationSuccess(authDataResult: authDataResult, completion: completion)
            } else if  let error = error {
                self.notifyAuthenticationError(error: error, completion: completion)
            }
        }
    }
    
    private func notifyAuthenticationSuccess(
        authDataResult: AuthDataResult,
        completion: @escaping (UserAuthentication?, String?) -> Void
    ) {
        let id = authDataResult.user.uid
        let email = authDataResult.user.email ?? ""
        completion(UserAuthentication(uid: id, email: email), nil)
    }
    
    private func notifyAuthenticationError(
        error: Error,
        completion: @escaping (UserAuthentication?, String?) -> Void
    ){
        guard
            let errorParse = error as NSError?
        else {
            completion(nil, .createUserError)
            return
        }
        let errorMessage = self.getAuthenticationErrorMessage(error: errorParse)
        completion(nil, errorMessage)
    }
    
    private func getAuthenticationErrorMessage(error: NSError) -> String
    {
        switch AuthErrorCode(rawValue: error.code) {
        case .operationNotAllowed:
            return .operationNotAllowed
        case .emailAlreadyInUse:
            return .emailAlreadyInUse
        case .invalidEmail:
            return .invalidEmail
        case .weakPassword:
            return .weakPassword
        default:
            return "Error: \(error.localizedDescription)"
        }
    }
    
}
