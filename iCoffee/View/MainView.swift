//
//  MainView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 6.12.2022.
//

import SwiftUI

struct MainView: View {
    @State var selection = 1
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                HomeView()
                    .tabItem { Label("Home", systemImage: "house") }.tag(1)
                SearchView()
                    .tabItem { Label("Search", systemImage: "magnifyingglass") }.tag(2)
                CartView()
                    .tabItem { Label("Cart", systemImage: "cart") }.tag(3)
                AccountView()
                    .tabItem { Label("Account", systemImage: "person") }.tag(4)
            }
        }.navigationBarBackButtonHidden()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
