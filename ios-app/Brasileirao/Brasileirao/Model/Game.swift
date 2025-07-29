import Foundation
import SwiftData

@Model
final class Game {
    @Attribute(.unique)
    var id: Int
    
    var homeGoals: Int?
    var awayGoals: Int?
    var gameDateTime: Date
    var stadium: String
    var isLive: Bool
    
    var filterGroup: FilterGroup?
    
    var homeTeam: Team?
    var awayTeam: Team?
    
    @Relationship(deleteRule: .cascade, inverse: \GameEvent.game)
    var events: [GameEvent] = []
    
    init(id: Int,
         homeTeam: Team,
         awayTeam: Team,
         homeGoals: Int? = nil,
         awayGoals: Int? = nil,
         gameDateTime: Date,
         stadium: String,
         isLive: Bool) {
        
        self.id = id
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.homeGoals = homeGoals
        self.awayGoals = awayGoals
        self.gameDateTime = gameDateTime
        self.stadium = stadium
        self.isLive = isLive
    }
}
