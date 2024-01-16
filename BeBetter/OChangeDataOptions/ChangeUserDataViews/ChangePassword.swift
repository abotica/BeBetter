//
//  ChangePassword.swift
//  BeBetter
//
//  Created by Andrija Botica on 15.01.2024..
//

import SwiftUI

struct ChangePassword: View {
    @State var currPass = ""
    @State var newPass = ""
    @State var newPassRep = ""
    var body: some View {
        VStack{
            
            Text("Change password").padding(.trailing, 160)
                .padding(.bottom, 5).font(.custom("Ketibeh-Regular", size: 28))
            Text("You'll be logged out of all sessions except this one to protect your account if anyone is trying to gain access.\n")
                .padding(.leading, 5)
                .font(.custom("Ketibeh-Regular", size: 20))
                .multilineTextAlignment(.leading)
            Text("Your password must be at least six characters and should include a combination of numbers, letters and special characters (!$@%).")
                .padding(.leading, 5)
                .font(.custom("Ketibeh-Regular", size: 20))
                .padding(.bottom, 40)
                .multilineTextAlignment(.leading)
            TextField("", text: $currPass, prompt: Text("Current password").foregroundStyle(Color("AccentColorInvert"))).padding(15).font(.custom("Ketibeh-Regular", size: 20)).background(LinearGradient(colors: [Color(#colorLiteral(red: 0.9139844775, green: 0.767064631, blue: 0.4150085449, alpha: 1)), Color(#colorLiteral(red: 0.9025250077, green: 0.4324684143, blue: 0.3178541958, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: 300)
                .padding(.trailing, 75)
            TextField("", text: $newPass, prompt: Text("New password").foregroundStyle(Color("AccentColorInvert"))).padding(15).font(.custom("Ketibeh-Regular", size: 20)).background(LinearGradient(colors: [Color(#colorLiteral(red: 0.9139844775, green: 0.767064631, blue: 0.4150085449, alpha: 1)), Color(#colorLiteral(red: 0.9025250077, green: 0.4324684143, blue: 0.3178541958, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: 300)
                .padding(.trailing, 75)
            TextField("", text: $newPassRep, prompt: Text("New password").foregroundStyle(Color("AccentColorInvert"))).padding(15).font(.custom("Ketibeh-Regular", size: 20)).background(LinearGradient(colors: [Color(#colorLiteral(red: 0.9139844775, green: 0.767064631, blue: 0.4150085449, alpha: 1)), Color(#colorLiteral(red: 0.9025250077, green: 0.4324684143, blue: 0.3178541958, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: 300).padding(.trailing, 75)
            Text("Forgotten your password?").padding(.trailing, 160).foregroundStyle(Color.indigo)
            Spacer()
        }
    }
}

#Preview {
    ChangePassword()
}
