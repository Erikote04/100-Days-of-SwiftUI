import SwiftUI

enum UnitType: String, CaseIterable {
    case length = "Length"
    case temperature = "Temperature"
    case time = "Time"
    case volume = "Volume"
}

struct ContentView: View {
    @State private var inputNumber = 0.0
    @State private var selectedUnitType: UnitType = .length
    @State private var inputUnit: Dimension = UnitLength.meters
    @State private var outputUnit: Dimension = UnitLength.meters
    @FocusState private var isAmountFocused: Bool
    
    var units: [UnitType: [Dimension]] = [
        .length: [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles],
        .temperature: [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin],
        .time: [UnitDuration.seconds, UnitDuration.minutes, UnitDuration.hours],
        .volume: [UnitVolume.milliliters, UnitVolume.liters, UnitVolume.cups, UnitVolume.pints, UnitVolume.gallons]
    ]
    
    var result: Double {
        let inputMeasurement = Measurement(value: inputNumber, unit: inputUnit)
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        return outputMeasurement.value
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Select the type of conversion") {
                    Picker("Conversion Type", selection: $selectedUnitType) {
                        ForEach(UnitType.allCases, id: \.self) { unitType in
                            Text(unitType.rawValue)
                        }
                    }
                    .onChange(of: selectedUnitType) {
                        inputUnit = units[selectedUnitType]?.first ?? UnitLength.meters
                        outputUnit = units[selectedUnitType]?.first ?? UnitLength.meters
                    }
                }
                
                Section("Enter a number") {
                    TextField("Amount", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isAmountFocused)
                }
                
                Section("Select the starting unit of measure") {
                    Picker("Select a unit", selection: $inputUnit) {
                        ForEach(units[selectedUnitType] ?? [], id: \.self) { unit in
                            Text(unit.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Select the final unit of measure") {
                    Picker("Select a unit", selection: $outputUnit) {
                        ForEach(units[selectedUnitType] ?? [], id: \.self) { unit in
                            Text(unit.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Result") {
                    Text(result, format: .number)
                }
            }
            .navigationTitle("UnitConverter")
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
