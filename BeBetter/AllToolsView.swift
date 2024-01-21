//
//  AllToolsView.swift
//  BeBetter
//
//  Created by Andrija Botica on 18.01.2024..
//

import SwiftUI

struct AllToolsView: View {
    
    @State var initialSize: CGFloat = 0
    @State var finalSize: CGFloat = 110
    @State var isActivatedToDo = false
    @State var isActivatedClock = false
    @State var isActivatedDate = false
    @State var Screen_Width = UIScreen.main.bounds.width
    @State var Screen_Height = UIScreen.main.bounds.height
    @State var showClock = false
    @State var showCalendar = false
    @State var showList = false
    //    @State private var currentTime = Date()
    @Binding var goBack: Bool
    
    var body: some View {
        ZStack{
            
            
            
            
            
            VStack{
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
                    .offset(x: -Screen_Width*0.4, y: Screen_Height*0.001)
                Spacer()
                
                
                Button(action: {
                    
                    showClock.toggle()
                    
                    
                }, label: {
                    
                    Circle()
                        .foregroundStyle(.accentColorInvert)
                        .frame(width: isActivatedClock ? finalSize : initialSize)
                        .overlay(){
                            Image(systemName: "clock").resizable().frame(width: finalSize-20, height: finalSize - 20)
                        }
                    
                })
                .fullScreenCover(isPresented: $showClock, content: {
                    clockView(goBack: $showClock)
                })
                
                
                HStack() {
                    Button(action: {
                        
                        showList.toggle()
                        
                    }, label: {
                        
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.accentColorInvert)
                            .frame(width: isActivatedToDo ? finalSize : initialSize, height: isActivatedToDo ? finalSize : initialSize)
                            .overlay(){
                                Image(systemName: "list.star").resizable().frame(width: finalSize-20, height: finalSize - 20)
                            }
                        
                    })
                    .fullScreenCover(isPresented: $showList, content: {
                        todoView(goBack: $showList)
                    })
                    .padding(.leading)
                    
                    Spacer()
                    Button(action: {
                        
                        showCalendar.toggle()
                        
                        
                    }, label: {
                        
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.accentColorInvert)
                            .frame(width: isActivatedDate ? finalSize : initialSize, height: isActivatedDate ? finalSize : initialSize)
                            .overlay(){
                                Image(systemName: "calendar").resizable().frame(width: finalSize-20, height: finalSize - 20)
                            }
                        
                    })
                    .fullScreenCover(isPresented: $showCalendar, content: {
                        ContentView(goBack: $showCalendar)
                    }).padding(.trailing)
                }
                
                Spacer()
                
                
                
                
                
            }
            
            
        }
        .onAppear(){
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false){_ in
                withAnimation(.bouncy(extraBounce: 0.3)){
                    isActivatedClock.toggle()
                }
                Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false){_ in
                    withAnimation(.bouncy(extraBounce: 0.3)){
                        
                        isActivatedDate.toggle()
                        
                    }
                    Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false){_ in
                        withAnimation(.bouncy(extraBounce: 0.3)){
                            
                            isActivatedToDo.toggle()
                            
                        }
                    }
                }
                
            }
        }}}

#Preview {
    AllToolsView(goBack: .constant(false))
}
