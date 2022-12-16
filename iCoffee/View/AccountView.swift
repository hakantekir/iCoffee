//
//  AccountView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 9.12.2022.
//

import SwiftUI

struct AccountView: View {
    @State var signOut = false
    let myGreen = Color(red: 0, green: 100.0/255, blue: 60.0/255, opacity: 1.0)
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink{
                    AddressesView()
                } label: {
                    Text("My Addresses")
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(myGreen)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                
                Button {
                    UserDefaults.standard.removeObject(forKey: "id")//
                    signOut.toggle()
                } label: {
                    Text("Sign out")
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(myGreen)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }.navigationDestination(isPresented: $signOut, destination: {
                    SignInView()//
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
