import SwiftUI

struct AstronautListItemView: View {
    let astronaut: Astronaut
    
    var body: some View {
        HStack {
            Image(astronaut.id)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay (
                    Circle()
                        .strokeBorder(Color.white, lineWidth: 1)
                )
            
            Text(astronaut.name)
                .font(.headline)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautListItemView(astronaut: astronauts["armstrong"]!)
        .preferredColorScheme(.dark)
}
