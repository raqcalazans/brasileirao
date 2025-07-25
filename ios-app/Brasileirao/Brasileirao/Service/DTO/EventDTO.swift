struct EventDTO: Codable, Identifiable {
    let id: Int
    let timeInGame: String
    let description: String
}
