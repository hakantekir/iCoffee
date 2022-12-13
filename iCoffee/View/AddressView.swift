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
    @State var phone = ""
    @State var address = ""
    @State var showAlert = false
    @State var errorMessage = ""
    
    @StateObject private var manager = LocationManager()
    
    let addressViewModel = AddressViewModel()
    
    var body: some View {
        VStack {
            
            Map(coordinateRegion: $manager.region, showsUserLocation: true)
                .frame(maxWidth: .infinity, maxHeight: 450)
                .cornerRadius(25)
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
                TextField("Zip", text: $zip)
                    .padding()
                    .frame(width: 150, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("Phone", text: $phone)
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
                
                if [country,city,zip,phone,address].contains(""){
                    errorMessage = "Please enter blank fields!"
                    showAlert=true
                }
                else {
                    let address = Address(country: country, city: city, zip: zip, phone: phone, billingAddress: address, latitude: manager.region.center.latitude, longitude: manager.region.center.longitude)
                    addressViewModel.addAddress(address: address) { result in
                        switch result {
                        case .success(_):
                            print("success")
                        case .failure(let error):
                            switch error {
                            case .sqlError:
                                print("sqlError")
                            case .connectionError:
                                print("connectionError")
                            }
                            errorMessage = "Connection error!"
                            showAlert=true
                        }
                    }
                    
                }
            } label: {
                Text("Add")
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color(red: 0, green: 100.0/255, blue: 60.0/255, opacity: 1.0))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(errorMessage)
                )
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
