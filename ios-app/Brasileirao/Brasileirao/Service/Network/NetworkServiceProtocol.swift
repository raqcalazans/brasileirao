import Foundation

protocol NetworkServiceProtocol {
    
    func fetchGames() async throws -> GameScreenDTO
}
