//
//  ContentView.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 23/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var path = [Int]()
    // @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(path: $path, number: 0)
                .navigationDestination(for: Int.self) { number in
                    DetailView(path: $path, number: number)
                }
        }
    }
}

struct DetailView: View {
    @Binding var path: [Int]
    // @Binding var path: NavigationPath
    
    let number: Int
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number \(number)")
            .toolbar {
                Button("Home") {
                    path.removeAll()
                    // path = NavigationPath()
                }
            }
    }
}

#Preview {
    ContentView()
}
