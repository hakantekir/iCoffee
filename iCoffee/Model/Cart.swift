//
//  Cart.swift
//  iCoffee
//
//  Created by Hakan Tekir on 19.12.2022.
//

import Foundation

struct CartDetails: Decodable {
    let status: CartDetailsStatusCode
    let price: Float?
    let address: [Address]?
}

struct CartResponse: Decodable {
    let status: CartStatusCode
}

enum CartDetailsStatusCode: Int, Decodable {
    case success=0
    case sqlError=1
    case addressError = 2
    case emptyCart = 3
}

enum CartStatusCode: Int, Decodable{
    case success = 0
    case sqlError = 1
}

let sampleCartDetails = CartDetails(status: .success, price: 20, address: [sampleAddress])
