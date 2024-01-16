//
//  ChangeUsername.swift
//  BeBetter
//
//  Created by Andrija Botica on 16.01.2024..
//

import SwiftUI

struct ChangeUsername: View {
    @State var currUsername = ""
    @State var newUsername = ""
    var body: some View {
        VStack{
            
            Text("Change username").padding(.trailing, 160)
                .padding(.bottom, 5).font(.custom("Ketibeh-Regular", size: 28))
            Text("Your username will be changed to a new username if available.\n")
                .padding(.trailing, 5)
                .font(.custom("Ketibeh-Regular", size: 20))
                .multilineTextAlignment(.leading)
            Text("Once you change your username another person can use your old username.\n")
                .padding(.leading, 5)
                .font(.custom("Ketibeh-Regular", size: 20))
                .multilineTextAlignment(.leading)
            TextField("", text: $currUsername, prompt: Text("Current username").foregroundStyle(Color("AccentColorInvert"))).padding(15).font(.custom("Ketibeh-Regular", size: 20)).background(LinearGradient(colors: [Color(#colorLiteral(red: 0.9139844775, green: 0.767064631, blue: 0.4150085449, alpha: 1)), Color(#colorLiteral(red: 0.9025250077, green: 0.4324684143, blue: 0.3178541958, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: 300)
                .padding(.trailing, 75)
            TextField("", text: $newUsername, prompt: Text("New username").foregroundStyle(Color("AccentColorInvert"))).padding(15).font(.custom("Ketibeh-Regular", size: 20)).background(LinearGradient(colors: [Color(#colorLiteral(red: 0.9139844775, green: 0.767064631, blue: 0.4150085449, alpha: 1)), Color(#colorLiteral(red: 0.9025250077, green: 0.4324684143, blue: 0.3178541958, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: 300)
                .padding(.trailing, 75)
            
            Spacer()
        }
    }
}

#Preview {
    ChangeUsername()
}
