import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<1000) { number in
                NavigationLink("Tap Me") {
                    DetailView(number: number)
                }
            }
        }
    }
}

struct DetailView: View {
    var number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating Detail View \(number)")
    }
}

#Preview {
    ContentView()
}
