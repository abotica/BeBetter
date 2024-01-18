import SwiftUI

struct CalendarView: View {
    @State var selectedDate: Date = Date()
    @Binding var goBack: Bool
    @State var Screen_Width = UIScreen.main.bounds.width
    @State var Screen_Height = UIScreen.main.bounds.height

    var body: some View {
        VStack {
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
           
        
            Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                    .font(.system(size: 28))
                    .bold()
                    .foregroundStyle(Color.red)
                    .padding()
                    .animation(.bouncy(duration: 0.2, extraBounce: 0.3), value: selectedDate)
                    .frame(width: 500)
                Divider().frame(height: 1)
            
            DatePicker(
                "Start Date",
                selection: $selectedDate,
                displayedComponents: [.date]
            )
            .padding(.horizontal)
            .datePickerStyle(.graphical)
        .accentColor(.red)
            Spacer(minLength: 300)
        }
        .padding(.vertical, 100)
        
    }
    
}


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(goBack: .constant(false))
    }
}
