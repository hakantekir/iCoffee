//
//  SignInViewModel.swift
//  iCoffee
//
//  Created by Hakan Tekir on 4.12.2022.
//

import Foundation

var apiManager = APIManager()

class SignInViewModel {
    
    func signIn(username: String, password: String, completion: @escaping(Result<User,userErrors>) -> Void) {
        apiManager.signIn(username: username, password: password) { result in
            switch result {
            case .success(let user):
                switch user.status {
                case .success:
                    completion(.success(user.user!))
                case .wrongUsername:
                    completion(.failure(.wrongUsername))
                case .wrongPassword:
                    completion(.failure(.wrongPassword))
                }
                
            case .failure(let error):
                switch error {
                case .badUrl:
                    print("Bad URL")
                case .noData:
                    print("No Data")
                case .dataParseError:
                    print("Parse Error")
                }
                completion(.failure(userErrors.connectionError))
            }
        }
    }
}

enum userErrors: Error{
    case wrongUsername
    case wrongPassword
    case connectionError
}
