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
    var image: Data?
}
