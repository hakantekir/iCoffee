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
    @State var showAlert = false
    @State var errorMessage: String = ""
    @State var user: User?
    @State var login = false
    
    @Environment(\.colorScheme) var colorScheme
    
    var signInViewModel = SignInViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack{
                myGreen.edgesIgnoringSafeArea(Edge.Set.all)
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(colorScheme == .dark ? .gray : .white)
                
                VStack{
                    Text("iCoffee")
                        .font(.largeTitle)
                        .bold()
                    
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
                        .padding(.bottom)
                    
                    Button {
                        signInViewModel.signIn(username: username, password: password) { result in
                            switch result{
                            case .success(_):
                                login.toggle()
                            case .failure(let error):
                                switch error {
                                case .connectionError:
                                    self.errorMessage = "Please check your internet connection!"
                                case .wrongUsername:
                                    self.errorMessage = "Please check your username!"
                                case .wrongPassword:
                                    self.errorMessage = "Please check your password!"
                                }
                                showAlert=true
                            }
                        }
                    } label: {
                        Text("SIGN IN")
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(myGreen)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                    .navigationDestination(isPresented: $login, destination: {
                        MainView()
                    })
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Error"),
                            message: Text(errorMessage)
                        )
                    }
                    
                    NavigationLink {
                        SignUpView()
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
        .toolbar(.hidden, for: .tabBar, .navigationBar)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
