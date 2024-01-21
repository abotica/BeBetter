//
//  ContentView.swift
//  BeBetter
//
//  Created by Karlo Nevešćanin on 21.01.2024..
//

import SwiftUI

struct ContentView: View {
    @Binding var goBack: Bool
    @State var Screen_Width = UIScreen.main.bounds.width
    @State var Screen_Height = UIScreen.main.bounds.height
    var body: some View {
        VStack {
            Spacer()
            Home()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.BG)
            .preferredColorScheme(.light)
        }.overlay(){
            Circle()
                .opacity(0)
                .overlay(){
                    Button(action: {
                        
                        goBack.toggle()
                    
                        }, label: {
                    
                            Image(systemName: "arrow.left")
    //                                .shadow( radius: 1, x: 1, y: 0.5)
                                    .foregroundStyle(.accentColorInvert)
                                    .fontWeight(.black)
                                   
                                        })
                    
                                    
                }
                .frame(width: Screen_Width*0.1, height: Screen_Height*0.03)
                .offset(x: -Screen_Width*0.4, y: -Screen_Height*0.43)
        }
        
    }
}

#Preview {
    ContentView(goBack: .constant(false))
}
