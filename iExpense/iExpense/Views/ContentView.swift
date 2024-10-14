import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ExpensesViewModel()
    private let decorator: DecoratorProtocol = Decorator()
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(viewModel.personalExpenses) { item in
                        ExpenseRow(item: item, color: decorator.decorate(amount: item.amount))
                    }
                    .onDelete { offsets in
                        viewModel.removeItems(at: offsets, from: viewModel.personalExpenses)
                    }
                }

                Section("Business") {
                    ForEach(viewModel.businessExpenses) { item in
                        ExpenseRow(item: item, color: decorator.decorate(amount: item.amount))
                    }
                    .onDelete { offsets in
                        viewModel.removeItems(at: offsets, from: viewModel.businessExpenses)
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button(action: {
                    viewModel.isShowingAddExpense = true
                }) {
                    Label("Add Expense", systemImage: "plus")
                }
            }
            .sheet(isPresented: $viewModel.isShowingAddExpense) {
                AddView(expenses: viewModel.expenses)
            }
        }
    }
}


#Preview {
    ContentView()
}
