//
//  SettingsView.swift
//  MathQuest
//
//  Created by Erik Sebastian de Erice Jerez on 7/10/24.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var settingsVM: SettingsViewModel
    var onStart: () -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Select the table you want to study") {
                    Stepper("Table of: \(settingsVM.selectedTable)", value: $settingsVM.selectedTable, in: 2...12)
                }
                
                Section("Select the number of questions") {
                    Picker("Number of Questions", selection: $settingsVM.questionCount) {
                        Text("5").tag(5)
                        Text("10").tag(10)
                        Text("15").tag(15)
                        Text("20").tag(20)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                Button("Start Game", action: onStart)
            }
        }
    }
}

#Preview {
    SettingsView(settingsVM: SettingsViewModel()) { }
}
