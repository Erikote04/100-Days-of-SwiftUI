import SwiftUI

struct ContentView: View {
    @State private var isShowingSheet = false
    var body: some View {
        Button("Show sheet") {
            isShowingSheet.toggle()
        }
        .sheet(isPresented: $isShowingSheet) {
            SecondView(name: "@theerikoshea")
                .presentationDetents([.medium, .large])
        }
    }
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    var name: String
    
    var body: some View {
        Text("Hello \(name)")
            .padding()
        
        Button("Dismiss") {
            dismiss()
        }
    }
}
#Preview {
    ContentView()
}
