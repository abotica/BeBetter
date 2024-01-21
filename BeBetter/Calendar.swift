import SwiftUI

struct CalendarView: View {
    @State var selectedDate: Date = Date()

    var body: some View {
        VStack {
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
        }
        .padding(.vertical, 100)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
