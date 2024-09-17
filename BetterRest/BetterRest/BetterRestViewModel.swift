//
//  BetterRestViewModel.swift
//  BetterRest
//
//  Created by Erik Sebastian de Erice Jerez on 17/9/24.
//

import CoreML
import Foundation
import SwiftUI

class BetterRestViewModel: ObservableObject {
    @Published var wakeUp = defaultWakeTime
    @Published var sleepAmount = 8.0
    @Published var coffeeAmount = 1
    @Published var bedtime = ""
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    init() {
        calculateBedTime()
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
            bedtime = "Error calculating bedtime"
        }
    }
}
