//
//  BeBetterApp.swift
//  BeBetter
//
//  Created by Andrija Botica on 18.10.2023..
//

import SwiftUI

@main
struct BeBetterApp: App {
    
    @State var isLoggedIn: Bool = false
    @State var isRegistered: Bool = false //ako klikne register button
    @State var removeLoginView: Bool = false
    var body: some Scene {
        
        WindowGroup {
        //zatvorit view-ove????
            if(!removeLoginView){
                Login(isLoggedIn: $isLoggedIn, isRegistered: $isRegistered, removeLoginView: $removeLoginView)
            }
            
            if(isLoggedIn){
                MainView()
            }
            else if(isRegistered){
                Register_screen()
            }
            
            
//            if isLoggedIn{
//                
//                MainView()
//                
//                
//               
//                   
//                
//                    
//            }
//            else{
//               
//                Login(isLoggedIn: $isLoggedIn, isRegistered: $isRegistered)
//              
//                
//              
//                
//            }
//            
//            if isRegistered{
//                
//                Register_screen()
//                
//            }
            
            
            
           

        }
    }
}
