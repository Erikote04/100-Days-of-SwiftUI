import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(
            colors: [.yellow, .red],
            startPoint: .leading,
            endPoint: .trailing
        )
        .frame(width: 300, height: 200)
        .clipShape(.rect(cornerRadius: 8))
        .offset(dragAmount)
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    withAnimation(.bouncy) {
                        dragAmount = .zero
                    }
                }
        )
    }
}

#Preview {
    ContentView()
}
