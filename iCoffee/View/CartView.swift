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
    
    var cartViewModel = CartViewModel()
    var body: some View {
        VStack{
            List{
                ForEach(cart, id: \.id) { index in
                    CartItemView(coffee: index)
                }
            }
            .onAppear(){
                cartViewModel.getCart() { result in
                    switch result {
                    case .success(let coffees):
                        self.cart = coffees
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
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(errorMessage)
                )
            }
            Button {
                
            } label: {
                Text("Proceed to Checkout")
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(myGreen)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cart: [sampleCoffee])
    }
}
