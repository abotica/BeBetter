//
//  SettingsButton.swift
//  BeBetter
//
//  Created by Andrija Botica on 18.10.2023..
//

import SwiftUI

struct SettingsButton: View {
    
    @State var isCLicked: Bool = false
    @State var isPressed: Bool = false

    var body: some View {
        
        
        Button(action: {
            
            isPressed.toggle()
            
            withAnimation(.bouncy(extraBounce: 0.3)){
                isCLicked.toggle()
            }
            
        }, label: {
            
            VStack{
                Image(systemName: "line.3.horizontal")
                    .rotationEffect(.degrees(isCLicked ? -90 : 0))
                    .foregroundStyle(Color("AccentColorInvert"))
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)
                if isPressed{
                    OptionsView()
                        .transition(.move(edge: .trailing))
                }
            }
                
            
        })
        
        
        
    }
}

#Preview {
    SettingsButton()
}
