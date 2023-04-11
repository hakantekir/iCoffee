//
//  Address.swift
//  iCoffee
//
//  Created by Hakan Tekir on 13.12.2022.
//

import Foundation

struct Address: Codable, Identifiable, Hashable {
    var id: Int?
    var title: String?
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

struct AddressesWithStatusCode: Decodable {
    var status: AddressStatusCode
    var addresses: [Address]?
}

enum AddressStatusCode: Int, Decodable {
    case success = 0
    case sqlError = 1
}

var sampleAddress = Address(title: "Title", country: "Country", city: "City", zip: "34", phone: "532", billingAddress: "billing", latitude: 30, longitude: 30)
