import SwiftUI
import SwiftData

struct FilteredGamesList: View {
    @Query private var games: [Game]
        
    init(filterStatus: GameStatus) {
        let filterStatusRawValue = filterStatus.rawValue

        let predicate = #Predicate<Game> { game in
            game.statusRawValue == filterStatusRawValue
        }
        
        _games = Query(filter: predicate, sort: \Game.gameDateTime, order: .forward)
    }
    
    var body: some View {
        if games.isEmpty {
            ContentUnavailableView(
                "Nenhum Jogo Encontrado",
                systemImage: "soccer.ball.inverse",
                description: Text("Não há jogos com o status selecionado.")
            )
        } else {
            List {
                ForEach(games) { game in
                    ZStack {
                        NavigationLink(destination: GameDetailView(game: game)) {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        GameRowView(game: game)
                    }
                }
                .listRowSeparator(.visible)
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            }
            .listStyle(.plain)
        }
    }
}
