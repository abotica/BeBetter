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
                
                Text("Change username").frame(width: 240)
                    .padding(.bottom, 5).font(.system(.title, design: .serif)).fontWeight(.medium).padding(.trailing, 140).foregroundStyle(.black)
                Text("Your username will be changed to a new username if available.\n")
                    .padding(.trailing, 5)
                    .font(.custom("Ketibeh-Regular", size: 20))
                    .multilineTextAlignment(.leading).foregroundStyle(.black)
                Text("Once you change your username another person can use your old username.\n")
                    .padding(.leading, 5)
                    .font(.custom("Ketibeh-Regular", size: 20))
                    .multilineTextAlignment(.leading).foregroundStyle(.black)
                TextField("", text: $currUsername, prompt: Text("Current username").foregroundStyle(.black.opacity(0.7))).modifier(changeDataModifier())
                TextField("", text: $newUsername, prompt: Text("New username").foregroundStyle(.black.opacity(0.7))).modifier(changeDataModifier())
                
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
    ChangeUsername(goBack: .constant(false))
}
