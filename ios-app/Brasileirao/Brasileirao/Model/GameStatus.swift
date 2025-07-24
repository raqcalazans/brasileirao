import Foundation

// Usamos String e Codable para decodificar direto do JSON.
// CaseIterable permite iterar sobre os casos, útil para filtros no futuro.
enum GameStatus: String, Codable, CaseIterable {
    case finished = "FINALIZADO"
    case live = "AO_VIVO"
    case scheduled = "AGENDADO"
}
