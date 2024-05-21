import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(.example)
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
        
        Image(.example)
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
        
        Image(.example)
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
    }
}

#Preview {
    ContentView()
}
