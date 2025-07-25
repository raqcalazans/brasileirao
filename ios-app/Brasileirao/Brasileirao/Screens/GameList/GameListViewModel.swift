import Foundation
import SwiftData

@MainActor
class GameListViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var groups: [GameGroupDTO] = []
    @Published var selectedGroupIndex: Int = 0
    
    var modelContext: ModelContext?
    
    var currentGroup: GameGroupDTO? {
        return groups.indices.contains(selectedGroupIndex) ? groups[selectedGroupIndex] : nil
    }
    
    func syncGames() async {
        defer { isLoading = false }
        
        isLoading = true
        errorMessage = nil

        guard let modelContext = modelContext else {
            errorMessage = "Erro interno: O contexto do banco de dados não está disponível."
            return
        }
        
        do {
            let screenDTO = try await NetworkService.shared.fetchGames()
            
            let updater = DataUpdater(modelContext: modelContext)
            try updater.updateDatabase(with: screenDTO)
            
            self.groups = screenDTO.groups
            
        } catch {
            print("ERRO DE REDE: \(error)")
            
            errorMessage = "Falha ao sincronizar os jogos: \(error.localizedDescription)"
        }
    }

    func selectNextGroup() {
        guard !groups.isEmpty else { return }
        selectedGroupIndex = (selectedGroupIndex + 1) % groups.count
    }

    func selectPreviousGroup() {
        guard !groups.isEmpty else { return }
        selectedGroupIndex = (selectedGroupIndex - 1 + groups.count) % groups.count
    }
}
