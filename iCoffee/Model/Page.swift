//
//  Page.swift
//  iCoffee
//
//  Created by Hakan Tekir on 3.12.2022.
//

import Foundation


struct Page: Identifiable, Hashable {
    var id  = UUID()
    var image : String
    var title : String
    var description : String
}

var pages: [Page] = [
    Page(image: "coffee", title: "iCoffee", description: "Welcome to iCoffee."),
    Page(image: "location", title: "Available Anywhere", description: "You can order coffee from anywhere."),
    Page(image: "coffee", title: "Sign Up", description: "Sign up and enjoy your coffee.")
]
