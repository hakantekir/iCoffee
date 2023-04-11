//
//  OrderView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 20.12.2022.
//

import SwiftUI

struct OrderView: View {
    var cartDetails: CartDetails?
    @State var selectedAddress: Address?
    
    var orderViewMoedl = OrderViewModel()

    var body: some View {
        VStack {
            Text("$\((cartDetails?.price!)!, specifier: "%.2f")")
            Text("Adress")
            Picker("Address", selection: $selectedAddress) {
                ForEach((cartDetails?.address)!, id: \.self) { address in
                    Text(address.title!).tag(address as Address?)
                }
            }
            .cornerRadius(10)
            .pickerStyle(.menu)
            Text(selectedAddress?.title ?? "")
            Spacer()
            Button {
                orderViewMoedl.createOrder(address: selectedAddress) { result in
                    switch result {
                    case .success(_):
                        print(1)
                    case .failure(let error):
                        switch error {
                        case .sqlError:
                            print(1)
                        case .connectionError:
                            print(1)
                        }
                    }
                }
            } label: {
                Text("ORDER")
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(myGreen)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }

        }
        .padding()
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(cartDetails: sampleCartDetails)
    }
}
