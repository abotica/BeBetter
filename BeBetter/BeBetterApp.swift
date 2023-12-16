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
    @State var goBack: Bool = false
    @State var isShownOnce: Bool = true
    @State var goBackToMain: Bool = false
    @State var showMainView: Bool = true
    var body: some Scene {
        
        WindowGroup {
        //zatvorit view-ove????
            if(!removeLoginView){
                Login(isLoggedIn: $isLoggedIn, isRegistered: $isRegistered, removeLoginView: $removeLoginView, isShownOnce: $isShownOnce)
            }
            
            if(isLoggedIn){
                if(showMainView){
                    MainView(showMainView: $showMainView)
                }
                else if(!showMainView){
                    SettingsView(showMainView: $showMainView)
                }
               
            }
            else if(isRegistered){
                Register_screen(goBack: $goBack, removeLoginView: $removeLoginView, isRegistered: $isRegistered, isShownOnce: $isShownOnce)
            }
            
        }
    }
}
