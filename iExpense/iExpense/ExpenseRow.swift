//
//  ExpenseRow.swift
//  iExpense
//
//  Created by Erik Sebastian de Erice Jerez on 14/10/24.
//

import SwiftUI

struct ExpenseRow: View {
    let item: ExpenseItem
    let color: Color
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                
                Text(item.type)
            }
            
            Spacer()
            
            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundStyle(color)
        }
    }
}

#Preview {
    ExpenseRow(
        item: ExpenseItem(name: "Launch", type: "Personal", amount: 20),
        color: .orange
    )
}
