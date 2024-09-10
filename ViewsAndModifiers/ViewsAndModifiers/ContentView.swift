import SwiftUI

struct ContentView: View {
    @State private var isRed = false
    
    var body: some View {
        Button("Hello World") {
            isRed.toggle()
        }
        .foregroundStyle(isRed ? .red : .blue)
    }
}

#Preview {
    ContentView()
}
