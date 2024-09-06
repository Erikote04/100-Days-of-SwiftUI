import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            ZStack {
                VStack(spacing: 0) {
                    Color(red: 255, green: 0, blue: 0)
                    Color.blue
                }
                
                Text("Your content")
                    .foregroundStyle(.secondary)
                    .padding(50)
                    .background(.ultraThinMaterial)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
