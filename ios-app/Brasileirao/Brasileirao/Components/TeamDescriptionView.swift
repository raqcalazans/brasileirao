import SwiftUI
import Kingfisher

struct TeamDescriptionView: View {
    let team: Team
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 16) {
                KFImage(team.logoURL)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                
                Text(team.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            Text(team.teamDescription)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}
