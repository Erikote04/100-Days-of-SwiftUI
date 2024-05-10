import SwiftUI

struct ContentView: View {
    var body: some View {
        AngularGradient(
            colors: [.red, .orange, .yellow, .green, .cyan, .blue, .indigo, .purple, .pink],
            center: .center
        )
    }
}

#Preview {
    ContentView()
}
