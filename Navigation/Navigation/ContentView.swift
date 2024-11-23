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
            List(0..<10) { number in
                NavigationLink("Select \(number)", value: number)
            }
            .navigationDestination(for: Int.self) { number in
                DetailView(number: number)
            }
        }
    }
}

struct DetailView: View {
    let number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating Detail View \(number)")
    }
}

#Preview {
    ContentView()
}
