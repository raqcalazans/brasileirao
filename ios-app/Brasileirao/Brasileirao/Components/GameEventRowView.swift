import SwiftUI

struct GameEventRowView: View {
    let event: GameEvent
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Text(event.timeInGame)
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
                .frame(width: 40)
            
            VStack {
                Circle()
                    .fill(Color.secondary)
                    .frame(width: 8, height: 8)
                Rectangle()
                    .fill(Color.secondary.opacity(0.5))
                    .frame(width: 1)
            }
            
            Text(event.eventDescription)
                .font(.subheadline)
                .padding(.bottom, 16)
        }
    }
}
