//
//  OrderViewModel.swift
//  iCoffee
//
//  Created by Hakan Tekir on 23.12.2022.
//

import Foundation

struct OrderViewModel {
    
    func createOrder(address: Address?, completion: @escaping(Result<CartResponse, OrderError>) -> Void){
        guard let userId = UserDefaults.standard.string(forKey: "id") else {
            return
        }
        guard let addressId = address?.id else {
            return
        }
        sharedApiManager.createOrder(userId: userId, addressId: addressId) { result in
            switch result {
            case .success(let success):
                switch success.status {
                case .success:
                    completion(.success(success))
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


enum OrderError: Error {
    case sqlError
    case connectionError
}
