import SwiftUI

struct GameDetailView: View {
    let game: Game
    
    var body: some View {
        List {
            Section {
                GameView(game: game, style: .header)
            }
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)

            if !game.events.isEmpty {
                Section(header: Text("Lance a Lance").fontWeight(.bold)) {
                    ForEach(game.events.sorted(by: { $0.timeInGame < $1.timeInGame })) { event in
                        EventView(event: event)
                    }
                    .listRowSeparator(.hidden)
                }
            } else {
                if let homeTeam = game.homeTeam, let awayTeam = game.awayTeam {
                    Section(header: Text("Sobre os Times").fontWeight(.bold)) {
                        VStack(spacing: 0) {
                            TeamView(team: homeTeam)
                            
                            Divider().padding(.horizontal)
                            
                            TeamView(team: awayTeam)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Detalhes da Partida")
        .navigationBarTitleDisplayMode(.inline)
    }
}
