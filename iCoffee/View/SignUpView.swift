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
    @State var showAlert = false
    @State var navigateMain = false
    @State var errorMessage = ""
    
    var signUpViewModel = SignUpViewModel()
    
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
                .textInputAutocapitalization(.never)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            
            SecureField("Password", text: $password)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            
            TextField("E-Mail", text: $mail)
                .keyboardType(.emailAddress)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            
            TextField("Phone Number", text: $phone)
                .keyboardType(.numberPad)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                
            Button {
                if [name,lastname,username,password,mail,phone].contains(""){
                    errorMessage = "Please enter blank fields!"
                    showAlert=true
                } else {
                    let newUser = User(username: username, password: password, userDetails: UserDetails(name: name, lastname: lastname, mail: mail, phone: phone))
                    signUpViewModel.signUp(user: newUser) { result in
                        switch result{
                        case .success(_):
                            navigateMain=true
                        case .failure(let error):
                            switch error {
                            case .usernameAlreadyTaken:
                                errorMessage = "This username already taken!"
                            case .connectionError:
                                errorMessage = "Please check your internet connection!"
                            }
                            showAlert = true
                        }
                    }
                }
            } label: {
                Text("SIGN UP")
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(myGreen)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }.navigationDestination(isPresented: $navigateMain, destination: {
                MainView()
            })
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(errorMessage)
                )
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
