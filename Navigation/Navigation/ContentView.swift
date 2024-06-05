import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }.navigationDestination(for: Int.self) { number in
                Text("You selected \(number)")
            }
            .navigationDestination(for: Student.self) { student in
                Text("You selected \(student.name)")
            }
        }
    }
}

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

#Preview {
    ContentView()
}
