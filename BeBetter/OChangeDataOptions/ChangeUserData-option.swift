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
    @State var showName = false
    @State var showSurname = false
    @State var showUsername = false
    @State var showPassowrd = false
    
    @Binding var goBack: Bool
    var body: some View {
        
        
        VStack {
            HStack {
    
                Circle()
                    .opacity(0)
                    .overlay(){
                        Button(action: {
                            goBack.toggle()
    //                        goBack = true
    //                        isRegistered = false
    //                        removeLoginView = false
    //                        isShownOnce = false
                        
                            }, label: {
                        
                                Image(systemName: "arrow.left")
    //                                    .shadow( radius: 1, x: 1, y: 0.5)
                                    .foregroundStyle(.accentColorInvert)
                                        .fontWeight(.black)
                                       
                                            })
                        
                                        
                    }
                    .frame(width: Screen_Width*0.1, height: Screen_Height*0.03)
                .offset(x: -Screen_Width*0.4, y: Screen_Height*0.001)
                
            }
                
            Divider()
                .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
            Button(action: {
                
                showName.toggle()
                
            }, label: {
                HStack{
                    
                    Text("Change name")
                        .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                        .overlay(Image(systemName: "pencil.line")
                            .modifier(imageSettingsModifier()))
                        
                }
            })
            .fullScreenCover(isPresented: $showName, content: {
                ChangeName(goBack: $showName)})
           
            Divider()
                .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
            Button(action: {
                
                showSurname.toggle()
                
            }, label: {
                HStack{
                    
                    Text("Change surname")
                        .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                        .overlay(Image(systemName: "scribble")
                            .modifier(imageSettingsModifier()))
                }
            })
            .fullScreenCover(isPresented: $showSurname, content: {
                ChangeSurname(goBack: $showSurname)})
            
            Divider()
                .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
            Button(action: {
                
                showUsername.toggle()
                
            }, label: {
                HStack{
                    
                    Text("Change username")
                        .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                        .overlay(Image(systemName: "person.fill.questionmark")
                            .modifier(imageSettingsModifier()))
                }
                
            })
            .fullScreenCover(isPresented: $showUsername, content: {
                ChangeUsername(goBack: $showUsername)})
            
            Divider()
                .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
            Button(action: {
                
                showPassowrd.toggle()
                
            }, label: {
                HStack{
                    
                    Text("Change password")
                        .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                        .overlay(Image(systemName: "key.fill")
                            .modifier(imageSettingsModifier()))
                }
            })
            .fullScreenCover(isPresented: $showPassowrd, content: {
                ChangePassword(goBack: $showPassowrd)})
            
            Divider()
                .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
        }
        .padding(.bottom, Screen_Height/2.3)
        
    }
}

#Preview {
    ChangeUserData_option(goBack: .constant(false))
}
