import CoreML
import SwiftUI

struct BetterRestView: View {
    @StateObject var vm = BetterRestViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker(
                        "Please enter a time",
                        selection: $vm.wakeUp,
                        displayedComponents: .hourAndMinute
                    )
                    .onChange(of: vm.wakeUp) { vm.calculateBedTime() }
                }
                
                Section("Desired amount of sleep") {
                    Stepper(
                        "\(vm.sleepAmount.formatted()) hours",
                        value: $vm.sleepAmount,
                        in: 4...12
                    )
                    .onChange(of: vm.sleepAmount) { vm.calculateBedTime() }
                }
                
                Section("Daily coffee intake") {
                    Picker("^[\(vm.coffeeAmount) cup](inflect: true)", selection: $vm.coffeeAmount) {
                        ForEach(1...20, id: \.self) { numberOfCups in
                            Text("\(numberOfCups)")
                        }
                    }
                    .onChange(of: vm.coffeeAmount) { vm.calculateBedTime() }
                }
                
                Section("Your ideal bedtime is...") {
                    Text(vm.bedtime)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
            }
            .navigationTitle("BetterRest")
        }
        .onAppear { vm.calculateBedTime() }
    }
}

#Preview {
    BetterRestView()
}
