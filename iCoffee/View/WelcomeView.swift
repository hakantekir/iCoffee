//
//  WelcomeView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 1.12.2022.
//

import SwiftUI

struct WelcomeView: View {
    var texts = ["Welcome to iCoffee", "Get Coffee Anywhere", "Fast Delivery"]
    var body: some View {
        VStack{
            Text(texts[0])
                .font(.largeTitle)
                .bold()
                .padding()
            Button {
                print("next")
            } label: {
                Text("Next")
            }
        }

    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
