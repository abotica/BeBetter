import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let date: Date
    var text: String
}

struct ContentView: View {
    @State private var selectedDate: Date? = nil
    @State private var taskText: String = ""
    @State private var tasks: [Task] = []

    var body: some View {
        VStack {
            Text("Task Calendar")
                .font(.title)

            CalendarView(selectedDate: $selectedDate, tasks: $tasks)

            AddEditTaskView(selectedDate: $selectedDate, taskText: $taskText, tasks: $tasks)

            TaskListView(tasks: $tasks)
        }
        .padding()
    }
}

struct CalendarView: View {
    @Binding var selectedDate: Date?
    @Binding var tasks: [Task]

    var body: some View {
        VStack {
            CalendarPicker(selectedDate: $selectedDate)

            // Display tasks for the selected date
            if let selectedDate = selectedDate {
                Text("Tasks for \(formattedDate(selectedDate)):")
                    .font(.headline)

                ForEach(tasks.filter { Calendar.current.isDate($0.date, inSameDayAs: selectedDate) }) { task in
                    Text(task.text)
                        .padding(.leading)
                }
            }
        }
    }

    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: date)
    }
}

struct CalendarPicker: View {
    @Binding var selectedDate: Date?

    var body: some View {
        DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding()
    }
}

struct AddEditTaskView: View {
    @Binding var selectedDate: Date?
    @Binding var taskText: String
    @Binding var tasks: [Task]

    var body: some View {
        VStack {
            TextField("Task", text: $taskText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: addEditTask) {
                Text("Add/Edit Task")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
        }
    }

    private func addEditTask() {
        guard let selectedDate = selectedDate else { return }

        // Check if a task already exists for the selected date
        if let index = tasks.firstIndex(where: { Calendar.current.isDate($0.date, inSameDayAs: selectedDate) }) {
            tasks[index].text = taskText
        } else {
            let newTask = Task(date: selectedDate, text: taskText)
            tasks.append(newTask)
        }

        // Clear the task text
        taskText = ""
    }
}

struct TaskListView: View {
    @Binding var tasks: [Task]

    var body: some View {
        VStack {
            Text("All Tasks:")
                .font(.headline)

            List(tasks) { task in
                Text("\(task.text) - \(formattedDate(task.date))")
            }
        }
    }

    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
