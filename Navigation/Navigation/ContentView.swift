//
//  ContentView.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 23/11/24.
//

import SwiftUI

@Observable
class PathStore {
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        
        path = NavigationPath()
    }
    
    func save() {
        guard let representation = path.codable else { return }
        
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct ContentView: View {
    @State private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(path: $pathStore.path, number: 0)
                .navigationDestination(for: Int.self) { number in
                    DetailView(path: $pathStore.path, number: number)
                }
        }
    }
}

struct DetailView: View {
    @Binding var path: NavigationPath
    
    let number: Int
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
}

#Preview {
    ContentView()
}
