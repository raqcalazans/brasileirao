import Foundation
import SwiftUI

@MainActor
class GameDetailViewModel: ObservableObject {
    
    @Published private(set) var game: GameDTO
    
    var hasEvents: Bool {
        return !game.events.isEmpty
    }
    
    init(game: GameDTO) {
        self.game = game
    }
}
