//
//  NavigationBar.swift
//  BeBetter
//
//  Created by Karlo Nevešćanin on 14.12.2023..
//

import SwiftUI

struct NavigationBar: View {
    @State var Screen_Width =  Register_screen(goBack: .constant(false), removeLoginView: .constant(false), isRegistered: .constant(false), isShownOnce: .constant(true)).Screen_Width
    @State var Screen_Height =  Register_screen(goBack: .constant(false), removeLoginView: .constant(false), isRegistered: .constant(false), isShownOnce: .constant(true)).Screen_Height
    var body: some View {

            HStack(){

                Text("beBetter").font(.custom("Katibeh-Regular", size: 40)).padding(.leading, 20).overlay(Image("Bee")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .rotationEffect(.degrees(25)).position(x: 14, y: 4)
                    .shadow(color: .accentColorInvert, radius: 1)
                )
                        .font(.custom("Katibeh-Regular" ,size: 20))
                        .frame(width: Screen_Width*0.43, height: 60)
                        .foregroundStyle(Color.accentColorInvert)
                        .padding(.top, 160)
                        



                    Spacer()


            }
    }
}

#Preview {
    NavigationBar()
        .previewLayout(.sizeThatFits)
}
