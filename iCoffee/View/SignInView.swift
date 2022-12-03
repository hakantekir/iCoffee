//
//  SignInView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 1.12.2022.
//

import SwiftUI

struct SignInView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    let myGreen = Color(red: 0, green: 100.0/255, blue: 60.0/255, opacity: 1.0)
    
    var body: some View {
        ZStack{
            myGreen.edgesIgnoringSafeArea(Edge.Set.all)
            Circle()
                .scale(1.7)
                .foregroundColor(.white.opacity(0.15))
            Circle()
                .scale(1.35)
                .foregroundColor(.white)
            VStack{
                Text("iCoffee")
                    .font(.largeTitle)
                    .bold()
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
                    .padding(.bottom)
                
                
                Button {
                    print("sign in button clicked")
                } label: {
                    Text("SIGN IN")
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(myGreen)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                
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
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
