//
//  User.swift
//  iCoffee
//
//  Created by Hakan Tekir on 4.12.2022.
//

import Foundation

struct User: Codable {
    var id: Int?
    var username: String?
    var password: String?
    var userDetails: UserDetails?
}

struct UserDetails: Codable {
    var name: String?
    var lastname: String?
    var mail: String?
    var phone: String?
}

struct UserWithSignUpStatusCode: Codable {
    var status: SignUpStatusCode
    var user: User?
}

struct UserWithSignInStatusCode: Decodable {
    var status: SignInStatusCode
    var user: User?
}

enum SignUpStatusCode: Int, Codable {
    case success = 0
    case usernameAlreadyTaken = 1
}

enum SignInStatusCode: Int, Decodable {
    case success = 0
    case wrongUsername = 1
    case wrongPassword = 2
}

var sampleUser = User(id: 1, username: "user", password: "pass", userDetails: UserDetails(name: "name", lastname: "last", mail: "mail", phone: "532"))
