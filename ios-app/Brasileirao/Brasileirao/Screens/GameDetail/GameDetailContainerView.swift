import SwiftUI
import SwiftData

struct GameDetailContainerView: View {
    let gameID: Int

    @Query private var games: [Game]
    
    init(gameID: Int) {
        self.gameID = gameID
        
        let predicate = #Predicate<Game> { $0.id == gameID }
        _games = Query(filter: predicate)
    }
    
    var body: some View {
        if let game = games.first {
            GameDetailView(game: game)
        } else {
            ProgressView()
                .navigationTitle("Carregando...")
        }
    }
}
