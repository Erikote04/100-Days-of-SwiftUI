import SwiftUI

struct ContentView: View {
    let layout = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) { index in
                    Text("Item \(index)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
