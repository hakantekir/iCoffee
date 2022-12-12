//
//  AddressView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 9.12.2022.
//

import SwiftUI
import MapKit

struct AddressView: View {
    @State var country = ""
    @State var city = ""
    @State var zip = ""
    @State var address = ""
    
    @StateObject private var manager = LocationManager()
    
    var body: some View {
        VStack {
            
            Map(coordinateRegion: $manager.region, showsUserLocation: true)
                .frame(maxWidth: .infinity, maxHeight: 450)
                .padding(/*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(.top)
            HStack {
                TextField("Country", text: $country)
                    .padding()
                    .frame(width: 150, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("City", text: $city)
                    .padding()
                    .frame(width: 150, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
            }
            HStack {
                TextField("Zip", text: $country)
                    .padding()
                    .frame(width: 150, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("Phone", text: $city)
                    .padding()
                    .frame(width: 150, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
            }
            TextField("Address", text: $address)
                .padding()
                .frame(width: 310, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            Button {
                print(1)
            } label: {
                Text("Add")
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color(red: 0, green: 100.0/255, blue: 60.0/255, opacity: 1.0))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }

            Spacer()
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView()
    }
}
