//
//  Foreground.swift
//  beBetter
//
//  Created by Andrija Botica on 15.10.2023..
//

import SwiftUI

struct Foreground: View {
    
    
    var body: some View {
                ZStack{
            
            LinearGradient(colors: [Color(#colorLiteral(red: 0.9993855357, green: 0.8329706788, blue: 0.4883880019, alpha: 1)), Color(#colorLiteral(red: 0.9725125432, green: 0.6108481288, blue: 0.347471714, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                    Image("Bee")
                        .resizable()
                        .shadow(color: Color(.white), radius: 3 )
                        .frame(width: 150, height: 150)
                        .overlay(
                           
                            Text("Better")
                                .shadow(color: Color(.white), radius: 3, x: 3, y: 3)
                                .rotationEffect(.degrees(-20))
                                .font(.custom("Snell Roundhand Black", size: 40))
                                .frame(width: 180, height: 160, alignment: .bottomTrailing)
                            
                        )
                   
                        
                Spacer()
                Text("By Beees").font(.custom("Snell Roundhand Bold", size: 20))
                
            }
        
        }
//        .frame(width: .infinity, height: .infinity)
       
        
        
        
        
        
        
        

        
        
    }
    
    
}

#Preview {
    Foreground()
}
