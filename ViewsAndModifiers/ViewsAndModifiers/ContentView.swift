import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .titleStyle()
        
        Color.blue
            .frame(width: 300, height: 200)
            .watermark(text: "hackingwithswift.com")
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func watermark(text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

#Preview {
    ContentView()
}
