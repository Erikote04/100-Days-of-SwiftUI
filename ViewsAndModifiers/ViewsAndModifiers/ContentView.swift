import SwiftUI

struct ContentView: View {
    var motto1: some View {
        Text("Draco dormiens")
    }
    
    let motto2 = Text("nunquam titillandus")
    
    //    var spells: some View {
    //        Group {
    //            Text("Lumos")
    //            Text("Obliviate")
    //        }
    //    }
    
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
