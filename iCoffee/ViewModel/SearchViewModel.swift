//
//  SearchViewModel.swift
//  iCoffee
//
//  Created by Hakan Tekir on 17.12.2022.
//

import Foundation

struct SearchViewModel {
    
    func searchCoffee(value: String, completion: @escaping(Result<[Coffee], SearchError>) -> Void) {
        sharedApiManager.searchCoffee(value: value) { result in
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

enum SearchError: Error {
    case connectionError
    case sqlError
    case valueNotFound
}
