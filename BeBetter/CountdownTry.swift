import SwiftUI

struct Contentview: View {
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

struct Contentview_Previews: PreviewProvider {
    static var previews: some View {
        Contentview()
    }
}
