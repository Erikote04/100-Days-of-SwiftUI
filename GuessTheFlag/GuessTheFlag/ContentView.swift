import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Your content")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.black.gradient)
    }
}

#Preview {
    ContentView()
}
