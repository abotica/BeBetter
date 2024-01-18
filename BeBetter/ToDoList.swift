//
//  ToDoList.swift
//  BeBetter
//
//  Created by Andrija Botica on 17.01.2024..
//

import SwiftUI

struct Task: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted = false
}

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []

    func addTask(title: String) {
        let newTask = Task(title: title)
        tasks.append(newTask)
    }

    func toggleTaskCompletion(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    func deleteTask(task: Task) {
        tasks.removeAll(where: { $0.id == task.id })
    }
}

struct todoView: View {
    @StateObject private var taskViewModel = TaskViewModel()
    @State private var newTaskTitle = ""
    @Binding var goBack: Bool
    @State var Screen_Width = UIScreen.main.bounds.width
    @State var Screen_Height = UIScreen.main.bounds.height

    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    ForEach(taskViewModel.tasks) { task in
                        TaskRow(task: task, toggleCompletion: {
                            taskViewModel.toggleTaskCompletion(task: task)
                        })
                    }
                    .onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            let task = taskViewModel.tasks[index]
                            taskViewModel.deleteTask(task: task)
                        }
                    })
                }

                HStack {
                    TextField("", text: $newTaskTitle, prompt:Text("New Task").foregroundStyle(.accentColorInvert.opacity(0.8)))
                        
                        .padding()
                        .tint(.accentColorInvert)
                        .clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: 200).overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundStyle(.accentColorInvert))
                        
                    Spacer()
                    Button(action: {
                        taskViewModel.addTask(title: newTaskTitle)
                        newTaskTitle = ""
                    }) {
                        Text("Add Task")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
            .navigationTitle("To-Do List")
           
        }
        .overlay(alignment: .top){
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
        }
    }
}

struct TaskRow: View {
    var task: Task
    var toggleCompletion: () -> Void

    var body: some View {
        HStack {
            Button(action: toggleCompletion) {
                Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                    .foregroundColor(task.isCompleted ? .green : .gray)
            }

            Text(task.title)
                .strikethrough(task.isCompleted, pattern: .solid, color: .accentColorInvert)
                .padding(.leading, 10)
        }
    }
}

struct TodoApp_Previews: PreviewProvider {
    static var previews: some View {
        todoView(goBack: .constant(false))
    }
}

