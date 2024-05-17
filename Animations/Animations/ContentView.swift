import SwiftUI

struct ContentView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        Button("Tap me") {
            isShowingRed.toggle()
        }
        
        if isShowingRed {
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
        }
    }
}

#Preview {
    ContentView()
}
