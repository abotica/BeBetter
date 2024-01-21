import SwiftUI

struct contentView: View {
    @State private var selectedSegment = 0
    @State private var currentTime = Date()
    @State private var stopwatchTime = 0.0
    @State private var counterValue = 0

    var body: some View {
        VStack {
            Picker(selection: $selectedSegment, label: Text("")) {
                Text("Clock").tag(0)
                Text("Stopwatch").tag(1)
                Text("Counter").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Spacer()

            if selectedSegment == 0 {
                ClockView(currentTime: $currentTime)
            } else if selectedSegment == 1 {
                StopwatchView(stopwatchTime: $stopwatchTime)
            } else {
                CounterView(counterValue: $counterValue)
            }

            Spacer()
        }
    }
}

struct ClockView: View {
    @Binding var currentTime: Date

    var body: some View {
        VStack {
            Text("Analog Clock")
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
                    .frame(width: 4, height: 60)
                    .offset(y: -60)
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
                    .rotationEffect(Angle(degrees: Double(Calendar.current.component(.second, from: currentTime)) * 6))          }

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

struct CounterView: View {
    @Binding var counterValue: Int

    var body: some View {
        VStack {
            Text("Counter")
                .font(.title)
                .padding()

            Spacer()

            Text("\(counterValue)")
                .font(.largeTitle)
                .padding()

            HStack {
                Button(action: {
                    counterValue += 1
                }) {
                    Text("Increment")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(8)
                }

                Button(action: {
                    counterValue = 0
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

struct contentView_Previews: PreviewProvider {
    static var previews: some View {
        contentView()
    }
}
