//
//  ChangeName.swift
//  BeBetter
//
//  Created by Andrija Botica on 15.01.2024..
//

import SwiftUI

struct ChangeName: View {
    @State var name = ""
    var body: some View {
        VStack{
            
            
            VStack{
                
                
                Text("Change name").padding(.trailing, 210)
                    .padding(.bottom, 5).font(.custom("Ketibeh-Regular", size: 28))
                Text("Your name is visible only to you and can be used for authentication purposes.\n")
                    .padding(.leading, 5)
                    .font(.custom("Ketibeh-Regular", size: 20))
                    .multilineTextAlignment(.leading)
                Text("It may take some time for your changed name to show on your home screen.\n")
                    .padding(.trailing, 25)
                    .font(.custom("Ketibeh-Regular", size: 20))
                    .multilineTextAlignment(.leading)
                TextField("", text: $name, prompt: Text("New name").foregroundStyle(Color("AccentColorInvert"))).padding(15).font(.custom("Ketibeh-Regular", size: 20)).background(LinearGradient(colors: [Color(#colorLiteral(red: 0.9139844775, green: 0.767064631, blue: 0.4150085449, alpha: 1)), Color(#colorLiteral(red: 0.9025250077, green: 0.4324684143, blue: 0.3178541958, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: 300)
                    .padding(.trailing, 75)
                
                Spacer()
            }
            
            
            
            
        }
    }
}

#Preview {
    ChangeName()
}
