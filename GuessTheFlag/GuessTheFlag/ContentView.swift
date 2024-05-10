import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            print("Button was tapped")
        } label: {
            Text("Tap me!")
                .padding()
                .foregroundStyle(.white)
                .background(.indigo)
                .cornerRadius(4)
        }
    }
}

#Preview {
    ContentView()
}
