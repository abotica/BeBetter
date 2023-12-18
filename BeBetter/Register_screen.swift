//
//  Register_screen.swift
//  beBetter
//
//  Created by Karlo Nevešćanin on 13.12.2023..
//

import SwiftUI

struct fieldModifierRegister: ViewModifier {
    @Binding var isActivated: Bool
    @Binding var Screen_Width: CGFloat
    func body(content: Content) -> some View {
        content
            .frame(width: isActivated ? Screen_Width*0.5:50, height: isActivated ? 55:50)
            .background(Color.white)
            .font(.title3)
            .foregroundStyle(Color.black)
            .cornerRadius(50)
            .multilineTextAlignment(.center)
            .tint(.black)
    }
}

func isValidEmail(_ email: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", options: [.caseInsensitive])
        return regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.utf16.count)) != nil
    }

struct Register_screen: View {
    @ObservedObject var KorisnikModel = KorisnikViewModel()
    @Binding var goBack: Bool
    @Binding var removeLoginView: Bool
    @Binding var isRegistered: Bool
    @Binding var isShownOnce: Bool
    @State var isActivated: Bool = false
    @State var Screen_Width = UIScreen.main.bounds.width
    @State var Screen_Height = UIScreen.main.bounds.height
    @State var placeholderColor = Color(#colorLiteral(red: 0.6244561076, green: 0.6244561076, blue: 0.6244561076, alpha: 0.6230674342))
    @State var confPassPlaceholderColor = Color(#colorLiteral(red: 0.6244561076, green: 0.6244561076, blue: 0.6244561076, alpha: 0.6230674342))
    @State var passwordPlaceholderColor = Color(#colorLiteral(red: 0.6244561076, green: 0.6244561076, blue: 0.6244561076, alpha: 0.6230674342))
    @State var passwordPlaceholder = "Required"
    @State var confPassPlaceholder = "Required"
    @State var confPassTextOpacity: CGFloat = 0.0
//    @State var shadowConfPassY: CGFloat = 8
//    @State var shadowPassY: CGFloat = 8
    @State var roundedRectY: CGFloat = 55
    @State var shadowColorConfPass = Color.black
    @State var confPassBorderOpacity: CGFloat = 0.0
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var email: String = ""
    @State var emailPlaceholder: String = "Required"
    @State var emailPlaceholderColor = Color(#colorLiteral(red: 0.6244561076, green: 0.6244561076, blue: 0.6244561076, alpha: 0.6230674342))
    @State var name: String = ""
    @State var surname: String = ""
    @State var username: String = ""
    @State var namePlaceholder: String = "Required"
    @State var namePlaceholderColor = Color(#colorLiteral(red: 0.6244561076, green: 0.6244561076, blue: 0.6244561076, alpha: 0.6230674342))
    @State var surnamePlaceholder: String = "Required"
    @State var surnamePlaceholderColor = Color(#colorLiteral(red: 0.6244561076, green: 0.6244561076, blue: 0.6244561076, alpha: 0.6230674342))
    @State var userNamePlaceholder: String = "Required"
    @State var userNamePlaceholderColor = Color(#colorLiteral(red: 0.6244561076, green: 0.6244561076, blue: 0.6244561076, alpha: 0.6230674342))
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color(#colorLiteral(red: 0.9139844775, green: 0.767064631, blue: 0.4150085449, alpha: 1)), Color(#colorLiteral(red: 0.9025250077, green: 0.4324684143, blue: 0.3178541958, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

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
//                                    .shadow( radius: 1, x: 1, y: 0.5)
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
                                        .modifier(textModifier())
                                        .padding()
                                    
                                    TextField("", text: $name, prompt: isActivated ? Text(namePlaceholder).italic()
                                        .foregroundColor(namePlaceholderColor) : Text(""))
                                        .modifier(fieldModifierRegister(isActivated: $isActivated, Screen_Width: $Screen_Width))
                                        .shadow(color: .black, radius: 0, x:4, y: 8)
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.01) : Spacer(minLength: Screen_Width*0.2)
                                }
                                
                                HStack(spacing: 0.1){
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.01) : Spacer(minLength: Screen_Width*0.2)
                                    Text("Surname: ")
                                        .modifier(textModifier())
                                        .padding()
                            
                                    
                                    TextField("", text: $surname, prompt: isActivated ? Text(surnamePlaceholder).italic()
                                        .foregroundColor(surnamePlaceholderColor) : Text(""))
                                        .modifier(fieldModifierRegister(isActivated: $isActivated, Screen_Width: $Screen_Width))
                                        .shadow(color: .black, radius: 0, x:4, y: 8)
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.1) : Spacer(minLength: Screen_Width*0.31)
                                
                            }
                                
                                HStack(spacing: 0.1){
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.01) : Spacer(minLength: Screen_Width*0.2)
                                    Text("Username: ")
                                        .modifier(textModifier())
                                        .padding()
                                    
                                    
                                    TextField("", text: $username, prompt: isActivated ? Text(userNamePlaceholder).italic()
                                        .foregroundColor(userNamePlaceholderColor) : Text(""))
                                        .modifier(fieldModifierRegister(isActivated: $isActivated, Screen_Width: $Screen_Width))
                                        .shadow(color: .black, radius: 0, x:4, y: 8)
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.1) : Spacer(minLength: Screen_Width*0.31)
                                }
                                
                                HStack(spacing: 0.1){
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.16) : Spacer(minLength: Screen_Width*0.32)
                                    Text("Email: ")
                                        .modifier(textModifier())                                        .padding()
                                    
                                    
                                    TextField("", text: $email, prompt: isActivated ? Text(emailPlaceholder).italic()
                                        .foregroundColor(emailPlaceholderColor) : Text(""))
                                        .modifier(fieldModifierRegister(isActivated: $isActivated, Screen_Width: $Screen_Width))
                                        .shadow(color: .black, radius: 0, x:4, y: 8)
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.0) : Spacer(minLength: Screen_Width*0.06)
                                }
                                
                                HStack(spacing: 0.1){
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.01) : Spacer(minLength: Screen_Width*0.2)
                                    Text("Password: ")
                                        .modifier(textModifier())
                                        .padding()
                                    
                                    
                                    SecureField("", text: $password, prompt: isActivated ? Text(passwordPlaceholder).italic()
                                        .foregroundColor(passwordPlaceholderColor) : Text(""))
                                        .modifier(fieldModifierRegister(isActivated: $isActivated, Screen_Width: $Screen_Width))
                                        .shadow(color: .black, radius: 0, x:4, y: 8)
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.1) : Spacer(minLength: Screen_Width*0.31)
                                }
                                
                                HStack(spacing: 23){
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.01) : Spacer(minLength: Screen_Width*0.2)
                                    Text("Confirm\npassword:")
                                        .modifier(textModifier())
                                        .multilineTextAlignment(.center)
                                                            
                                    
                                    SecureField("", text: $confirmPassword, prompt: isActivated ? Text(confPassPlaceholder).italic()
                                        .foregroundColor(confPassPlaceholderColor) : Text(""))
                                        .modifier(fieldModifierRegister(isActivated: $isActivated, Screen_Width: $Screen_Width))
                                        .shadow(color: shadowColorConfPass, radius: 0, x:4, y: 8)
//                                        .overlay(){
//                                            RoundedRectangle(cornerRadius: 50).stroke(.black, lineWidth: 0.5).opacity(confPassBorderOpacity)
//                                            
//                                        }
//                                        .background(){
//                                            
//                                            RoundedRectangle(cornerRadius: 50).frame(width: isActivated ? Screen_Width*0.5:50, height: isActivated ? roundedRectY:50).foregroundStyle(shadowColorConfPass).overlay(){
//                                                Text("Incorrect password").opacity(confPassTextOpacity).foregroundStyle(Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.69)))
//                                            }
//                                        }
                                        
                                    

                                    
                                        
                                    
                                    isActivated ? Spacer(minLength: Screen_Width*0.01) : Spacer(minLength: Screen_Width*0.25)
                                    
                                    
                                }
                
                
                Spacer(minLength: Screen_Height*0)
                Button(action:
                        {
                    print(password, confirmPassword, email)
                    
                    if( confirmPassword != password){
                        
                        confirmPassword = ""
//                        password = ""
                        //                        confPassPlaceholder = "Incorrect password"
                        //                        confPassPlaceholderColor = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.69))
//                        withAnimation(.linear(duration: 0.2)){
                            
                            confPassPlaceholder = "Retry password"
                            confPassPlaceholderColor = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.69))
                            //                            shadowColorConfPass = Color.white
                            //                            confPassBorderOpacity = 0.3
                            //                            confPassTextOpacity = 1.0
                            //                            roundedRectY = 60
//                        }
                        
                        
                    }
                    else if(password == ""){
                        confirmPassword = ""
                        passwordPlaceholder = "Enter password"
                        passwordPlaceholderColor = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.69))
                        if(confirmPassword == ""){
                            confPassPlaceholder = "Reenter password"
                            confPassPlaceholderColor = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.69))
                        }
                    }
                    else if(confirmPassword == ""){
                    password = ""
                    confPassPlaceholder = "Reenter password"
                    confPassPlaceholderColor = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.69))
                    if(password == ""){
                        passwordPlaceholder = "Enter password"
                        passwordPlaceholderColor = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.69))
                    }
                }
                    if(!isValidEmail(email)){
                        email = ""
                        emailPlaceholder = "Incorrect format"
                        emailPlaceholderColor = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.69))
                    }
                    if(name == ""){
                        namePlaceholder = "Enter name"
                        namePlaceholderColor = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.69))
                    }
                    
                    if(surname == ""){
                        surnamePlaceholder = "Enter surname"
                        surnamePlaceholderColor = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.69))
                    }
                    
                    if(username == ""){
                        userNamePlaceholder = "Enter username"
                        userNamePlaceholderColor = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.69))
                    }
                    
                    if((confirmPassword == password) && (confirmPassword != "") && (password != "") && isValidEmail(email) && (name != "") && (surname != "") && (username != "")){
                        print("Uslo je u slanje", email)
                        KorisnikModel.korisnik.name = name
                        KorisnikModel.korisnik.surname = surname
                        KorisnikModel.korisnik.username = username
                        KorisnikModel.korisnik.password = password
                        KorisnikModel.korisnik.confirmPassword = confirmPassword
                        KorisnikModel.korisnik.email = email
                        goBack = true
                        isRegistered = false
                        removeLoginView = false
                        isShownOnce = false
                        KorisnikModel.sendDataToServer()
                        
                    }
                    
                }, label: {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .frame(width: isActivated ? Screen_Width*0.3 : 50, height: isActivated ? 55 : 50)
                        .shadow(color: .black, radius: 0, x:4, y: 8)
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
