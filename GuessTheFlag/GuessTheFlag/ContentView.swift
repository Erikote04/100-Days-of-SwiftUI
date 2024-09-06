import SwiftUI

struct ContentView: View {
    var body: some View {
        LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
        
        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
        
        AngularGradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .red], center: .center)
    }
}

#Preview {
    ContentView()
}
