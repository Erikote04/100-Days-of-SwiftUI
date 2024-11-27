//
//  ContentView.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 23/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var navigationTitle = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("Hello World")
                .navigationTitle($navigationTitle)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
