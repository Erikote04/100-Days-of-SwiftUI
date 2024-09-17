import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var bedtime = ""
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker(
                        "Please enter a time",
                        selection: $wakeUp,
                        displayedComponents: .hourAndMinute
                    )
                    .onChange(of: wakeUp) { calculateBedTime() }
                }
                
                Section("Desired amount of sleep") {
                    Stepper(
                        "\(sleepAmount.formatted()) hours",
                        value: $sleepAmount,
                        in: 4...12
                    )
                    .onChange(of: sleepAmount) { calculateBedTime() }
                }
                
                Section("Daily coffee intake") {
                    Picker("^[\(coffeeAmount) cup](inflect: true)", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) { numberOfCups in
                            Text("\(numberOfCups)")
                        }
                    }
                    .onChange(of: coffeeAmount) { calculateBedTime() }
                }
                
                Section("Your ideal bedtime is...") {
                    Text(bedtime)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
            }
            .navigationTitle("BetterRest")
        }
        .onAppear { calculateBedTime() }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(
                wake: Double(hour + minutes),
                estimatedSleep: sleepAmount,
                coffee: Double(coffeeAmount)
            )
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            bedtime = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            bedtime = "Sorry, there was a problem calculating your bedtime."
        }
    }
}

#Preview {
    ContentView()
}
