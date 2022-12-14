//
//  AddressViewModel.swift
//  iCoffee
//
//  Created by Hakan Tekir on 12.12.2022.
//

import Foundation

struct AddressViewModel {
    var locationManager = LocationManager()
    
    func addAddress(address: Address, completion: @escaping (Result<Address?, AddressError>) -> Void) {
        let id = UserDefaults.standard.string(forKey: "id")
        sharedApiManager.addAddress(id: id, address: address) { result in
            print(result)
            switch result {
            case .success(let address):
                switch address.status{
                case .success:
                    completion(.success(nil))
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

enum AddressError: Error {
    case sqlError
    case connectionError
}
