import SwiftUI

struct ExpenseRowView: View {
    let item: ExpenseItem
    
    var body: some View {
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
}

#Preview {
    ExpenseRowView(item: ExpenseItem(name: "Lunch", type: "Personal", amount: 15))
}
