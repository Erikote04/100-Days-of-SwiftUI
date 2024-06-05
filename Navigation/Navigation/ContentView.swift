import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Hello World")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap Me") {
                            // button action code
                        }
                        
                        Button("Or Tap Me") {
                            // button action code
                        }
                    }
                    
                    //                    ToolbarItem(placement: .topBarLeading) {
                    //                        Button("Tap Me") {
                    //                            button action code
                    //                        }
                    //                    }
                    //
                    //                    ToolbarItem(placement: .topBarLeading) {
                    //                        Button("Or Tap Me") {
                    //                            button action code
                    //                        }
                    //                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
