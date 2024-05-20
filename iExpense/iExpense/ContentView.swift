import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(
                            item.amount,
                            format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                        )
                        .amountStyle(
                            color:
                                item.amount < 10 ? .green :
                                item.amount < 100 ? .orange : .red
                        )
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense, content: {
                AddView(expenses: expenses)
            })
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
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
