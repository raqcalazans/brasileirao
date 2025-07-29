import Foundation
import SwiftData

class DataUpdater {
    
    private var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func updateDatabase(with screenDTO: GameScreenDTO) throws {
        for group in screenDTO.groups {
            for gameDTO in group.games {
                let homeTeam = try findOrCreateTeam(from: gameDTO.homeTeam)
                let awayTeam = try findOrCreateTeam(from: gameDTO.awayTeam)
                
                let fetchDescriptor = FetchDescriptor<Game>(predicate: #Predicate { $0.id == gameDTO.id })
                
                if let existingGame = try modelContext.fetch(fetchDescriptor).first {
                    existingGame.homeGoals = gameDTO.homeGoals
                    existingGame.awayGoals = gameDTO.awayGoals
                } else {
                    let newGame = Game(
                        id: gameDTO.id,
                        homeTeam: homeTeam,
                        awayTeam: awayTeam,
                        homeGoals: gameDTO.homeGoals,
                        awayGoals: gameDTO.awayGoals,
                        gameDateTime: gameDTO.gameDateTime,
                        stadium: gameDTO.stadium,
                        isLive: gameDTO.isLive,
                    )
                    modelContext.insert(newGame)
                    
                    for eventDTO in gameDTO.events {
                        let newEvent = GameEvent(
                            id: eventDTO.id,
                            timeInGame: eventDTO.timeInGame,
                            eventDescription: eventDTO.description
                        )
                        newEvent.game = newGame 
                        modelContext.insert(newEvent)
                    }
                }
            }
        }
        
        try modelContext.save()
    }
    
    private func findOrCreateTeam(from teamDTO: TeamDTO) throws -> Team {
        let fetchDescriptor = FetchDescriptor<Team>(predicate: #Predicate { $0.id == teamDTO.id })
        
        if let existingTeam = try modelContext.fetch(fetchDescriptor).first {
            existingTeam.name = teamDTO.name
            existingTeam.acronym = teamDTO.acronym
            existingTeam.logoURL = teamDTO.logoURL
            existingTeam.teamDescription = teamDTO.description
            
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
