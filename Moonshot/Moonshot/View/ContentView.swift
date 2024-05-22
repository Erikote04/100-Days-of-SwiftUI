import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150)),
    ]
    
    @State private var isShowingGrid = true
    
    var body: some View {
        TabView {
            GridLayoutView(astronauts: astronauts, missions: missions)
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Moonshot")
                }
            
            MissionListView(astronauts: astronauts, missions: missions)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Missions")
                }
            
            AstronautListView(astronauts: astronauts)
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Astronauts")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
