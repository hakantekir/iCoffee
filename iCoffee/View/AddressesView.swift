//
//  AddressesView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 9.12.2022.
//

import SwiftUI

struct AddressesView: View {
    @State var addresses: [Address] = []
    @State var isHidden = true
    @State var errorMessage = ""
    
    var addressesViewModel = AddressesViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                if (!isHidden){
                    Text("Add Address")
                }
                List(addresses, id: \.id){ index in
                    Text(index.city ?? "")
                }.onAppear {
                    let id = UserDefaults.standard.string(forKey: "id")
                    addressesViewModel.getAddresses(id: id) { result in
                        switch result {
                        case .success(let addresses):
                            isHidden=true
                            self.addresses=addresses
                        case .failure(let error):
                            switch error {
                            case .sqlError, .connectionError:
                                errorMessage = "Connection Error!"
                            case .emptyArray:
                                isHidden=false
                            }
                        }
                    }
                }
            }
            .toolbar {
                NavigationLink {
                    AddressView()
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
    }
}

struct AddressesView_Previews: PreviewProvider {
    static var previews: some View {
        AddressesView(addresses: [sampleAddress])
    }
}
