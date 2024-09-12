import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            CapsuleText(text: "First")
                .foregroundStyle(.white)
            
            CapsuleText(text: "Second")
                .foregroundStyle(.yellow)
        }
    }
}

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}

#Preview {
    ContentView()
}
