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

struct fieldModifier: ViewModifier {
    
    @Binding var isActivated: Bool
    
    func body(content: Content) -> some View {
        content
            .bold()
            .frame(width: isActivated ? 220 : 50, height: isActivated ? 55 : 50)
            .background(Color.white)
            .foregroundStyle(Color.black)
            .font(.title3)
            .cornerRadius(50)
            .multilineTextAlignment(.center)
            .shadow(color: .black, radius: 0, x:4, y: 8)
    }
}

struct textModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundStyle(Color.black)
            .italic()
            .bold()
            
    }
}


struct Login: View {
    
    @ObservedObject var viewModel = KorisnikViewModel()
    @State var usernameLog: String = ""
    @State var passwordLog: String = ""
    @Binding var isLoggedIn: Bool
    @Binding var isRegistered: Bool
    @Binding var removeLoginView: Bool
    @Binding var isShownOnce: Bool
    @State var isActivated: Bool = false
    @State var showForeground: Bool = true
    @State var fontName: String = "Katibeh-Regular"
    @State var placeholderColor = Color(#colorLiteral(red: 0.6244561076, green: 0.6244561076, blue: 0.6244561076, alpha: 0.6230674342))
    @State var usernamePlaceholder: String = "Username"
    @State var passwordPlaceholder: String = "Password"
    @State var usernamePlaceholderColor = Color(#colorLiteral(red: 0.6244561076, green: 0.6244561076, blue: 0.6244561076, alpha: 0.6230674342))
    @State var passwordPlaceholderColor = Color(#colorLiteral(red: 0.6244561076, green: 0.6244561076, blue: 0.6244561076, alpha: 0.6230674342))
    
    var body: some View {
     
        if(showForeground && isShownOnce){
            
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

                    Text("Welcome!").font(.custom(fontName, size: 60))
                        .foregroundStyle(.black)
                    
                    HStack(alignment: .center)
                    {
                       
                        TextField("", text: $usernameLog, prompt: isActivated ? Text(usernamePlaceholder).italic()
                            .foregroundColor(usernamePlaceholderColor) : Text(""))
                            
                            .modifier(fieldModifier(isActivated: $isActivated))
                    }
                        
                    HStack(alignment: .center){
                            
                        SecureField("", text: $passwordLog, prompt: isActivated ? Text(passwordPlaceholder).italic()
                            .foregroundColor(passwordPlaceholderColor) : Text(""))
                                .modifier(fieldModifier(isActivated: $isActivated))
                    }
                    
                    HStack(spacing: 20)
                    {
                        
                        Spacer()
                        Button(action:
                                {
                            //nadodat usporedbu podataka iz baze, umisto else stavit else if pa ako je tocno uc u main
                            
                            if(usernameLog == "" || passwordLog == ""){
                                
                                usernamePlaceholder = "Retry username"
                                passwordPlaceholder = "Retry password"
                                passwordPlaceholderColor = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.69))
                                usernamePlaceholderColor = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.69))
                                
                            }//ovo je fake linija
                            else if(usernameLog == "abotica" && passwordLog == "beBetter"){
                                isLoggedIn = true
                                removeLoginView = true
                                
                            }else if(usernameLog != "abotica" && passwordLog != "beBetter"){
                                usernameLog = ""
                                passwordLog = ""
                                usernamePlaceholder = "Retry username"
                                passwordPlaceholder = "Retry password"
                                passwordPlaceholderColor = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.69))
                                usernamePlaceholderColor = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.69))
                            }
                            
                            
                        }, label: {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.white)
                                .frame(width: isActivated ? 140 : 50, height: isActivated ? 55 : 50)
                                .shadow(color: .black, radius: 0, x:4, y: 8)
                                .overlay(
                                    Text(isActivated ? "Login" : "")
                                        .modifier(textModifier())
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
                                .shadow(color: .black, radius: 0, x:4, y: 8)
                                .overlay(
                                    Text(isActivated ? "Sign up" : "")
                                        .modifier(textModifier())
                                )
                            
                        })
                        
                        Spacer()
                    }
                    
                    
                    Spacer(minLength: 185)

            
                    Text("By Bees").font(.custom(fontName, size: 30)).foregroundStyle(.black)
        }
        
                        
                
 
            }
            
        }
        
    }
}



#Preview {
    Login(isLoggedIn: .constant(false), isRegistered: .constant(false), removeLoginView: .constant(false), isShownOnce: .constant(true))
}
