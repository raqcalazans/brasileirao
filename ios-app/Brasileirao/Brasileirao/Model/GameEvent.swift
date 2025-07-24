import Foundation
import SwiftData

@Model
final class GameEvent {
    @Attribute(.unique)
    var id: Int
    
    var timeInGame: String
    var eventDescription: String
    
    // Relacionamento com o Jogo
    var game: Game?
    
    init(id: Int, timeInGame: String, eventDescription: String) {
        self.id = id
        self.timeInGame = timeInGame
        self.eventDescription = eventDescription
    }
}
