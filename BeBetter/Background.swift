//
//  Background.swift
//  eKafic
//
//  Created by Andrija Botica on 13.10.2023..
//

import SwiftUI

struct Background: View {
    var body: some View {
        

        LinearGradient(colors: [Color(#colorLiteral(red: 1, green: 0.8245059848, blue: 0, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.329893887, blue: 0.3010276556, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
        
    }
}

#Preview {
    Background()
}
