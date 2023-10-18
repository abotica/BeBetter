//
//  Background.swift
//  eKafic
//
//  Created by Andrija Botica on 13.10.2023..
//

import SwiftUI

struct Background: View {
    var body: some View {
        

        LinearGradient(colors: [Color(#colorLiteral(red: 0.9993855357, green: 0.8329706788, blue: 0.4883880019, alpha: 1)), Color(#colorLiteral(red: 0.9725125432, green: 0.6108481288, blue: 0.347471714, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
        
    }
}

#Preview {
    Background()
}
