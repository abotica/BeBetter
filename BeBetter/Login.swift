//
//  LoginView.swift
//  BeBetter
//
//  Created by Andrija Botica on 18.10.2023..
//

//
//  Login.swift
//  beBetter
//
//  Created by Karlo Nevešćanin on 18.10.2023..
//

import SwiftUI




struct Login: View {
    
    @ObservedObject var viewModel = KorisnikViewModel()
    @State var usernameLog: String = ""
    @State var passwordLog: String = ""
    @Binding var isLoggedIn: Bool
    @Binding var isRegistered: Bool
    @Binding var removeLoginView: Bool
    @State var isActivated: Bool = false
    @State var showForeground: Bool = true
    
    var body: some View {
     
        if(showForeground == true){
            
            Foreground().onAppear(){
                
                
                Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false){_ in
                    
                    withAnimation(.easeOut(duration: 0.3)){
                        
                        showForeground = false
                        
                    }
                    
                    
                }
                
            }
           
        }
        else{
            ZStack(alignment: .center){
                
                LinearGradient(colors: [Color(#colorLiteral(red: 0.9139844775, green: 0.767064631, blue: 0.4150085449, alpha: 1)), Color(#colorLiteral(red: 0.9025250077, green: 0.4324684143, blue: 0.3178541958, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                    .onAppear(){
                        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false){_ in
                            withAnimation(.bouncy(extraBounce: 0.3)){
                                isActivated.toggle()
                            }
                        }
                    }
                
                VStack(alignment: .center,spacing: 25){
                    Spacer()
                    Image("Bee")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .shadow(color: .white, radius: 3)

                    
                    
                    Text("Welcome!").font(.custom("Big Movie", size: 60))
                        .foregroundStyle(.black)
                    
                  
                    
                    
                    
                    
                    HStack(alignment: .center)
                    {
                       
                        TextField(isActivated ? "Username" : "", text: $usernameLog)
                            .bold()
                            .frame(width: isActivated ? 220 : 50, height: isActivated ? 55 : 50)
                            .background(Color.white)
                            .font(.title3)
                            .cornerRadius(50)
                            .multilineTextAlignment(.center)
                            .shadow(color: .black, radius: 1, x:6, y: 10)
                            
                    }
                        
                    HStack(alignment: .center){
                            
                        SecureField(isActivated ? "Password" : "", text: $passwordLog)
                                .bold()
                                .frame(width: isActivated ? 220 : 50, height: isActivated ? 55 : 50)
                                .background(Color.white)
                                .font(.title3)
                                .cornerRadius(50)
                                .multilineTextAlignment(.center)
                                .shadow(color: .black, radius: 1, x:6, y: 10)
                            
                    }
                    
                    HStack(spacing: 20)
                    {
                        
                        Spacer()
                        Button(action:
                                {
                            
                           isLoggedIn = true
                            removeLoginView = true
                        
                            
                            
                            
                        }, label: {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.white)
                                .frame(width: isActivated ? 140 : 50, height: isActivated ? 55 : 50)
                                .shadow(color: .black, radius: 1, x:6, y: 8)
                                .overlay(
                                    Text(isActivated ? "Login" : "")
                                        .font(.title3)
                                        .foregroundStyle(Color.black)
                                        .italic()
                                        .bold()
                                )
                            
                        })
                        
                        
                        Spacer()
                        
                        Button(action:
                                {
                            //ovo ubacit prilikom slanja podataka bazi
//                            viewModel.sendDataToServer()
                            isRegistered = true
                            removeLoginView = true
                            
                            
                        }, label: {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.white)
                                .frame(width: isActivated ? 140 : 50, height: isActivated ? 55 : 50)
                                .shadow(color: .black, radius: 1, x:6, y: 8)
                                .overlay(
                                    Text(isActivated ? "Register" : "")
                                        .font(.title3)
                                        .foregroundStyle(Color.black)
                                        .italic()
                                        .bold()
                                )
                            
                        })
                        
                        Spacer()
                    }
                    
                    
                    Spacer(minLength: 185)

            
                    Text("By Beees").font(.custom("Big Movie", size: 40))
        }
        
                        
                
 
            }
            
        }
        
    }
}



#Preview {
    Login(isLoggedIn: .constant(false), isRegistered: .constant(false), removeLoginView: .constant(false))
}
