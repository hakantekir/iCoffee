//
//  AddressesView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 9.12.2022.
//

import SwiftUI

struct AddressesView: View {
    var addresses: [Address]
    var body: some View {
        List(addresses, id: \.id){ index in
            Text(index.city ?? "")
        }
    }
}

struct AddressesView_Previews: PreviewProvider {
    static var previews: some View {
        AddressesView(addresses: [sampleAddress])
    }
}
