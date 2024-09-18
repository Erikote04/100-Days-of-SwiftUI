import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        List(people, id: \.self) {
            Text("\($0)")
        }
    }
}

#Preview {
    ContentView()
}
