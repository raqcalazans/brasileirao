import Foundation
import SwiftData

@Model
final class Team {
    @Attribute(.unique) // Garante que não haverá times com o mesmo ID
    var id: Int
    
    var name: String
    var acronym: String
    var logoURL: URL
    var teamDescription: String
    
    // Relacionamento inverso: informa ao SwiftData que um time pode ter jogos em casa e fora
    @Relationship(inverse: \Game.homeTeam)
    var homeGames: [Game]?
    
    @Relationship(inverse: \Game.awayTeam)
    var awayGames: [Game]?
    
    init(id: Int, name: String, acronym: String, logoURL: URL, teamDescrition: String) {
        self.id = id
        self.name = name
        self.acronym = acronym
        self.logoURL = logoURL
        self.teamDescription = teamDescrition
    }
}
