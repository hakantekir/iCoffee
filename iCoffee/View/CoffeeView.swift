//
//  CoffeeView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 14.12.2022.
//

import SwiftUI

struct CoffeeView: View {
    var coffee: Coffee
    var body: some View {
        HStack{
            Image("coffee") // Dont forget to change
                .resizable()
                .frame(width: 100,height: 150)
                .padding(25.0)
            VStack{
                Text(coffee.name ?? "Coffee")
                    .font(.largeTitle)
                Text(coffee.description ?? "Description")
            }
            Text(coffee.price ?? "TL")
                .font(.title)
                .padding(25)
        }
    }
}

struct CoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeView(coffee: sampleCoffee)
    }
}
