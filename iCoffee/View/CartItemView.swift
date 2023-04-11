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
    @State var showAlert = false
    @State var errorMessage = ""
    
    var coffeeViewModel = CoffeeViewModel()
    var body: some View {
        if coffee.quantity != 0 {
            HStack{
                VStack(alignment: .leading){
                    Text(coffee.name ?? "Coffee")
                        .font(.largeTitle)
                    HStack {
                        HStack {
                            Button {
                                if(coffee.quantity==1){
                                    coffeeViewModel.deleteCart(coffeId: coffee.id) { result in
                                        switch result {
                                        case .success(_):
                                            coffee.quantity = 0
                                        case .failure(let error):
                                            switch error {
                                            case .sqlError:
                                                errorMessage="Database Error!"
                                            case .connectionError:
                                                errorMessage="Connection Error!"
                                            }
                                            showAlert.toggle()
                                        }
                                    }
                                } else {
                                    coffeeViewModel.updateCart(coffeId: coffee.id, quantity: coffee.quantity!-1) { result in
                                        switch result {
                                        case .success(_):
                                            coffee.quantity!-=1
                                        case .failure(let error):
                                            switch error {
                                            case .sqlError:
                                                errorMessage="Database Error!"
                                            case .connectionError:
                                                errorMessage="Connection Error!"
                                            }
                                            showAlert.toggle()
                                        }
                                    }
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
                                coffeeViewModel.updateCart(coffeId: coffee.id, quantity: coffee.quantity!+1) { result in
                                    switch result {
                                    case .success(_):
                                        coffee.quantity!+=1
                                    case .failure(let error):
                                        switch error {
                                        case .sqlError:
                                            errorMessage="This item is already in your cart!"
                                        case .connectionError:
                                            errorMessage="Connection Error!"
                                        }
                                        showAlert.toggle()
                                    }
                                }
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
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(coffee: sampleCoffee)
            .previewLayout(.sizeThatFits)
    }
}
