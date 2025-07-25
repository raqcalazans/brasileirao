import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    private let baseURL = "http://localhost:8080"
    private let decoder: JSONDecoder
    
    init() {
        self.decoder = JSONDecoder()
        self.decoder.dateDecodingStrategy = .iso8601
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetchGames() async throws -> GameScreenDTO {
        guard let url = URL(string: "\(baseURL)/games") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try decoder.decode(GameScreenDTO.self, from: data)
    }
}
