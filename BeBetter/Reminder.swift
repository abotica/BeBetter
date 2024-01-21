import SwiftUI

struct Reminder: Identifiable {
    var id = UUID()
    var title: String
}

class ReminderViewModel: ObservableObject {
    @Published var reminders: [Reminder] = []

    func addReminder(title: String) {
        let newReminder = Reminder(title: title)
        reminders.append(newReminder)
    }
}

struct ContentVView: View {
    @StateObject private var viewModel = ReminderViewModel()
    @State private var newReminderTitle = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.reminders) { reminder in
                    Text(reminder.title)
                }
                .onDelete(perform: deleteReminder)
            }
            .navigationTitle("Reminders")
            .navigationBarItems(trailing: EditButton())
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        TextField("New Reminder", text: $newReminderTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button("Add", action: addReminder)
                    }
                }
            }
        }
    }

    func addReminder() {
        if !newReminderTitle.isEmpty {
            viewModel.addReminder(title: newReminderTitle)
            newReminderTitle = ""
        }
    }

    func deleteReminder(at offsets: IndexSet) {
        viewModel.reminders.remove(atOffsets: offsets)
    }
}

struct ContentVView_Previews: PreviewProvider {
    static var previews: some View {
        ContentVView()
    }
}
