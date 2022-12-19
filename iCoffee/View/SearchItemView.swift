//
//  SearchItemView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 14.12.2022.
//

import SwiftUI

struct SearchItemView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var coffee: Coffee
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: coffee.image ?? "")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                default:
                    Image("coffee")
                        .resizable()
                }
            }
            .frame(width: 100,height: 150)
            .cornerRadius(10)
            .padding(.trailing)
            
            VStack(alignment: .leading){
                Text(coffee.name ?? "Coffee")
                    .font(.largeTitle)
                Text(coffee.description ?? "Description")
                Spacer()
                HStack{
                    Spacer()
                    Text("$\(coffee.price ?? 0, specifier: "%.2f")")
                        .font(.title)
                }
            }
        }
        .padding()
        .frame(width: 350, height: 200)
        .background(colorScheme == .light ? Color.black.opacity(0.05) : Color.white.opacity(0.2))
        .cornerRadius(10)
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView(coffee: sampleCoffee)
    }
}
