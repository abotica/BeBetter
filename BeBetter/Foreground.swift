//
//  Foreground.swift
//  beBetter
//
//  Created by Andrija Botica on 15.10.2023..
//

import SwiftUI

struct Foreground: View {
    
    @State var beeOpacity: Double = 0.0
    @State var textOpacity: Double = 0.0
    var body: some View {
                ZStack{
                    
            LinearGradient(colors: [Color(#colorLiteral(red: 0.9139844775, green: 0.767064631, blue: 0.4150085449, alpha: 1)), Color(#colorLiteral(red: 0.9025250077, green: 0.4324684143, blue: 0.3178541958, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                    Image("Bee")
                        .resizable()
                        .shadow(color: Color(.white), radius: 3 )
                        .opacity(beeOpacity)
                        .frame(width: 150, height: 150)
                        .overlay(
                           
                            Text("Better")
                                .shadow(color: Color(.white), radius: 5)
//                                .rotationEffect(.degrees(-20))
                                .font(.custom("Nosifer-Regular", size: 35))
                                .frame(width: 1000, height: 160, alignment: .bottom)
                                .padding(.top, 80)
                                .foregroundStyle(.black)
                                .opacity(textOpacity)
                                
                                
                        )
                        .onAppear(){
                            withAnimation(.linear(duration: 0.8)){
                                beeOpacity = 1.0
                                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false){_ in
                                    withAnimation(.linear(duration: 0.8)){
                                        textOpacity = 1.0
                                    }
                                }
                            }
                        }
                   
                        
                Spacer()
               
            }
        
        }
//        .frame(width: .infinity, height: .infinity)
       
        
        
        
        
        
        
        

        
        
    }
    
    
}

#Preview {
    Foreground()
}
