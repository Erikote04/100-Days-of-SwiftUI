import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var isShowingAddExpense = false
    
    var personalExpenses: [ExpenseItem] {
        expenses.items.filter { $0.type == "Personal" }
    }
    
    var businessExpenses: [ExpenseItem] {
        expenses.items.filter { $0.type == "Business" }
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(personalExpenses) { item in
                        ExpenseRow(item: item, color: decorateAmount(item.amount))
                    }
                    .onDelete { offsets in
                        removeItems(at: offsets, from: personalExpenses)
                    }
                }
                
                Section("Business") {
                    ForEach(businessExpenses) { item in
                        ExpenseRow(item: item, color: decorateAmount(item.amount))
                    }
                    .onDelete { offsets in
                        removeItems(at: offsets, from: businessExpenses)
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    isShowingAddExpense = true
                }
            }
            .sheet(isPresented: $isShowingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, from filteredItems: [ExpenseItem]) {
        for i in offsets {
            if let actualIndex = expenses.items.firstIndex(where: { $0.id == filteredItems[i].id }) {
                expenses.items.remove(at: actualIndex)
            }
        }
    }
    
    func decorateAmount(_ amount: Double) -> Color {
        switch amount {
        case 0...10: return .green
        case 10...100: return .orange
        case 100...: return .red
        default: return .black
        }
    }
}

struct ExpenseItem: Codable, Identifiable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

#Preview {
    ContentView()
}
