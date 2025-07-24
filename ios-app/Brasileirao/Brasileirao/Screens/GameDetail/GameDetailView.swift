import SwiftUI

struct GameDetailView: View {
    
    // A ViewModel é a fonte da verdade para esta tela.
    @StateObject private var viewModel: GameDetailViewModel
    
    init(game: Game) {
        // Inicializa o ViewModel com o jogo que foi passado da lista.
        _viewModel = StateObject(wrappedValue: GameDetailViewModel(game: game))
    }
    
    var body: some View {
        // Usamos List para um visual de "tabela de configurações", que funciona bem para detalhes.
        List {
            // Seção 1: O Cabeçalho, reutilizando a GameRowView
            Section {
                GameRowView(game: viewModel.game)
            }
            
            // Seção 2: Conteúdo Dinâmico
            if viewModel.hasEvents {
                // Caso 1: O jogo tem eventos (lance a lance)
                Section(header: Text("Lance a Lance")) {
                    ForEach(viewModel.game.events.sorted(by: { $0.timeInGame < $1.timeInGame })) { event in
                        GameEventRowView(event: event)
                            .listRowSeparator(.hidden) // Esconde o separador para a linha do tempo funcionar
                    }
                }
            } else {
                // Caso 2: O jogo não tem eventos (mostra descrição dos times)
                Section(header: Text("Sobre os Times")) {
                    // Usamos 'if let' para desempacotar os times com segurança
                    if let homeTeam = viewModel.game.homeTeam {
                        TeamDescriptionView(team: homeTeam)
                    }
                    if let awayTeam = viewModel.game.awayTeam {
                        TeamDescriptionView(team: awayTeam)
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Detalhes da Partida")
        .navigationBarTitleDisplayMode(.inline)
    }
}
