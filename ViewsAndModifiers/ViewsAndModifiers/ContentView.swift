import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Gryffindor")
                .font(.largeTitle) // overrides the parent modifier
            
            Text("Hufflepuff")
            
            Text("Ravenclaw")
            
            Text("Slytherin")
        }
        .font(.title)
    }
}

#Preview {
    ContentView()
}
