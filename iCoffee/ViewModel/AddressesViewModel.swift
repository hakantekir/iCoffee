//
//  AddressesViewModel.swift
//  iCoffee
//
//  Created by Hakan Tekir on 14.12.2022.
//

import Foundation

struct AddressesViewModel {
    
    func getAddresses(id: String?, completion: @escaping(Result<[Address], AddressesError>) -> Void ) {
        sharedApiManager.getAddress(id: id) { result in
            switch result {
            case .success(let addresses):
                switch addresses.status {
                case .success:
                    if let addresses = addresses.addresses{
                        if addresses.isEmpty {
                            completion(.failure(.emptyArray))
                        } else {
                            completion(.success(addresses))
                        }
                    }
                case .sqlError:
                    completion(.failure(.sqlError))
                }
            case .failure(let error):
                switch error{
                case .badUrl:
                    print("badUrl")
                case .noData:
                    print("noData")
                case .dataParseError:
                    print("parseError")
                }
                completion(.failure(.connectionError))
            }
        }
    }
}

enum AddressesError: Error {
    case sqlError
    case connectionError
    case emptyArray
}
