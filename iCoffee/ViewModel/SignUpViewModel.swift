//
//  SignUpViewModel.swift
//  iCoffee
//
//  Created by Hakan Tekir on 8.12.2022.
//

import Foundation

struct SignUpViewModel {
    
    func signUp(user: User, completion: @escaping(Result<Void, UserSignUpErrors>) -> Void) {
        sharedApiManager.signUp(user: user) { result in
            switch result{
                
            case .success(let responseUser):
                switch responseUser.status {
                case .success:
                    if let newUser = responseUser.user {
                        var user = user
                        user.id=newUser.id
                        UserDefaults.standard.set(user.id, forKey: "id")
                        completion(.success)
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

private extension Result where Success == Void {
    static var success: Result {
        return .success(())
    }
}
