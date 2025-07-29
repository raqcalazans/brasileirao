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
                    ForEach(sortedEvents()) { event in
                        GameEventView(event: event)
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
    
    private func sortedEvents() -> [GameEvent] {
            return game.events.sorted { event1, event2 in
                let time1 = Int(event1.timeInGame.filter { $0.isNumber }) ?? 0
                let time2 = Int(event2.timeInGame.filter { $0.isNumber }) ?? 0
                
                return time1 < time2
            }
        }
}
