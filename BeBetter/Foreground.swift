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
                    
            LinearGradient(colors: [Color(#colorLiteral(red: 1, green: 0.8245059848, blue: 0, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.329893887, blue: 0.3010276556, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
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
                                .font(.custom("Big Movie", size: 50))
                                .frame(width: 180, height: 160, alignment: .bottomTrailing)
                                .padding(.top)
                                .foregroundStyle(.black)
                        )
                   
                        
                Spacer()
                Text("By Beees").font(.custom("Big Movie", size: 40))
                    .foregroundStyle(.black)
            }
        
        }
//        .frame(width: .infinity, height: .infinity)
       
        
        
        
        
        
        
        

        
        
    }
    
    
}

#Preview {
    Foreground()
}
