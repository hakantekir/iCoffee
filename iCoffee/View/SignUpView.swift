//
//  SignUpView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 1.12.2022.
//

import SwiftUI

struct SignUpView: View {
    @State var name: String = ""
    @State var lastname: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var mail: String = ""
    @State var phone: String = ""
    
    let myGreen = Color(red: 0, green: 100.0/255, blue: 60.0/255, opacity: 1.0)
    var body: some View {
        VStack{
            Text("iCoffee")
                .font(.largeTitle)
                .bold()
            HStack{
                TextField("Name", text: $name)
                    .padding()
                    .frame(width: 145, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("Last Name", text: $lastname)
                    .padding()
                    .frame(width: 145, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
            }
            
            TextField("Username", text: $username)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            
            SecureField("Password", text: $password)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            
            TextField("E-Mail", text: $username)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            
            TextField("Phone Number", text: $username)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                
            Button {
                print("sign up button clicked")
            } label: {
                Text("SIGN UP")
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(myGreen)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
