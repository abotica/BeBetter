//
//  MainView.swift
//  BeBetter
//
//  Created by Andrija Botica on 18.10.2023..
//

import SwiftUI

struct MainView: View {
    
    let hour = Calendar.current.component(.hour, from: Date())
    
    var body: some View {
    
       
        ZStack{
            Background2()
                .overlay(Text("beBetter").font(.custom("Katibeh-Regular", size: 40)).padding(.leading, 20).overlay(Image("Bee").resizable().frame(width: 25, height: 25).rotationEffect(.degrees(20)), alignment: .leading), alignment: .topLeading)
                .overlay(SettingsButton().padding(.top), alignment: .topTrailing)
            
            
            
            VStack{
                Divider()
                    
                    .foregroundStyle(Color("AccentColorInvert"))
                    .padding(.top, 50)
                    
                if(hour > 6 && hour < 12){
                    
                    Text("Good morning Andrija! What will you do?")
                        .foregroundStyle(Color.black)
                        .font(.custom("Big Movie", size: 35))
                        
                    
                }
                else if(hour >= 12 && hour < 17){
                    
                    Text("Good evening Andrija! What will you do?")
                        .font(.custom("Big Movie", size: 35))
                    
                }
                else{
                    
                    Text("Working late Andrija! What will you do?")
                        .font(.custom("Katibeh-Regular", size: 35))
                    
                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(spacing: 20) {
                        Icons()
                    }
                    .frame(height: 225)
                    
                    
                }
                Spacer()
                
            }

        }
    
        
    }
}

#Preview {
    MainView()
}
