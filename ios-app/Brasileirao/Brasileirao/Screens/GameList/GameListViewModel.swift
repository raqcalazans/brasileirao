import Foundation
import SwiftData

// @MainActor garante que as propriedades @Published, que afetam a UI,
// sejam sempre atualizadas na thread principal.
@MainActor
class GameListViewModel: ObservableObject {
    
    // MARK: - Published Properties
    // A View vai observar estas propriedades para atualizar a UI.
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    // MARK: - Properties
    
    // O ModelContext é a "ponte" para o banco de dados SwiftData.
    // Ele será injetado pela View.
    var modelContext: ModelContext?
    
    // MARK: - Public Methods
    
    /// Orquestra o processo completo de sincronização de dados.
    func syncGames() async {
        // Garante que o estado de carregamento seja resetado ao final da função,
        // não importa se houve sucesso ou erro.
        defer { isLoading = false }
        
        // 1. Inicia o processo: ativa o indicador de carregamento e limpa erros antigos.
        isLoading = true
        errorMessage = nil
        
        // 2. Guarda de segurança: verifica se o contexto do banco foi injetado pela View.
        guard let modelContext = modelContext else {
            errorMessage = "Erro interno: O contexto do banco de dados não está disponível."
            return
        }
        
        // 3. Executa a busca na rede e a atualização do banco dentro de um bloco try/catch.
        do {
            // Passo A: Busca os DTOs (Data Transfer Objects) da API.
            let gameDTOs = try await NetworkService.shared.fetchGames()
            
            // Passo B: Cria o DataUpdater com o contexto do banco.
            let updater = DataUpdater(modelContext: modelContext)
            
            // Passo C: Manda o updater salvar os dados no SwiftData.
            try updater.updateDatabase(with: gameDTOs)
            
        } catch {
            // Em caso de qualquer erro (rede ou banco), captura e prepara a mensagem para o alerta na UI.
            errorMessage = "Falha ao sincronizar os jogos: \(error.localizedDescription)"
        }
    }
}
