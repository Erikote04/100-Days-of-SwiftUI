import SwiftUI

struct MissionListView: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
                    MissionListItemView(mission: mission)
                }
                .listRowBackground(Color.darkBackground)
            }
            .navigationTitle("Missions")
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionListView(astronauts: astronauts, missions: missions)
    
}
