import SwiftUI

struct ContentView: View {
    var body: some View {
        RadialGradient(
            colors: [.white, .black],
            center: .center,
            startRadius: 20,
            endRadius: 200
        )
    }
}

#Preview {
    ContentView()
}
