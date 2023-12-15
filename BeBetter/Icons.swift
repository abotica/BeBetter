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
    
    @State var background = LinearGradient(colors: [Color(#colorLiteral(red: 0.9139844775, green: 0.767064631, blue: 0.4150085449, alpha: 1)), Color(#colorLiteral(red: 0.9025250077, green: 0.4324684143, blue: 0.3178541958, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    @State var width:CGFloat = 250
    @State var height:CGFloat = 200
    @State var cornerRadius: CGFloat = 25
    @State var fontSize: CGFloat = 40
    @State var fontName: String = "Katibeh-Regular"
    @State var appColor: String = "AccentColorInvert"
    @State var shadowX: CGFloat = 3
    @State var shadowY: CGFloat = 6
    @State var shadowRadius: CGFloat = 0
    
    var body: some View {
        
        Button(action: {
            
            
            
        }, label: {
           
            
            Image("Study")
                .resizable()
                .frame(width: width, height: height)
                .background(background)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .shadow(color: Color(appColor), radius: shadowRadius, x: shadowX, y: shadowY)
                .overlay(Text("Study").font(.custom(fontName, size: fontSize)).padding(), alignment: .top)
                .foregroundStyle(Color(appColor))
                
            
            
            
            })
        
        Button(action: {
            
            
            
        }, label: {
           
            
            Image("Work")
                .resizable()
                .frame(width: width, height: height)
                .background(background)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .shadow(color: Color(appColor), radius: shadowRadius, x: shadowX, y: shadowY)
                .overlay(Text("Work").font(.custom(fontName, size: fontSize)).padding(), alignment: .top)
                .foregroundStyle(Color(appColor))
            
            
            
            })
        
        Button(action: {
            
            
            
        }, label: {
           
            
            Image("Workout")
                .resizable()
                .frame(width: width, height: height)
                .background(background)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .shadow(color: Color(appColor), radius: shadowRadius, x: shadowX, y: shadowY)
                .overlay(Text("Workout").font(.custom(fontName, size: fontSize)).padding(), alignment: .top)
                .foregroundStyle(Color(appColor))
                
                
            
            
            
            })
        
        
        
        }
           
    }




#Preview {
    Icons()
}


