//
//  OptionsView.swift
//  BeBetter
//
//  Created by Andrija Botica on 19.10.2023..
//

import SwiftUI

struct OptionsView: View {
    var body: some View {
        
        VStack{
            
            Button(action: {
                
                
            }, label: {
                Image(systemName: "gearshape.fill").font(.largeTitle).bold()
                    .foregroundStyle(Color("AccentColorInvert"))
            })
           
            Button(action: {
                
                
            }, label: {
                Image(systemName: "power").font(.largeTitle).bold()
                    .foregroundStyle(Color("AccentColorInvert"))
            })
            
            
            
        }
        
        
    }
}

#Preview {
    OptionsView()
}
