//
//  SearchView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 9.12.2022.
//

import SwiftUI

struct SearchView: View {
    @State var value = ""
    @State var coffees: [Coffee] = []
    @State var showAlert = false
    @State var errorMessage: String = ""
    
    @Environment(\.colorScheme) var colorScheme
    
    var searchViewModel = SearchViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .padding()
                    TextField("Search", text: $value)
                        .task(id: value) {
                            searchViewModel.searchCoffee(value: self.value) { result in
                                switch result {
                                case .success(let coffees):
                                    self.coffees=coffees
                                case .failure(let error):
                                    switch error {
                                    case .connectionError:
                                        self.errorMessage = "Please check your internet connection!"
                                        self.showAlert.toggle()
                                    case .sqlError:
                                        self.errorMessage = "Database Error!"
                                        self.showAlert.toggle()
                                    case .valueNotFound: break
                                    case .userNotFound:
                                        self.errorMessage = "User error. Please re-sign in!"
                                        self.showAlert.toggle()
                                    }
                                }
                            }
                        }
                }
                .frame(width: 350, height: 50)
                .background(colorScheme == .light ? Color.black.opacity(0.05) : Color.white.opacity(0.2))
                .cornerRadius(10)
                .padding(15.0)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text(errorMessage)
                    )
                }
                
                List {
                    ForEach(coffees, id: \.id){ index in
                        ZStack {
                            SearchItemView(coffee: index)
                            NavigationLink {
                                CoffeeView(coffee: index)
                            } label: {
                                EmptyView()
                            }.opacity(0)
                        }
                        .listRowSeparator(.hidden)
                    }
                }
                .scrollContentBackground(.hidden)
                .gesture(DragGesture()
                    .onChanged({ _ in
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    })
                )
                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .onAppear(){
                UserDefaults.standard.set("2", forKey: "id")
            }
    }
}
