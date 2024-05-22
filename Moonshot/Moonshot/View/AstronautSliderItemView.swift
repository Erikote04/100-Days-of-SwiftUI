import SwiftUI

struct AstronautSliderItemView: View {
    let crewMember: CrewMember
    
    var body: some View {
        HStack {
            Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(.circle)
                .overlay(
                    Circle()
                        .strokeBorder(.white, lineWidth: 1)
                )
            
            VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                    .foregroundStyle(.white)
                    .font(.headline)
                
                Text(crewMember.role)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    AstronautSliderItemView(
        crewMember: CrewMember(
            role: "Commander",
            astronaut: Astronaut(
                id: "armstrong",
                name: "Neil A. Armstrong",
                description: ""
            )
        )
    ).preferredColorScheme(.dark)
}
