//
//  MainView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 6.12.2022.
//

import SwiftUI

struct MainView: View {
    var user: User
    var body: some View {
        NavigationView {
            Text(user.username!)
        }.navigationBarBackButtonHidden()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(user: sampleUser)
    }
}
