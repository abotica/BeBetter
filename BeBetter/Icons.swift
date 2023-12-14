//
//  Icons.swift
//  BeBetter
//
//  Created by Andrija Botica on 13.12.2023..
//

import Foundation
//
//  Icons.swift
//  eKafic
//
//  Created by Andrija Botica on 13.10.2023..
//

import SwiftUI

struct Icons: View {
    
    var body: some View {
        
        Button(action: {
            
            
            
        }, label: {
           
            
            Image("Study")
                .resizable()
                .frame(width: 250, height: 200)
                .background(LinearGradient(colors: [Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: Color("AccentColorInvert"), radius: 0, x: 5, y: 8)
                .overlay(Text("Study").font(.custom("Big Movie", size: 40)), alignment: .top)
                .foregroundStyle(Color("AccentColorInvert"))
                
            
            
            
            })
        
        Button(action: {
            
            
            
        }, label: {
           
            
            Image("Work")
                .resizable()
                .frame(width: 250, height: 200)
                .background(LinearGradient(colors: [Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: Color("AccentColorInvert"), radius: 0, x: 5, y: 8)
                .overlay(Text("Work").font(.custom("Big Movie", size: 40)), alignment: .top)
                .foregroundStyle(Color("AccentColorInvert"))
            
            
            
            })
        
        Button(action: {
            
            
            
        }, label: {
           
            
            Image("Workout")
                .resizable()
                .frame(width: 250, height: 200)
                .background(LinearGradient(colors: [Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: Color("AccentColorInvert"), radius: 0, x: 5, y: 8)
                .overlay(Text("Workout").font(.custom("Big Movie", size: 40)), alignment: .top)
                .foregroundStyle(Color("AccentColorInvert"))
                
                
            
            
            
            })
        
        
        
        }
           
    }




#Preview {
    Icons()
}


