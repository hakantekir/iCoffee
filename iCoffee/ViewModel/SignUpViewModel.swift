//
//  SignUpViewModel.swift
//  iCoffee
//
//  Created by Hakan Tekir on 8.12.2022.
//

import Foundation


struct SignUpViewModel {
    
    func signUp(user: User, completion: @escaping(Result<User, UserSignUpErrors>) -> Void) {
        sharedApiManager.signUp(user: user) { result in
            switch result{
                
            case .success(let responseUser):
                switch responseUser.status {
                case .success:
                    if var newUser = responseUser.user {
                        newUser=user
                        print(newUser.id)
                        completion(.success(user))
                    }
                case .usernameAlreadyTaken:
                    completion(.failure(.usernameAlreadyTaken))
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
                completion(.failure(UserSignUpErrors.connectionError))
            }
        }
    }
}

enum UserSignUpErrors: Error {
    case usernameAlreadyTaken
    case connectionError
}