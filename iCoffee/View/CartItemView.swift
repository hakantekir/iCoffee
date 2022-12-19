//
//  CartItemView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 15.12.2022.
//

import SwiftUI

struct CartItemView: View {
    @State var coffee: Coffee
    @State var isOnCart = true
    var body: some View {
            HStack{
                VStack(alignment: .leading){
                    Text(coffee.name ?? "Coffee")
                        .font(.largeTitle)
                    HStack {
                        HStack {
                            Button {
                                if coffee.quantity==1 {
                                    isOnCart=false
                                } else {
                                    coffee.quantity! -= 1
                                }
                            } label: {
                                Image(systemName: "minus")
                                    .frame(height: 30)
                            }
                            .buttonStyle(.borderless)
                            .padding(.horizontal)
                            Text(String(coffee.quantity!))
                                .padding(.vertical, 5.0)
                            Button {
                                coffee.quantity! += 1
                            } label: {
                                Image(systemName: "plus")
                                    .frame(height: 30)
                            }
                            .buttonStyle(.borderless)
                            .padding(.horizontal)
                        }
                        .foregroundColor(.white)
                        .font(.title3)
                        .padding(5)
                        .background(myGreen)
                        .cornerRadius(10)
                        Spacer()
                        Text("$\((coffee.price!*Float(coffee.quantity!)) , specifier: "%.2f")")
                    }
                }
            }
            .padding()
            .frame(width: 350, height: 130)
            .background(Color.black.opacity(0.05))
            .cornerRadius(10)
        }
    }


struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(coffee: sampleCoffee)
            .previewLayout(.sizeThatFits)
    }
}
