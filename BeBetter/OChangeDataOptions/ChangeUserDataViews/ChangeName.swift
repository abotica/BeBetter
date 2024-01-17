//
//  ChangeName.swift
//  BeBetter
//
//  Created by Andrija Botica on 15.01.2024..
//

import SwiftUI

struct changeDataModifier: ViewModifier{
    
    func body(content: Content) -> some View{
        content
            .foregroundStyle(Color(.black)).padding(15).font(.custom("Ketibeh-Regular", size: 20)).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: 300).overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1.5).foregroundStyle(.black))
                .padding(.trailing, 75)
                .tint(.black)
                
       
    }

}



struct ChangeName: View {
    @State var name = ""
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
                
                VStack{
                    
                    
                    Text("Change name").padding(.trailing, 210)
                        .padding(.bottom, 5).font(.system(.title, design: .serif)).fontWeight(.medium).foregroundStyle(.black)
                    Text("Your name is visible only to you and can      be used for authentication purposes.\n")
                        .padding(.leading, 5)
                        .font(.custom("Ketibeh-Regular", size: 20))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.black)
                    Text("It may take some time for your changed name to show on your home screen.\n")
                        .padding(.trailing, 25)
                        .font(.custom("Ketibeh-Regular", size: 20))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.black)
                    TextField("", text: $name, prompt: Text("New name").foregroundStyle(.black.opacity(0.7))).modifier(changeDataModifier())
                    
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
}

#Preview {
    ChangeName(goBack: .constant(false))
}
