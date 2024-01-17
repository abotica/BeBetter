//
//  SettingsView.swift
//  BeBetter
//
//  Created by Andrija Botica on 16.12.2023..
//

import SwiftUI

struct textSettingsModifier: ViewModifier{
    @Binding var screenWidth : CGFloat
    @Binding var screenHeight : CGFloat
    func body(content: Content) -> some View{
        content
        .font(.custom("Ketibeh-Regular", size: 22))
        .frame(width: screenWidth/2, height: 70)
        .foregroundStyle(Color.accentColorInvert)
    }

}

struct dividerSettingsModifier: ViewModifier{
    @Binding var screenWidth : CGFloat
    @Binding var screenHeight : CGFloat
    func body(content: Content) -> some View{
        content
            .frame(height: 2)
            .background(LinearGradient(colors: [Color(#colorLiteral(red: 0.9139844775, green: 0.767064631, blue: 0.4150085449, alpha: 1)), Color(#colorLiteral(red: 0.9025250077, green: 0.4324684143, blue: 0.3178541958, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct imageSettingsModifier: ViewModifier{
    func body(content: Content) -> some View{
        content
            .font(.title2)
            .bold()
            .foregroundStyle(Color.accentColorInvert)
            .padding(.trailing, 300)
            
    }

}

struct SettingsView: View {
    @State private var showChangeUserDataOptions = false
    @State var Screen_Width = Register_screen(goBack: .constant(false), removeLoginView: .constant(false), isRegistered: .constant(false), isShownOnce: .constant(true)).Screen_Width
    @State var Screen_Height = Register_screen(goBack: .constant(false), removeLoginView: .constant(false), isRegistered: .constant(false), isShownOnce: .constant(true)).Screen_Height
    @Binding var showMainView: Bool
    
    
    var body: some View {
        
        
        Circle()
            .opacity(0)
            .overlay(){
                Button(action: {
                    
                    showMainView = true
                
                    }, label: {
                
                        Image(systemName: "arrow.left")
//                                .shadow( radius: 1, x: 1, y: 0.5)
                                .foregroundStyle(.accentColorInvert)
                                .fontWeight(.black)
                               
                                    })
                
                                
            }
            .frame(width: Screen_Width*0.1, height: Screen_Height*0.03)
            .offset(x: -Screen_Width*0.4, y: Screen_Height*0.001)
        
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(spacing: 5) {
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                Button(action: {
                    
                    showChangeUserDataOptions.toggle()
                    
                }, label: {
                    HStack{
                        
                        Text("Change user data")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                            .overlay(Image(systemName: "person.circle.fill")
                                .modifier(imageSettingsModifier()))
                    }
                })
                .fullScreenCover(isPresented: $showChangeUserDataOptions, content: {
                    ChangeUserData_option(goBack: $showChangeUserDataOptions)})
                
                    
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                    
                        Text("Themes")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                            .overlay(Image(systemName: "paintbrush.fill")
                                .modifier(imageSettingsModifier()))
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        
                        
                        Text("Notificiation")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                            .overlay(Image(systemName: "bell.fill")
                                .modifier(imageSettingsModifier()))
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        
                        
                        Text("Payments")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                            .overlay(Image(systemName: "creditcard.fill")
                                .modifier(imageSettingsModifier()))
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        
                        
                        Text("Synchronize profile")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                            .overlay(Image(systemName: "arrow.triangle.2.circlepath")
                                .modifier(imageSettingsModifier()))
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        
                        
                        Text("Permissions")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                            .overlay(Image(systemName: "shield.lefthalf.filled.badge.checkmark")
                                .modifier(imageSettingsModifier()))
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        
                        
                        Text("Language")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                            .overlay(
                                Image("LanguageIcon")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(Color.accentColorInvert)
                                .padding(.trailing, 300))
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        
                        
                        Text("FAQ")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                            .overlay(Image(systemName: "bubble.left.and.text.bubble.right.fill")
                                .modifier(imageSettingsModifier()))
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        
                        
                        Text("News")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                            .overlay(Image(systemName: "newspaper.fill")
                                .modifier(imageSettingsModifier()))
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        
                        
                        Text("Feedback")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                            .overlay(Image(systemName: "exclamationmark.bubble.fill")
                                .modifier(imageSettingsModifier()))
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        
                        
                        Text("ToS and privacy")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                            .overlay(Image(systemName: "doc.text.fill")
                                .modifier(imageSettingsModifier()))
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        
                        
                        Text("Rate us")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                            .overlay(Image(systemName: "hand.thumbsup.fill")
                                .modifier(imageSettingsModifier()))
                    }
                })
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))

            }
        }
    }
}
#Preview {
    SettingsView(showMainView: .constant(false))
}
