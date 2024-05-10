import SwiftUI

struct ContentView: View {
    var body: some View {
        LinearGradient(
            colors: [.white, .black],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

#Preview {
    ContentView()
}
