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
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            VStack{
                TextField("Search", text: $value)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(colorScheme == .light ? Color.black.opacity(0.05) : Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .onChange(of: value) { newValue in
                        sharedApiManager.searchCoffee(value: newValue) { result in
                            switch result {
                            case .success(let coffees):
                                self.coffees = coffees.coffees ?? []
                            case .failure(let error):
                                print(error)
                            }
                            
                        }
                    }.onAppear(){
                        sharedApiManager.searchCoffee(value: "") { result in
                            switch result {
                            case .success(let coffees):
                                self.coffees = coffees.coffees ?? []
                            case .failure(let error):
                                print(error)
                            }
                        }
                    }
                
                List{
                    ForEach(coffees, id: \.id){ index in
                        CoffeeView(coffee: index)
                            .listRowSeparator(.hidden)
                        
                    }
                }
                
                .scrollContentBackground(.hidden)
                
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
