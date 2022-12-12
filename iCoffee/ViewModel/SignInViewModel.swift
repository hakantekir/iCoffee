//
//  SignInViewModel.swift
//  iCoffee
//
//  Created by Hakan Tekir on 4.12.2022.
//

import Foundation

struct SignInViewModel {
    
    func signIn(username: String, password: String, completion: @escaping(Result<User, UserSignInErrors>) -> Void) {
        sharedApiManager.signIn(username: username, password: password) { result in
            switch result {
            case .success(let user):
                switch user.status {
                case .success:
                    UserDefaults.standard.set(user.user?.id, forKey: "id")
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
                completion(.failure(UserSignInErrors.connectionError))
            }
        }
    }
}

enum UserSignInErrors: Error{
    case wrongUsername
    case wrongPassword
    case connectionError
}
