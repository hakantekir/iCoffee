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
    
    func addAddress(id: String?, address: Address, completion: @escaping(Result<AddressWithStatusCode, APIErrors>) -> Void) {
        let urlString = baseUrl + "/address/" + id!
        guard let url = URL(string: urlString) else {
            completion(.failure(.badUrl))
            return
        }
        let jsonData = try? JSONEncoder().encode(address)
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
            
            guard let responseJson = try? JSONDecoder().decode(AddressWithStatusCode.self, from: data) else {
                completion(.failure(.dataParseError))
                return
            }
            completion(.success(responseJson))
        }.resume()
    }
    
    func getAddress(id: String?, completion: @escaping(Result<AddressesWithStatusCode, APIErrors>) -> Void){
        let urlString = baseUrl + "/address/" + id!
        guard let url = URL(string: urlString) else {
            completion(.failure(.badUrl))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: request) { data ,response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            guard let responseJson = try? JSONDecoder().decode(AddressesWithStatusCode.self, from: data) else {
                completion(.failure(.dataParseError))
                return
            }
            completion(.success(responseJson))
        }.resume()
    }
    
    func searchCoffee(value: String?, completion: @escaping(Result<CoffeesWithStatusCode, APIErrors>) -> Void) {
        let urlString = baseUrl + "/coffee/?search=" + value!
        guard let url = URL(string: urlString) else {
            completion(.failure(.badUrl))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let responseJson = try? JSONDecoder().decode(CoffeesWithStatusCode.self, from: data) else {
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
