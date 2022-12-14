//
//  AccountView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 9.12.2022.
//

import SwiftUI

struct AccountView: View {
    @State var signOut = false
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink{
                    AddressesView()
                } label: {
                    Text("My Addresses")
                }
                
                Button {
                    UserDefaults.standard.removeObject(forKey: "id")
                    signOut.toggle()
                } label: {
                    Text("Sign out")
                }.navigationDestination(isPresented: $signOut, destination: {
                    SignInView()
                })
                
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
