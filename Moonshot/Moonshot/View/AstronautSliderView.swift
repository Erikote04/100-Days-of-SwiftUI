import SwiftUI

struct AstronautSliderView: View {
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        AstronautSliderItemView(crewMember: crewMember)
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    AstronautSliderView(
        crew: [CrewMember(
            role: "Commander",
            astronaut: Astronaut(
                id: "armstrong",
                name: "Buzz Aldrin",
                description: ""
            )
        )]
    )
}
