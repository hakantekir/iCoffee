//
//  CartView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 9.12.2022.
//

import SwiftUI

struct CartView: View {
    @State var cart: [Coffee] = []
    @State var showAlert = false
    @State var errorMessage: String = ""
    @State var order = false
    @State var cartDetails: CartDetails?
    
    var cartViewModel = CartViewModel()
    
    var body: some View {
        NavigationStack {
            VStack{
                List{
                    ForEach(cart, id: \.self) { index in
                        CartItemView(coffee: index)
                    }
                }
                .onAppear(){
                    cartViewModel.getCart() { result in
                        switch result {
                        case .success(let coffees):
                            self.cart = []
                            self.cart.append(contentsOf: coffees)
                        case .failure(let error):
                            switch error {
                            case .connectionError:
                                self.errorMessage = "Please check your internet connection!"
                                self.showAlert.toggle()
                            case .sqlError:
                                self.errorMessage = "Database Error!"
                                self.showAlert.toggle()
                            case .valueNotFound: break
                            }
                        }
                    }
                }
                
                .scrollContentBackground(.hidden)
                Button {
                    cartViewModel.getCartDetails() { result in
                        switch result {
                        case .success(let details):
                            self.cartDetails = details
                            print(details)
                            order.toggle()
                        case .failure(let error):
                            switch error {
                            case .connectionError:
                                self.errorMessage = "Please check your internet connection!"
                            case .sqlError:
                                self.errorMessage = "Database Error!"
                            case .addressError:
                                self.errorMessage = "Please add an address!"
                            case .emptyCart:
                                self.errorMessage = "Please add a coffee!"
                            }
                            self.showAlert.toggle()
                        }
                    }
                } label: {
                    Text("Proceed to Checkout")
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(myGreen)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding()
                }
                .navigationDestination(isPresented: $order, destination: {
                    OrderView(cartDetails: self.cartDetails)
                })
            }.alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(errorMessage)
                )
            }
        }
    }
}
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
