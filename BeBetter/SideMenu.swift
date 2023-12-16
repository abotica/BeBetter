//
//  SideMenu.swift
//  BeBetter
//
//  Created by Karlo Nevešćanin on 15.12.2023..
//

import SwiftUI

struct SideMenu: View {
    @State var Screen_Width = Register_screen(goBack: .constant(false), removeLoginView: .constant(false), isRegistered: .constant(false), isShownOnce: .constant(true)).Screen_Width
    @State var Screen_Height = Register_screen(goBack: .constant(false), removeLoginView: .constant(false), isRegistered: .constant(false), isShownOnce: .constant(true)).Screen_Height
    
    @Binding var showMainView: Bool
    
    var body: some View {
        
            VStack{
                Button(action: {
                    
                    //sa animacijon trigera tamo u nekon if-u da se pokaže view
                    
                        showMainView.toggle()
                    
                    
                }, label: {
                    HStack{
                        Image(systemName: "gearshape.fill").font(.largeTitle).bold()
                            .foregroundStyle(Color.accentColorInvert)
                        
                        Text("Settings")
                            .font(.custom("Ketibeh-Regular", size: 27))
                            .frame(width: 100, height: 100)
                            .foregroundStyle(Color.accentColorInvert)
                        
                    }
                })
                
                Divider()
                    .frame(width: 150, height: 2)
                    .background(LinearGradient(colors: [Color(#colorLiteral(red: 0.9139844775, green: 0.767064631, blue: 0.4150085449, alpha: 1)), Color(#colorLiteral(red: 0.9025250077, green: 0.4324684143, blue: 0.3178541958, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing))
                
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        Image(systemName: "power").font(.largeTitle).bold()
                            .foregroundStyle(Color.accentColorInvert)
                        
                        Text("Log out")
                            .font(.custom("Ketibeh-Regular", size: 27))
                            .frame(width: 100, height: 100)
                            .foregroundStyle(Color.accentColorInvert)
                        
                    }
                })
                
                Spacer()
                
                Text("Version 1.0")
                    .font(.custom("Ketibeh-Regular", size: 13))
                    .frame(width: 100, height: 100)
                    .foregroundStyle(Color.accentColorInvert)
                
            }
            .frame(width: Screen_Width / 3)
            .padding(.top, 100)
            .padding(.horizontal, 30)
            .background(Color.accentColor)
            .overlay(Rectangle().frame(width: 1, height: nil, alignment: .bottom).foregroundColor(Color.accentColorInvert), alignment: .trailing)
            .overlay(Rectangle().frame(width: 1, height: nil, alignment: .top).foregroundColor(Color.accentColorInvert), alignment: .leading)
            .ignoresSafeArea(.all)

                
    }
    }
    

#Preview {
    SideMenu(showMainView: .constant(true))
}
