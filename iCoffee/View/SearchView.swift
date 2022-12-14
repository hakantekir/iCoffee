//
//  SearchView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 9.12.2022.
//

import SwiftUI

struct SearchView: View {
    @State var value = ""
    @State var coffees: [Coffee] = []
    var body: some View {
        NavigationStack {
            VStack{
                TextField("Search", text: $value)
                    .padding()
                    .frame(width: 400, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .padding(50.0)
                
                List(coffees, id: \.id){ index in
                    CoffeeView(coffee: index)
                }
                
                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
