//
//  CartItemView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 15.12.2022.
//

import SwiftUI

struct CartItemView: View {
    var coffee: Coffee
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(coffee.name ?? "Coffee")
                    .font(.largeTitle)
                HStack{
                    Text(String(coffee.quantity ?? 1))
                    Spacer()
                    Text("$\(coffee.price ?? 0, specifier: "%.2f")")
                }
            }
        }
        .padding()
        .frame(width: 350, height: 75)
        .background(Color.black.opacity(0.05))
        .cornerRadius(10)
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(coffee: sampleCoffee)
    }
}
