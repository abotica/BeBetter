//
//  Register_screen.swift
//  beBetter
//
//  Created by Karlo Nevešćanin on 13.12.2023..
//

import SwiftUI

struct Register_screen: View {
    @ObservedObject var KorisnikModel = KorisnikViewModel()
//    @State var ime = ""
//    @State var prezime = ""
//    @State var username = ""
//    @State var email = ""
//    @State var password = ""
//    @State var confirmed_password = ""
    @State var isActivated: Bool = false
    @State var Screen_Width = UIScreen.main.bounds.width
    @State var Screen_Height = UIScreen.main.bounds.height
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color(#colorLiteral(red: 0.9139844775, green: 0.767064631, blue: 0.4150085449, alpha: 1)), Color(#colorLiteral(red: 0.9025250077, green: 0.4324684143, blue: 0.3178541958, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
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
                    .frame(width: Screen_Width*0.3 , height: Screen_Height*0.16)
                    .shadow(color: .black, radius: 5, x:6, y: 10)
                
                Spacer(minLength: Screen_Height*0)
                
                HStack(spacing: 0.1)
                                {
                                    isActivated ? Spacer(minLength: Screen_Width*0.14) : Spacer(minLength: Screen_Width*0.2)
                                    Text("Name: ")
                                        .font(.title2)
                                        .italic()
                                        .foregroundStyle(Color.black)
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
                                        .font(.title2)
                                        .italic()
                                        .foregroundStyle(Color.black)
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
                                        .font(.title2)
                                        .italic()
                                        .foregroundStyle(Color.black)
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
                                        .font(.title2)
                                        .italic()
                                        .foregroundStyle(Color.black)
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
                                        .font(.title2)
                                        .italic()
                                        .foregroundStyle(Color.black)
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
                                        .font(.title2)
                                        .italic()
                                        .foregroundStyle(Color.black)
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
                        
                        )
                    
                })


                Spacer(minLength: Screen_Height*0.05)
            }
        }
    }
}

#Preview {
    Register_screen()
}
