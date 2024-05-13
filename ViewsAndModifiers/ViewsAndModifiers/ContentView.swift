import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World")
            .padding()
            .background(.red)
            .padding()
            .background(.green)
            .padding()
            .background(.blue)
        
        Text("Hello, World")
            .background(.red)
            .padding()
            .background(.green)
            .padding()
            .background(.blue)
            .padding()
        
        Button("Hello, World") {
            // do nothing
        }
        .background(.red)
        .frame(width: 200, height: 200)
        
        Button("Hello, World") {
            // do nothing
        }
        .frame(width: 200, height: 200)
        .background(.red)
    }
}

#Preview {
    ContentView()
}
