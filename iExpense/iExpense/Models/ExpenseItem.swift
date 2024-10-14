//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Erik Sebastian de Erice Jerez on 14/10/24.
//

import Foundation

struct ExpenseItem: Codable, Identifiable {
    var id = UUID()
    let name: String
    let type: ExpenseType
    let amount: Double
}

enum ExpenseType: String, CaseIterable, Codable {
    case personal = "Personal"
    case business = "Business"
}
