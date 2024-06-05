import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.items.filter { $0.type == "Personal" }) { item in
                        ExpenseRowView(item: item)
                    }
                    .onDelete(perform: { removeItems(at: $0, from: "Personal") })
                }
                
                Section("Bussiness") {
                    ForEach(expenses.items.filter { $0.type == "Bussiness" }) { item in
                        ExpenseRowView(item: item)
                    }
                    .onDelete(perform: { removeItems(at: $0, from: "Bussiness") })
                }
            }
            .navigationTitle("iExpense")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                NavigationLink(destination: AddView(expenses: expenses)) {
                    Label("Add Expense", systemImage: "plus")
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, from type: String) {
        let IDsToRemove = offsets.map { expenses.items.filter { $0.type == type }[$0].id }
        expenses.items.removeAll { item in
            item.type == type && IDsToRemove.contains(item.id)
        }
    }
}

struct ExpenseAmountColor: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(color)
    }
}

extension View {
    func amountStyle(color: Color) -> some View {
        modifier(ExpenseAmountColor(color: color))
    }
}

#Preview {
    ContentView()
}
