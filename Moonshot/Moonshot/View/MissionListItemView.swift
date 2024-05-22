import SwiftUI

struct MissionListItemView: View {
    let mission: Mission
    
    var body: some View {
        HStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay (
                    Circle()
                        .strokeBorder(Color.white, lineWidth: 1)
                )
            
            VStack(alignment: .leading) {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 5)
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return MissionListItemView(
        mission: missions[0]
    ).preferredColorScheme(.dark)
}
