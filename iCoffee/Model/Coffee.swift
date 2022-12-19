//
//  Coffee.swift
//  iCoffee
//
//  Created by Hakan Tekir on 9.12.2022.
//

import Foundation


struct Coffee: Codable, Identifiable, Equatable, Hashable{
    var id: Int
    var name: String?
    var description: String?
    var price: Float?
    var image: String?
    var quantity: Int?
}

struct CoffeesWithStatusCode: Decodable {
    let status: StatusCode
    let coffees: [Coffee]?
}

enum StatusCode: Int, Decodable {
    case success = 0
    case sqlError = 1
}

let sampleCoffee = Coffee(id: 1, name: "Name", description: "Description", price:10, image: "https://content.sbuxtr.com/images/9fcb82e2fcaa2175e749054a02870048.jpg", quantity: 2)
