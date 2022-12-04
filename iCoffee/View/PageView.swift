//
//  WelcomeView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 1.12.2022.
//

import SwiftUI

struct PageView: View {
    var page: Page
    var body: some View {
        VStack{
            Image(page.image)
                .resizable()
                .frame(width: 300, height: 300)
                .scaledToFit()

            Text(page.title)
                .font(.largeTitle)
                .bold()
                .padding()
            Text(page.description)
                .font(.title2)
                .padding()
            
        }

    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: pages[0])
    }
}
