//
//  CoffeeView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 18.12.2022.
//

import SwiftUI

struct CoffeeView: View {
    @State var quantity: Int
    @State var isOnCart: Bool
    @State var showAlert = false
    @State var errorMessage = ""
    
    var coffee: Coffee
    var coffeeViewModel = CoffeeViewModel()
    init(coffee: Coffee) {
        self.coffee = coffee
        if coffee.quantity == nil {
            quantity = 1
            isOnCart = false
        } else {
            quantity = coffee.quantity!
            isOnCart = true
        }
    }
    var body: some View {
        NavigationStack {
            VStack {
                AsyncImage(url: URL(string: coffee.image ?? "")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 350,height: 350)
                            .cornerRadius(10)
                    default:
                        Image("coffee")
                            .resizable()
                            .frame(width: 350,height: 350)
                            .cornerRadius(10)
                    }
                }
                Text(coffee.name ?? "Coffee Name")
                    .font(.largeTitle)
                    .padding()
                Text(coffee.description ?? "Coffee Description")
                Spacer()
                ZStack {
                    if (!isOnCart){
                        Button {
                            coffeeViewModel.addCart(coffeId: coffee.id) { result in
                                switch result {
                                case .success(_):
                                    isOnCart=true
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
                            Text("Add to Cart")
                                .padding()
                                .frame(width: 350, height: 50)
                                .background(myGreen)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Error"),
                                message: Text(errorMessage)
                            )
                        }
                    } else {
                        HStack {
                            Button {
                                if(quantity==1){
                                    coffeeViewModel.deleteCart(coffeId: coffee.id) { result in
                                        switch result {
                                        case .success(_):
                                            isOnCart=false
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
                                    coffeeViewModel.updateCart(coffeId: coffee.id, quantity: quantity-1) { result in
                                        switch result {
                                        case .success(_):
                                            quantity-=1
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
                                    .foregroundColor(.white)
                                    .frame(height: 30)
                            }.disabled(quantity == 0)
                            
                            Text("\(quantity)")
                                .font(.title)
                                .frame(width: 40)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            Button {
                                coffeeViewModel.updateCart(coffeId: coffee.id, quantity: quantity+1) { result in
                                    switch result {
                                    case .success(_):
                                        quantity+=1
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
                                    .foregroundColor(.white)
                                    .frame(height: 30)
                            }
                        }
                        .frame(width: 350, height: 50)
                        .background(myGreen)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
    }
}

struct CoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeView(coffee: sampleCoffee)
    }
}
