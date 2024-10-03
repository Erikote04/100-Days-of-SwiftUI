import SwiftUI

struct ContentView: View {
    @State private var isShowing = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowing.toggle()
                }
            }
            
            if isShowing {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

#Preview {
    ContentView()
}
