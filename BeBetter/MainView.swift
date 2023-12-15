import SwiftUI

struct MainView: View {
    
    let hour = Calendar.current.component(.hour, from: Date())
    @State var Screen_Width = Register_screen(goBack: .constant(false), removeLoginView: .constant(false), isRegistered: .constant(false), isShownOnce: .constant(true)).Screen_Width
    @State var Screen_Height = Register_screen(goBack: .constant(false), removeLoginView: .constant(false), isRegistered: .constant(false), isShownOnce: .constant(true)).Screen_Height
    @State private var showMenu: Bool = false
    
    
    var body: some View {
    
       
            NavigationView{
                
                ZStack{
                  
                    VStack{
                        HStack{
                            Spacer()
                            NavigationBar()
                                .background(LinearGradient(colors: [Color(#colorLiteral(red: 1, green: 0.8245059848, blue: 0, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.329893887, blue: 0.3010276556, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(width: Screen_Width, height: Screen_Height*0.15)
                                    .shadow(color: Color.black,radius: 15, x:5, y:5)
                                    .ignoresSafeArea()
                            
                            Spacer()
                        }
                           
                        Spacer()
            
                            
                        if(hour > 6 && hour < 12){
                            
                            Text("Good morning Andrija! What will you do?")
                                .foregroundStyle(Color.black)
                                .font(.custom("Big Movie", size: 35))
                                
                            
                        }
                        else if(hour >= 12 && hour < 17){
                            
                            Text("Good evening Andrija! What will you do?")
                                .font(.custom("Big Movie", size: 35))
                            
                        }
                        else{
                            
                            Text("Working late Andrija! What will you do?")
                                .font(.custom("Big Movie", size: 35))
                            
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            
                            HStack(spacing: 20) {
                                Icons()
                            }
                            .frame(height: 225)
                            
                            
                        }
                        Spacer(minLength: Screen_Height*0.4)
                        
                        
                    }
                    
                    GeometryReader{ _ in
                        HStack {
                            Spacer()
                            SideMenu()
                                .offset(x: showMenu ? 0 : UIScreen.main.bounds.width)
                                .animation(.easeIn(duration: 0.1), value: showMenu)
                        }
                    }
                    .background(Color.black.opacity(showMenu ? 0.5 : 0))
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    
                    Button(action: {
                        print("Show menu")
                        self.showMenu.toggle()
                    },
                           
                           label: {
                        
                        if(showMenu)
                        {
                            Image(systemName: "xmark" )
                                .padding(.bottom, 20)
                                .padding(.trailing, 0)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                        }
                        else{
                            Image(systemName: "text.justify")
                                .padding(.bottom, 20)
                                .padding(.trailing, 0)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)

                        }
                        
                    })
                    
                }
            }

    
        
    }
}

#Preview {
    MainView()
}
