//
//  iExpenseViewModel.swift
//  iExpense
//
//  Created by Erik Sebastian de Erice Jerez on 14/10/24.
//

import SwiftUI

class ExpensesViewModel: ObservableObject {
    @Published var expenses = Expenses()
    @Published var isShowingAddExpense = false

    var personalExpenses: [ExpenseItem] {
        expenses.items.filter { $0.type == .personal }
    }

    var businessExpenses: [ExpenseItem] {
        expenses.items.filter { $0.type == .business }
    }

    func removeItems(at offsets: IndexSet, from filteredItems: [ExpenseItem]) {
        for i in offsets {
            if let actualIndex = expenses.items.firstIndex(where: { $0.id == filteredItems[i].id }) {
                expenses.items.remove(at: actualIndex)
            }
        }
    }
}
