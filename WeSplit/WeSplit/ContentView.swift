import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var isAmountFocused: Bool
    
    var totalPerPerson: Double {
        (checkAmount + (checkAmount / 100 * Double(tipPercentage))) / Double(numberOfPeople + 2)
    }
    
    var totalAmount: Double {
        checkAmount + (checkAmount / 100 * Double(tipPercentage))
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $checkAmount,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    )
                    .keyboardType(.decimalPad)
                    .focused($isAmountFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.navigationLink)
                }
                
                Section("Amount per person") {
                    Text(
                        totalPerPerson,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    )
                }
                
                Section("Total amount") {
                    Text(
                        totalAmount,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    )
                    .foregroundStyle(tipPercentage == 0 ? .red : .black)
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if isAmountFocused {
                    Button("Done") {
                        isAmountFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
