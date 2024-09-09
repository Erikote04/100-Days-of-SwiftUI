import SwiftUI

struct ContentView: View {
    @State private var isShowingAlert = false
    
    var body: some View {
        Button("Show alert") {
            isShowingAlert = true
        }
        .padding()
        .alert("Important message", isPresented: $isShowingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please read this")
        }
    }
}

#Preview {
    ContentView()
}
