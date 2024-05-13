import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundStyle(.white)
            
            CapsuleText(text: "Second")
                .foregroundStyle(.orange)
            
            //            Text("First")
            //                .font(.largeTitle)
            //                .padding()
            //                .foregroundStyle(.white)
            //                .background(.blue)
            //                .clipShape(.capsule)
            //
            //            Text("Second")
            //                .font(.largeTitle)
            //                .padding()
            //                .foregroundStyle(.white)
            //                .background(.blue)
            //                .clipShape(.capsule)
        }
        .padding()
    }
}

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
        // .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

#Preview {
    ContentView()
}
