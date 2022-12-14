//
//  Coffee.swift
//  iCoffee
//
//  Created by Hakan Tekir on 9.12.2022.
//

import SwiftUI
import Foundation


struct Coffee: Codable, Identifiable{
    var id: Int
    var name: String?
    var description: String?
    var price: String?
    var image: Data?
}

let sampleCoffee = Coffee(id: 1, name: "Name", description: "descp", price:"10TL")
