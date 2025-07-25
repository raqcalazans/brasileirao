import SwiftUI
import Kingfisher

enum GameViewStyle {
    case row
    case header
}

struct GameView: View {
    
    let homeTeamDTO: TeamDTO
    let awayTeamDTO: TeamDTO
    let stadium: String
    let gameDateTime: Date
    let homeGoals: Int?
    let awayGoals: Int?
    let status: GameStatus
    let style: GameViewStyle

    init?(game: Game?, style: GameViewStyle) {
        guard let game = game, let homeTeam = game.homeTeam, let awayTeam = game.awayTeam else {
            return nil
        }

        self.homeTeamDTO = TeamDTO(id: homeTeam.id, name: homeTeam.name, acronym: homeTeam.acronym, logoURL: homeTeam.logoURL, description: homeTeam.teamDescription)
        self.awayTeamDTO = TeamDTO(id: awayTeam.id, name: awayTeam.name, acronym: awayTeam.acronym, logoURL: awayTeam.logoURL, description: awayTeam.teamDescription)
        
        self.stadium = game.stadium
        self.gameDateTime = game.gameDateTime
        self.homeGoals = game.homeGoals
        self.awayGoals = game.awayGoals
        self.status = game.status
        self.style = style
    }
    
    init(gameDTO: GameDTO, style: GameViewStyle) {
        self.homeTeamDTO = gameDTO.homeTeam
        self.awayTeamDTO = gameDTO.awayTeam
        self.stadium = gameDTO.stadium
        self.gameDateTime = gameDTO.gameDateTime
        self.homeGoals = gameDTO.homeGoals
        self.awayGoals = gameDTO.awayGoals
        self.status = gameDTO.status
        self.style = style
    }

    var body: some View {
        VStack(spacing: style == .header ? 20 : 12) {
            HStack {
                Text(stadium.components(separatedBy: ",").first ?? stadium)
                Text("•")
                Text(gameDateTime.gameDayDisplay)
                Text("•")
                Text(gameDateTime.gameTimeDisplay)
            }
            .font(.caption)
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .center)

            HStack(spacing: 16) {
                Text(homeTeamDTO.acronym)
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                KFImage(homeTeamDTO.logoURL)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                
                VStack {
                    if let homeGoals = homeGoals, let awayGoals = awayGoals {
                        Text("\(homeGoals) x \(awayGoals)")
                            .font(style == .header ? .largeTitle : .title2)
                            .fontWeight(.bold)
                    } else {
                        Text("x")
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }
                    
                    if status == .live {
                        Text("AO VIVO")
                            .font(.caption).bold().foregroundColor(.red)
                    }
                }
                
                KFImage(awayTeamDTO.logoURL)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)

                Text(awayTeamDTO.acronym)
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            
            if style == .row {
                Text("FIQUE POR DENTRO")
                   .font(.system(size: 12, weight: .bold))
                   .foregroundColor(Color(red: 0.1, green: 0.7, blue: 0.3))
            }
        }
        .padding(.vertical, style == .header ? 20 : 8)
    }
}
