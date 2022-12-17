//
//  WelcomeView.swift
//  iCoffee
//
//  Created by Hakan Tekir on 3.12.2022.
//

import SwiftUI

struct WelcomeView: View {
    @State var selectedPage=0
    
    var body: some View {
        VStack{
            TabView(selection: $selectedPage) {
                ForEach(0..<pages.count) { index in
                    PageView(page: pages[index]).tag(index)
                }
            }
            Spacer()
            Button {
                selectedPage=selectedPage+1
            } label: {
                Text("Continue")
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(myGreen)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
    }
}
 


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
