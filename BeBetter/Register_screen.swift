//
//  Register_screen.swift
//  beBetter
//
//  Created by Karlo Nevešćanin on 13.12.2023..
//

import SwiftUI

struct Register_screen: View {
    @ObservedObject var KorisnikModel = KorisnikViewModel()
    @Binding var goBack: Bool
    @Binding var removeLoginView: Bool
    @Binding var isRegistered: Bool
    @Binding var isShownOnce: Bool
    @State var isActivated: Bool = false
    @State var Screen_Width = UIScreen.main.bounds.width
    @State var Screen_Height = UIScreen.main.bounds.height
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color(#colorLiteral(red: 0.9139844775, green: 0.767064631, blue: 0.4150085449, alpha: 1)), Color(#colorLiteral(red: 0.9025250077, green: 0.4324684143, blue: 0.3178541958, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
//                .safeAreaInset(edge: .top, alignment: .leading){
//                    
//                    Button(action: {
//                        
//                        //vrati se nazad
//                        
//                    }, label: {
//                        
//                        Circle()
//                            .opacity(0)
//                            .overlay(content: {
//                                Image(systemName: "arrow.left")
//                                    .shadow( radius: 1, x: 1, y: 0.5)
//                                    .foregroundStyle(.black)
//                                    .fontWeight(.black)
//                                    .clipShape(Circle())
//                            })
//                        .frame(width: Screen_Width*0.1)
//                        .padding(.top, Screen_Height*0.04)
//            
//                        
//                        
//                    })
//                    
//                }
            Circle()
                .opacity(0)
                .overlay(){
                    Button(action: {
                        
                        goBack = true
                        isRegistered = false
                        removeLoginView = false
                        isShownOnce = false
                    
                        }, label: {
                    
                            Image(systemName: "arrow.left")
                                    .shadow( radius: 1, x: 1, y: 0.5)
                                    .foregroundStyle(.black)
                                    .fontWeight(.black)
                                   
                                        })
                    
                                    
                }
                .frame(width: Screen_Width*0.1)
                .position(x: Screen_Width*0.1, y: Screen_Height*0.08)
                .onAppear(){
                    Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false){_ in
                        withAnimation(.bouncy(extraBounce: 0.3)){
                            isActivated.toggle()
                        }
                    }
                }
            
            
            VStack(spacing: Screen_Height*0.026){
                Spacer(minLength: Screen_Height*0.05)
                Image("Bee")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .shadow(color: .white, radius: 3)
                
                Spacer(minLength: Screen_Height*0)
                
                HStack(spacing: 0.1)
                                {
                                    isActivated ? Spacer(minLength: Screen_Width*0.14) : Spacer(minLength: Screen_Width*0.2)
                                    Text("Name: ")
                                        .font(.title3)
                                        .foregroundStyle(Color.black)
                                        .italic()
                                        .bold()
                                        .padding()
                                    
                                    TextField(isActivated ? "Required" : "", text: $KorisnikModel.korisnik.name)
                                        .frame(width: isActivated ? Screen_Width*0.5:50, height: isActivated ? 55:50)
                                        .background(Color.white)
                                        .font(.title3)
                                        .foregroundStyle(Color.black)
                                        .cornerRadius(50)
                                        .multilineTextAlignment(.center)
                                        .shadow(color: .black, radius: 1, x:6, y: 10)
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.01) : Spacer(minLength: Screen_Width*0.2)
                                }
                                
                                HStack(spacing: 0.1){
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.01) : Spacer(minLength: Screen_Width*0.2)
                                    Text("Surname: ")
                                        .font(.title3)
                                        .foregroundStyle(Color.black)
                                        .italic()
                                        .bold()
                                        .padding()
                            
                                    
                                    TextField(isActivated ? "Required" : "", text: $KorisnikModel.korisnik.surname)
                                        .frame(width: isActivated ? Screen_Width*0.5:50, height: isActivated ? 55:50)
                                        .background(Color.white)
                                        .font(.title3)
                                        .foregroundStyle(Color.black)
                                        .cornerRadius(50)
                                        .multilineTextAlignment(.center)
                                        .shadow(color: .black, radius: 1, x:6, y: 10)
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.1) : Spacer(minLength: Screen_Width*0.31)
                                
                            }
                                
                                HStack(spacing: 0.1){
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.01) : Spacer(minLength: Screen_Width*0.2)
                                    Text("Username: ")
                                        .font(.title3)
                                        .foregroundStyle(Color.black)
                                        .italic()
                                        .bold()
                                        .padding()
                                    
                                    
                                    TextField(isActivated ? "Required" : "", text: $KorisnikModel.korisnik.username)
                                        .frame(width: isActivated ? Screen_Width*0.5:50, height: isActivated ? 55:50)
                                        .background(Color.white)
                                        .font(.title3)
                                        .foregroundStyle(Color.black)
                                        .cornerRadius(50)
                                        .multilineTextAlignment(.center)
                                        .shadow(color: .black, radius: 1, x:6, y: 10)
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.1) : Spacer(minLength: Screen_Width*0.31)
                                }
                                
                                HStack(spacing: 0.1){
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.16) : Spacer(minLength: Screen_Width*0.32)
                                    Text("Email: ")
                                        .font(.title3)
                                        .foregroundStyle(Color.black)
                                        .italic()
                                        .bold()
                                        .padding()
                                    
                                    
                                    TextField(isActivated ? "Required" : "", text: $KorisnikModel.korisnik.email)
                                        .frame(width: isActivated ? Screen_Width*0.5:50, height: isActivated ? 55:50)
                                        .background(Color.white)
                                        .font(.title3)
                                        .foregroundStyle(Color.black)
                                        .cornerRadius(50)
                                        .multilineTextAlignment(.center)
                                        .shadow(color: .black, radius: 1, x:6, y: 10)
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.0) : Spacer(minLength: Screen_Width*0.06)
                                }
                                
                                HStack(spacing: 0.1){
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.01) : Spacer(minLength: Screen_Width*0.2)
                                    Text("Password: ")
                                        .font(.title3)
                                        .foregroundStyle(Color.black)
                                        .italic()
                                        .bold()
                                        .padding()
                                    
                                    
                                    SecureField(isActivated ? "Required" : "", text: $KorisnikModel.korisnik.password)
                                        .frame(width: isActivated ? Screen_Width*0.5:50, height: isActivated ? 55:50)
                                        .background(Color.white)
                                        .font(.title3)
                                        .foregroundStyle(Color.black)
                                        .cornerRadius(50)
                                        .multilineTextAlignment(.center)
                                        .shadow(color: .black, radius: 1, x:6, y: 10)
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.1) : Spacer(minLength: Screen_Width*0.31)
                                }
                                
                                HStack(spacing: 23){
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.01) : Spacer(minLength: Screen_Width*0.2)
                                    Text("Confirm\npassword:")
                                        .font(.title3)
                                        .foregroundStyle(Color.black)
                                        .italic()
                                        .bold()
                                        .multilineTextAlignment(.center)
                                                            
                                    
                                    SecureField(isActivated ? "Required" : "", text: $KorisnikModel.korisnik.confirmPassword)
                                        .frame(width: isActivated ? Screen_Width*0.5:50, height: isActivated ? 55:50)
                                        .background(Color.white)
                                        .font(.title3)
                                        .foregroundStyle(Color.black)
                                        .cornerRadius(50)
                                        .multilineTextAlignment(.center)
                                        .shadow(color: .black, radius: 1, x:6, y: 10)
                                    
                                   
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.01) : Spacer(minLength: Screen_Width*0.25)
                                    
                                    
                                }
                
                
                Spacer(minLength: Screen_Height*0)
                Button(action:
                        {
                    KorisnikModel.sendDataToServer()
                }, label: {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .frame(width: isActivated ? Screen_Width*0.3 : 50, height: isActivated ? 55 : 50)
                        .shadow(color: .black, radius: 1, x:6, y: 8)
                        .overlay(
                            Text(isActivated ? "Register" : "")
                                .font(.title3)
                                .foregroundStyle(Color.black)
                                .italic()
                                .bold()
                        
                        )
                    
                })


                Spacer(minLength: Screen_Height*0.05)
            }
        }
    }
}

#Preview {
    Register_screen(goBack: .constant(false), removeLoginView: .constant(false), isRegistered: .constant(false), isShownOnce: .constant(true))
}
