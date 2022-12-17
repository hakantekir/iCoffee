//
//  CartViewModel.swift
//  iCoffee
//
//  Created by Hakan Tekir on 17.12.2022.
//

import Foundation

struct CartViewModel {
    
    func getCart(completion: @escaping(Result<[Coffee], CartError>) -> Void) {
        let id = UserDefaults.standard.string(forKey: "id")
        sharedApiManager.getCart(id: id) { result in
            switch result {
            case .success(let coffees):
                if coffees.status == .success{
                    guard let coffees = coffees.coffees else {
                        print("Value Not Found")
                        completion(.failure(.valueNotFound))
                        return
                    }
                    completion(.success(coffees))
                } else {
                    print("SQL Error")
                    completion(.failure(.sqlError))
                }
            case .failure(let error):
                switch error {
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

enum CartError: Error {
    case connectionError
    case sqlError
    case valueNotFound
}
