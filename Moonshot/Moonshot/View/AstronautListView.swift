import SwiftUI

struct AstronautListView: View {
    let astronauts: [String: Astronaut]
    
    var body: some View {
        NavigationView {
            List(astronauts.keys.sorted(), id: \.self) { key in
                if let astronaut = astronauts[key] {
                    NavigationLink(destination: AstronautView(astronaut: astronaut)) {
                        AstronautListItemView(astronaut: astronaut)
                    }
                    .listRowBackground(Color.darkBackground)
                }
            }
            .navigationTitle("Astronauts")
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautListView(astronauts: astronauts)
}
