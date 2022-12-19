//
//  Cart.swift
//  iCoffee
//
//  Created by Hakan Tekir on 19.12.2022.
//

import Foundation

struct CartResponse: Decodable {
    let status: CartStatusCode
}

enum CartStatusCode: Int, Decodable{
    case success = 0
    case sqlError = 1
}
