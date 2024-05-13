import SwiftUI

struct ContentView: View {
    let motto1 = Text("Draco dormiens")
    
    var motto2: some View {
        Text("nunquam titillandus")
    }
    
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
