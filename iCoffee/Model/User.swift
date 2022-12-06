//
//  User.swift
//  iCoffee
//
//  Created by Hakan Tekir on 4.12.2022.
//

import Foundation

struct User: Decodable {
    var id: Int?
    var username: String?
    var password: String?
    var userDetails: UserDetails?
}

struct UserDetails: Decodable {
    var name: String?
    var lastname: String?
    var mail: String?
    var phone: String?
    var addresses: [Address]?
}

struct Address: Decodable {
    var name: String?
    var lastname: String?
    var country: String?
    var city: String?
    var zip: String?
    var billingAddress: String?
    var latitude: String?
    var longitude: String?
}

struct UserWithStatusCode: Decodable {
    var status: StatusCode
    var user: User?
}

enum StatusCode: Int, Decodable {
    case success = 0
    case wrongUsername = 1
    case wrongPassword = 2
}

var sampleUser = User(id: 1, username: "user", password: "pass", userDetails: UserDetails(name: "name", lastname: "last", mail: "mail", phone: "532"))
