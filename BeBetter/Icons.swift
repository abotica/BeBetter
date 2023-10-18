//
//  Icons.swift
//  eKafic
//
//  Created by Andrija Botica on 13.10.2023..
//

import SwiftUI

struct Icons: View {
    
    var body: some View {
        
        //Hedgehog
        ForEach(0..<10){index in
            Circle()
                .fill(Color(#colorLiteral(red: 0.9294186234, green: 0.8603298068, blue: 0.7263699174, alpha: 1)))
                .frame(width: 175, height: 175)
                .overlay(
                    Text("🦔")
                        .shadow(radius: 0.3)
                        .font(.largeTitle)
                )
                .shadow(color: Color(#colorLiteral(red: 0.2117646933, green: 0.2117646933, blue: 0.2117646933, alpha: 0.6)), radius: 3.5, x: 5, y: 5)
        }
        
    }
    
    
}



#Preview {
    Icons()
}
