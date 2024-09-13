import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .titleStyle()
    }
}

struct BlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(BlueTitle())
    }
}

#Preview {
    ContentView()
}
