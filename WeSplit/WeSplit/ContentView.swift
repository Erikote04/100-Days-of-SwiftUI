import SwiftUI

struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        Button("Count: \(count)") {
            count += 1
        }
    }
}

#Preview {
    ContentView()
}
