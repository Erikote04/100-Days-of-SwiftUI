import SwiftUI

struct ContentView: View {
    var body: some View {
        GridStack(row: 4, col: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

struct GridStack<Content: View>: View {
    let row: Int
    let col: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<row, id: \.self) { row in
                HStack {
                    ForEach(0..<col, id: \.self) { col in
                        content(row, col)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
