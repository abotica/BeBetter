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
        .font(.custom("Ketibeh-Regular", size: 27))
        .frame(width: screenWidth/1.5, height: 100)
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
            .font(.largeTitle)
            .bold()
            .foregroundStyle(Color.accentColorInvert)
    }

}

struct SettingsView: View {
    @State var Screen_Width = Register_screen(goBack: .constant(false), removeLoginView: .constant(false), isRegistered: .constant(false), isShownOnce: .constant(true)).Screen_Width
    @State var Screen_Height = Register_screen(goBack: .constant(false), removeLoginView: .constant(false), isRegistered: .constant(false), isShownOnce: .constant(true)).Screen_Height
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(spacing: 5) {
                Button(action: {
                    
                }, label: {
                    HStack{
                        Image(systemName: "person.circle.fill")
                            .modifier(imageSettingsModifier())
                        
                        Text("Change user data")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                        
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        Image(systemName: "paintbrush.fill")
                            .modifier(imageSettingsModifier())
                        
                        Text("Themes")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                        
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        Image(systemName: "bell.fill")
                            .modifier(imageSettingsModifier())
                        
                        Text("Notificiation")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                        
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        Image(systemName: "creditcard.fill")
                            .modifier(imageSettingsModifier())
                        
                        Text("Payments")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                        
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .modifier(imageSettingsModifier())
                        
                        Text("Synchronize profile")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                        
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        Image(systemName: "shield.lefthalf.filled.badge.checkmark")
                            .modifier(imageSettingsModifier())
                        
                        Text("Permissions")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                        
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        Image("LanguageIcon")
                            .resizable()
                            .frame(width: 43, height: 43)
                            .foregroundStyle(Color.accentColorInvert)
                        
                        Text("Language")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                        
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        Image(systemName: "bubble.left.and.text.bubble.right.fill")
                            .modifier(imageSettingsModifier())
                        
                        Text("FAQ")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                        
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        Image(systemName: "newspaper.fill")
                            .modifier(imageSettingsModifier())
                        
                        Text("News")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        Image(systemName: "exclamationmark.bubble.fill")
                            .modifier(imageSettingsModifier())
                        
                        Text("Feedback")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                        
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        Image(systemName: "doc.text.fill")
                            .modifier(imageSettingsModifier())
                        
                        Text("Terms of service & privacy settings")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                        
                    }
                })
                
                Divider()
                    .modifier(dividerSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                
                Button(action: {
                    
                    
                }, label: {
                    HStack{
                        Image(systemName: "hand.thumbsup.fill")
                            .modifier(imageSettingsModifier())
                        
                        Text("Rate us")
                            .modifier(textSettingsModifier(screenWidth: $Screen_Width, screenHeight: $Screen_Height))
                        
                    }
                })
                

            }
        }
    }
}
#Preview {
    SettingsView()
}
