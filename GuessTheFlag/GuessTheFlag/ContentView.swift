import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Button("Button 1") { }
                .buttonStyle(.bordered)
            
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
            
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            
            Spacer()
            
            Image(systemName: "pencil.circle")
                .foregroundStyle(.red)
                .font(.largeTitle)
            
            Spacer()
            
            Button("Edit", systemImage: "pencil.circle") {
                print("Button was tapped")
            }
            
            Spacer()
            
            Button() {
                print("Button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil.circle")
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
