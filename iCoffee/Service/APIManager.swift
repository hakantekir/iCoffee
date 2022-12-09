//
//  APIManager.swift
//  iCoffee
//
//  Created by Hakan Tekir on 4.12.2022.
//

import Foundation

var sharedApiManager = APIManager()

struct APIManager {
    
    let baseUrl = "http://10.125.15.139:8081"
    
    func signIn(username: String, password: String, completion: @escaping(Result<UserWithSignInStatusCode, APIErrors>) -> Void) {
        let urlString = baseUrl + "/signin"
        guard let url = URL(string: urlString) else {
            completion(.failure(.badUrl))
            return
        }
        let json = ["username": username, "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: request) { data ,response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            
            guard let responseJson = try? JSONDecoder().decode(UserWithSignInStatusCode.self, from: data) else {
                completion(.failure(.dataParseError))
                return
            }
            
            completion(.success(responseJson))
            
        }.resume()
    }
    
    func signUp(user: User, completion: @escaping(Result<UserWithSignUpStatusCode, APIErrors>) -> Void){
        let urlString = baseUrl + "/signup"
        guard let url = URL(string: urlString) else {
            completion(.failure(.badUrl))
            return
        }
        let jsonData = try? JSONEncoder().encode(user)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: request) { data ,response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            guard let responseJson = try? JSONDecoder().decode(UserWithSignUpStatusCode.self, from: data) else {
                completion(.failure(.dataParseError))
                return
            }
            completion(.success(responseJson))
        }.resume()
    }
}


enum APIErrors: Error {
    case badUrl
    case noData
    case dataParseError
}
