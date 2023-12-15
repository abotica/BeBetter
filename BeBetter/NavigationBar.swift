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

                        Text("beBetter")
                        .overlay(content: {
                            Image("Bee")
                                .resizable()
                                .frame(width: Screen_Width*0.1, height: Screen_Height*0.06)
                                .rotationEffect(.degrees(-25))
                                .shadow(color: .black, radius: 4, x:2, y: 6)
                                .position(x: Screen_Width*(-0.09), y: Screen_Height*(0.018))
                                .padding(.leading, 10)

                        })
                        .padding(.leading, 40)
                        .font(.custom("Katibeh-Regular" ,size: 20))
                        .frame(width: Screen_Width*0.36, height: 60)
                        .foregroundStyle(Color.black)


                    Spacer()


            }
    }
}

#Preview {
    NavigationBar()
        .previewLayout(.sizeThatFits)
        .padding()
}
