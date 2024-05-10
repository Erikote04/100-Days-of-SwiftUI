import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            print("Button was tapped")
        } label: {
            Label("Edit", systemImage: "pencil")
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
