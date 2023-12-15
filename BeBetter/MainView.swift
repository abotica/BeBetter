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
                            .frame(width: Screen_Width, height: 0)
                            .ignoresSafeArea()
                            
                        
                        Spacer()
                    }
                    Divider()
                        .frame(height: 1.5)
                        .background(Color.accentColorInvert)
                    
                    
                    
                    if(hour > 6 && hour < 12){
                        
                        Text("Good morning Andrija! What will you do?")
                            .foregroundStyle(Color.accentColorInvert)
                            .font(.custom("Katibeh-Regular", size: 35))
                        
                        
                    }
                    else if(hour >= 12 && hour < 17){
                        
                        Text("Good evening Andrija! What will you do?")
                            .foregroundStyle(Color.accentColorInvert)
                            .font(.custom("Katibeh-Regular", size: 35))
                        
                    }
                    else{
                        
                        Text("Working late Andrija! What will you do?")
                            .foregroundStyle(Color.accentColorInvert)
                            .font(.custom("Katibeh-Regular", size: 35))
                        
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
                            .animation(.linear(duration: 0.3), value: showMenu)
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
                            .font(.title)
                            .foregroundColor(.accentColorInvert)
                    }
                    else{
                        Image(systemName: "text.justify")
                            .padding(.bottom, 20)
                            .padding(.trailing, 0)
                            .font(.title)
                            .foregroundColor(.accentColorInvert)
                        
                    }
                    
                })
                
            }
        }

    
        
    }
}

#Preview {
    MainView()
}
