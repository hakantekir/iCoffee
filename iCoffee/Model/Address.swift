//
//  Address.swift
//  iCoffee
//
//  Created by Hakan Tekir on 13.12.2022.
//

import Foundation

struct Address: Codable, Identifiable {
    var id: Int?
    var country: String?
    var city: String?
    var zip: String?
    var phone: String?
    var billingAddress: String?
    var latitude: Double?
    var longitude: Double?
}

struct AddressWithStatusCode: Decodable {
    var status: AddressStatusCode
    var address: Address?
}

enum AddressStatusCode: Int, Decodable {
    case succes = 0
    case sqlError = 1
}

