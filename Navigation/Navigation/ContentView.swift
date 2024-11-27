//
//  ContentView.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 23/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Hello World")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Tap me") { }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
