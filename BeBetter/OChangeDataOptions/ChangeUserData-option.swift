//
//  ChangeUserData-option.swift
//  BeBetter
//
//  Created by Andrija Botica on 15.01.2024..
//

import SwiftUI

struct ChangeUserData_option: View {
    @State var Screen_Width = UIScreen.main.bounds.width
    @State var Screen_Height = UIScreen.main.bounds.height
    var body: some View {
        
        
        VStack {
            HStack {
    
                Circle()
                    .opacity(0)
                    .overlay(){
                        Button(action: {
                            
    //                        goBack = true
    //                        isRegistered = false
    //                        removeLoginView = false
    //                        isShownOnce = false
                        
                            }, label: {
                        
                                Image(systemName: "arrow.left")
    //                                    .shadow( radius: 1, x: 1, y: 0.5)
                                        .foregroundStyle(.black)
                                        .fontWeight(.black)
                                       
                                            })
                        
                                        
                    }
                    .frame(width: Screen_Width*0.1, height: Screen_Height*0.03)
                .offset(x: -Screen_Width*0.4, y: Screen_Height*0.001)
                
            }
                
            Divider()
                .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
            Button(action: {
                
                
            }, label: {
                HStack{
                    
                    Text("                 Change name                  >")
                        .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                        
                }
            })
           
            Divider()
                .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
            Button(action: {
                
                
            }, label: {
                HStack{
                    
                    Text("                 Change surname             >")
                        .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                }
            })
            Divider()
                .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
            Button(action: {
                
                
            }, label: {
                HStack{
                    
                    Text("                 Change username           >")
                        .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                }
                
            })
            Divider()
                .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
            Button(action: {
                
                
            }, label: {
                HStack{
                    
                    Text("                  Change password           >")
                        .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                }
            })
            
            Divider()
                .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
        }
        .padding(.bottom, Screen_Height/2.3)
        
    }
}

#Preview {
    ChangeUserData_option()
}
