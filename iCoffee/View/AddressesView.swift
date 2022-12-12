//
//  AddressesView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 9.12.2022.
//

import SwiftUI

struct AddressesView: View {
    var user: User
    var body: some View {
        List(user.userDetails?.addresses ?? [], id: \.id){ index in
            Text(index.city ?? "")
        }
    }
}

struct AddressesView_Previews: PreviewProvider {
    static var previews: some View {
        AddressesView(user: sampleUser)
    }
}
