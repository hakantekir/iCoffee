//
//  ItemView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 15.12.2022.
//

import SwiftUI

struct ItemView: View {
    var coffee: Coffee
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(coffee.name ?? "Coffee")
                    .font(.largeTitle)
                HStack{
                    Text(coffee.description ?? "Description")
                    Spacer()
                    Text(coffee.price ?? "TL")
                }
            }
        }
        .frame(width: 350, height: 75)
        .background(Color.black.opacity(0.05))
        .cornerRadius(10)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(coffee: sampleCoffee)
    }
}
