//
//  CoffeeViewModel.swift
//  iCoffee
//
//  Created by Hakan Tekir on 19.12.2022.
//

import Foundation

struct CoffeeViewModel {
    
    func addCart(coffeId: Int, completion: @escaping(Result<CartResponse, AddCartError>) -> Void) {
        let userId = UserDefaults.standard.string(forKey: "id")
        sharedApiManager.addCart(userId: userId, coffeeId: coffeId) { result in
            switch result {
            case .success(let statusCode):
                switch statusCode.status {
                case .success:
                    completion(.success(statusCode))
                case .sqlError:
                    completion(.failure(.sqlError))
                }
            case .failure(let error):
                switch error{
                case .badUrl:
                    print("Bad Url")
                case .noData:
                    print("No Data")
                case .dataParseError:
                    print("Parse Error")
                }
                completion(.failure(.connectionError))
            }
        }
    }
    
    func updateCart(coffeId: Int, quantity: Int, completion: @escaping(Result<CartResponse, AddCartError>) -> Void) {
        guard let userId = UserDefaults.standard.string(forKey: "id") else {
            return
        }
        sharedApiManager.updateCart(userId: userId, coffeeId: coffeId, quantity: quantity) { result in
            switch result {
            case .success(let statusCode):
                switch statusCode.status {
                case .success:
                    completion(.success(statusCode))
                case .sqlError:
                    completion(.failure(.sqlError))
                }
            case .failure(let error):
                switch error{
                case .badUrl:
                    print("Bad Url")
                case .noData:
                    print("No Data")
                case .dataParseError:
                    print("Parse Error")
                }
                completion(.failure(.connectionError))
            }
        }
    }
    
    func deleteCart(coffeId: Int, completion: @escaping(Result<CartResponse, AddCartError>) -> Void) {
        guard let userId = UserDefaults.standard.string(forKey: "id") else {
            return
        }
        sharedApiManager.deleteCart(userId: userId, coffeeId: coffeId) { result in
            switch result {
            case .success(let statusCode):
                switch statusCode.status {
                case .success:
                    completion(.success(statusCode))
                case .sqlError:
                    completion(.failure(.sqlError))
                }
            case .failure(let error):
                switch error{
                case .badUrl:
                    print("Bad Url")
                case .noData:
                    print("No Data")
                case .dataParseError:
                    print("Parse Error")
                }
                completion(.failure(.connectionError))
            }
        }
    }
}

enum AddCartError: Error {
    case sqlError
    case connectionError
}
