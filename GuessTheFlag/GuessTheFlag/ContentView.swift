import SwiftUI

struct ContentView: View {
    
    func executeDelete() {
        print("Now deleting...")
    }
    
    var body: some View {
        Button("Delete selection") {
            executeDelete()
        }
    }
}

#Preview {
    ContentView()
}
