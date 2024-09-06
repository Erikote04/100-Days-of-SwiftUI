import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            Spacer()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Hello, world!")
                Text("This is another text view")
            }
            
            Spacer()
            
            HStack(spacing: 20) {
                Text("Hello, world!")
                Text("This is another text view")
            }
            
            Spacer()
            
            ZStack() {
                Text("Hello, world!")
                Text("This is another text view")
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
