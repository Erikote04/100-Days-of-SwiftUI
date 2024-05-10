import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Cancel", role: .cancel, action: {})
            Button("Delete", role: .destructive, action: {})
        }
    }
}

#Preview {
    ContentView()
}
