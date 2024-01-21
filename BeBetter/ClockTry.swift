import SwiftUI
import Combine

struct clockView: View {
    @State private var selectedSegment = 0
    @State private var currentTime = Date()
    @State private var stopwatchTime = 0.0
    @State private var countdownTime = 60.0
    @State private var isRunning = false
    @State private var timer: Timer?
    @State private var customCountdownTime : Double = 0.0
    @State var Screen_Width = UIScreen.main.bounds.width
    @State var Screen_Height = UIScreen.main.bounds.height
    @Binding var goBack: Bool

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
                .offset(x: -Screen_Width*0.4, y: -Screen_Height*0.02)
            
            Picker(selection: $selectedSegment, label: Text("")) {
                Text("Clock").tag(0)
                Text("Stopwatch").tag(1)
                Text("Countdown Timer").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Spacer()

            if selectedSegment == 0 {
                clockTry(currentTime: $currentTime)
                digitalClockView(currentTime: $currentTime)
            } else if selectedSegment == 1 {
                stopwatchView(stopwatchTime: $stopwatchTime)
            } else {
                countdownTimerView()
            }

            Spacer()
        }
        .padding()
    }
}

struct digitalClockView: View {
    @Binding var currentTime: Date

    var body: some View {
        Text("\(formattedTime(from: currentTime))")
            .font(.title)
            .padding()
        
    }

    private func formattedTime(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: date)
    }
}

struct clockTry: View {
    @Binding var currentTime: Date

    var body: some View {
        VStack {
            Text("Clock")
                .font(.title)
                .padding()

            Spacer()

            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 200, height: 200)

                ForEach(0..<12) { index in
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 2, height: 12)
                        .offset(y: -80)
                        .rotationEffect(Angle(degrees: Double(index) * 30))
                }

                Rectangle()
                    .fill(Color.black)
                    .frame(width: 3, height: 60)
                    .offset(y: -30)
                    .rotationEffect(Angle(degrees: Double(Calendar.current.component(.hour, from: currentTime)) * 30))

                Rectangle()
                    .fill(Color.black)
                    .frame(width: 2, height: 80)
                    .offset(y: -40)
                    .rotationEffect(Angle(degrees: Double(Calendar.current.component(.minute, from: currentTime)) * 6))

                Rectangle()
                    .fill(Color.red)
                    .frame(width: 1, height: 100)
                    .offset(y: -20)
                    .rotationEffect(Angle(degrees: Double(Calendar.current.component(.second, from: currentTime)) * 6))
           
            }

            Spacer()
        }
        .onAppear {
            let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                currentTime = Date()
            }
            RunLoop.current.add(timer, forMode: .common)
        }
    }
}



struct stopwatchView: View {
    @Binding var stopwatchTime: Double
    @State private var isRunning = false
    @State private var timer: Timer?

    var body: some View {
        VStack {
            Text("Stopwatch")
                .font(.title)
                .padding()

            Spacer()

            Text(String(format: "%.1f", stopwatchTime))
                .font(.largeTitle)
                .padding()

            HStack {
                Button(action: {
                    if isRunning {
                        timer?.invalidate()
                    } else {
                        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                            stopwatchTime += 0.1
                        }
                        RunLoop.current.add(timer!, forMode: .common)
                    }
                    isRunning.toggle()
                }) {
                    Text(isRunning ? "Stop" : "Start")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }

                Button(action: {
                    timer?.invalidate()
                    isRunning = false
                    stopwatchTime = 0.0
                }) {
                    Text("Reset")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(8)
                }
            }

            Spacer()
        }
    }
}

struct countdownTimerView: View {
    @State private var countdownTime: TimeInterval = 60.0
    @State private var timer: Timer?
    @State private var isRunning = false
    @State private var enteredTime = ""

    var body: some View {
        VStack {
            Text("Countdown Timer")
                .font(.title)
                .padding()

            Spacer()

            TextField("Enter Time (in seconds)", text: $enteredTime)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .cornerRadius(10)


            Text(String(format: "%.1f", countdownTime))
                .font(.largeTitle)
                .padding()

            HStack {
                Button(action: {
                    addTimeToCountdown()
                }) {
                    Text("Add Time")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(8)
                }

                Button(action: {
                    if isRunning {
                        stopTimer()
                    } else {
                        startTimer()
                    }
                }) {
                    Text(isRunning ? "Pause" : "Start")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }

                Button(action: {
                    resetTimer()
                }) {
                    Text("Reset")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(8)
                }
            }

            Spacer()
        }
        .padding()
        .onDisappear {
            stopTimer()
        }
    }

    private func startTimer() {
        guard countdownTime > 0 else { return }

        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            countdownTime -= 0.1

            if countdownTime <= 0 {
                stopTimer()
            }
        }
        RunLoop.current.add(timer!, forMode: .common)
        isRunning = true
    }

    private func stopTimer() {
        timer?.invalidate()
        isRunning = false
    }

    private func resetTimer() {
        stopTimer()
        countdownTime = 60.0
        enteredTime = ""
    }

    private func addTimeToCountdown() {
        guard let addedTime = Double(enteredTime), addedTime > 0 else {
            // Show an alert or handle invalid input
            return
        }

        if isRunning {
            // If timer is running, add time directly to countdownTime
            countdownTime += addedTime
        } else {
            // If timer is paused or not started, reset countdownTime and start with the new time
            countdownTime = addedTime
        }

        enteredTime = ""
    }
}


struct contentView_Previews: PreviewProvider {
    static var previews: some View {
        clockView(goBack: .constant(false))
    }
}
