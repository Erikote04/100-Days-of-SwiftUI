//
//  Decorator.swift
//  iExpense
//
//  Created by Erik Sebastian de Erice Jerez on 14/10/24.
//

import SwiftUI

protocol DecoratorProtocol {
    func decorate(amount: Double) -> Color
}

struct Decorator: DecoratorProtocol {
    func decorate(amount: Double) -> Color {
        switch amount {
        case 0...10: return .green
        case 10...100: return .orange
        case 100...: return .red
        default: return .black
        }
    }
}
