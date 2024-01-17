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
    @State var Screen_Width = UIScreen.main.bounds.width
    @State var Screen_Height = UIScreen.main.bounds.height
    @Binding var goBack: Bool
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(#colorLiteral(red: 0.9139844775, green: 0.767064631, blue: 0.4150085449, alpha: 1)), Color(#colorLiteral(red: 0.9025250077, green: 0.4324684143, blue: 0.3178541958, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
           
            VStack{
                
                Circle()
                    .opacity(0)
                    .overlay(){
                        Button(action: {
                            goBack.toggle()
                            }, label: {
                        
                                Image(systemName: "arrow.left")
                                        .foregroundStyle(.black)
                                        .fontWeight(.black)
                                       
                                            })
                        
                                        
                    }
                    .frame(width: Screen_Width*0.1, height: Screen_Height*0.03)
                    .offset(x: -Screen_Width*0.46, y: Screen_Height*0.001)
                    .padding(.bottom, 20)
                
                Text("Change password").padding(.trailing, 160)
                    .padding(.bottom, 5).font(.system(.title, design: .serif)).fontWeight(.medium).foregroundStyle(.black)
                Text("You'll be logged out of all sessions except this one to protect your account if anyone is trying to gain access.\n")
                    .padding(.leading, 5)
                    .font(.custom("Ketibeh-Regular", size: 20))
                    .multilineTextAlignment(.leading).foregroundStyle(.black)
                Text("Your password must be at least six characters and should include a combination of numbers, letters and special characters (!$@%).")
                    .padding(.leading, 5)
                    .font(.custom("Ketibeh-Regular", size: 20))
                    .padding(.bottom, 40)
                    .multilineTextAlignment(.leading).foregroundStyle(.black)
                TextField("", text: $currPass, prompt: Text("Current password").foregroundStyle(.black.opacity(0.7))).modifier(changeDataModifier())
                TextField("", text: $newPass, prompt: Text("New password").foregroundStyle(.black.opacity(0.7))).modifier(changeDataModifier())
                TextField("", text: $newPassRep, prompt: Text("New password").foregroundStyle(.black.opacity(0.7))).modifier(changeDataModifier())
                
                Text("Forgotten your password?").padding(.trailing, 160).foregroundStyle(Color(#colorLiteral(red: 0.2790243626, green: 0.2790243626, blue: 0.2790243626, alpha: 1))).fontWeight(.bold)
                
                Button(action: {
                    
                    
                }, label: {
                    Text("Save")
                        .foregroundStyle(Color(.black)).padding(10).font(.custom("Ketibeh-Regular", size: 20)).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10)).overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1.5).foregroundStyle(.black))
                        .padding(.trailing, 305).padding(.top, 10)
                })
                Spacer()
            }
        }
    }
}

#Preview {
    ChangePassword(goBack: .constant(false))
}
