import Foundation
import SwiftData

class DataUpdater {
    
    private var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func updateDatabase(with gameDTOs: [GameDTO]) throws {
        for gameDTO in gameDTOs {
            let homeTeam = try findOrCreateTeam(from: gameDTO.homeTeam)
            let awayTeam = try findOrCreateTeam(from: gameDTO.awayTeam)
            
            let fetchDescriptor = FetchDescriptor<Game>(predicate: #Predicate { $0.id == gameDTO.id })
            
            if let existingGame = try modelContext.fetch(fetchDescriptor).first {
                existingGame.homeGoals = gameDTO.homeGoals
                existingGame.awayGoals = gameDTO.awayGoals
                existingGame.status = gameDTO.status
                // ... outras atualizações se necessário
            } else {
                let newGame = Game(
                    id: gameDTO.id,
                    homeTeam: homeTeam,
                    awayTeam: awayTeam,
                    homeGoals: gameDTO.homeGoals,
                    awayGoals: gameDTO.awayGoals,
                    gameDateTime: gameDTO.gameDateTime,
                    stadium: gameDTO.stadium,
                    status: gameDTO.status
                )
                modelContext.insert(newGame)
                
                for eventDTO in gameDTO.events {
                    let newEvent = GameEvent(
                        id: eventDTO.id,
                        timeInGame: eventDTO.timeInGame,
                        eventDescription: eventDTO.description
                    )
                    newEvent.game = newGame // Associa o evento ao jogo
                    modelContext.insert(newEvent)
                }
            }
        }
        
        try modelContext.save()
    }
    
    private func findOrCreateTeam(from teamDTO: TeamDTO) throws -> Team {
        let fetchDescriptor = FetchDescriptor<Team>(predicate: #Predicate { $0.id == teamDTO.id })
        
        if let existingTeam = try modelContext.fetch(fetchDescriptor).first {
            return existingTeam
        } else {
            let newTeam = Team(
                id: teamDTO.id,
                name: teamDTO.name,
                acronym: teamDTO.acronym,
                logoURL: teamDTO.logoURL,
                teamDescrition: teamDTO.description
            )
            modelContext.insert(newTeam)
            return newTeam
        }
    }
}
