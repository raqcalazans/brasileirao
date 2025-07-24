import SwiftUI
import SwiftData

struct GameListView: View {
    
    // 1. Acessa o contexto do banco de dados injetado pelo BrasileiraoApp.swift
    @Environment(\.modelContext) var modelContext
    
    // 2. A fonte de dados da nossa UI.
    // Busca todos os jogos do banco SwiftData e os ordena pela data mais recente.
    // A UI irá se atualizar automaticamente sempre que estes dados mudarem.
    @Query(sort: \Game.gameDateTime, order: .reverse) private var games: [Game]
    
    // 3. O ViewModel que gerencia o estado da tela e a lógica de sincronização.
    @StateObject private var viewModel: GameListViewModel
    
    // 4. Inicializador customizado para injetar o modelContext no ViewModel.
    // Isso é essencial para que o ViewModel possa passar o contexto para o DataUpdater.
    init() {
        // O _viewModel é a forma de inicializar um @StateObject dentro de um init.
        _viewModel = StateObject(wrappedValue: GameListViewModel())
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                if games.isEmpty && !viewModel.isLoading {
                    ContentUnavailableView(
                        "Nenhum Jogo Encontrado",
                        systemImage: "soccer.ball.inverse",
                        description: Text("Toque no botão de atualizar para buscar os jogos mais recentes.")
                    )
                } else {
                    List {
                        Section(header: GameListHeader()) {
                            ForEach(games) { game in
                                // ZStack para sobrepor a linha com um NavigationLink invisível,
                                // permitindo que o clique seja na linha inteira.
                                ZStack {
                                    NavigationLink(destination: GameDetailView(game: game)) {
                                        EmptyView()
                                    }
                                    .opacity(0)
                                    
                                    GameRowView(game: game)
                                }
                            }
                            .listRowSeparator(.visible)
                            .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        await syncData()
                    }
                }
                
                if viewModel.isLoading {
                    ProgressView("Buscando jogos...")
                        .padding()
                        .background(Material.thin)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
            }
            .navigationTitle("JOGOS")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        Task {
                            await syncData()
                        }
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.primary)
                    }
                }
            }
            
            .task {
                if games.isEmpty {
                    await syncData()
                }
            }

            .alert("Erro de Rede", isPresented: .constant(viewModel.errorMessage != nil), actions: {
                Button("OK") { viewModel.errorMessage = nil }
            }, message: {
                Text(viewModel.errorMessage ?? "Ocorreu um erro desconhecido.")
            })

            .onAppear {
                viewModel.modelContext = modelContext
            }
        }
    }
    
    private func syncData() async {
        await viewModel.syncGames()
    }
}


struct GameListHeader: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "chevron.left")
            }
            Spacer()
            Text("PREVISTOS")
                .font(.headline)
            Spacer()
            Button(action: {}) {
                Image(systemName: "chevron.right")
            }
        }
        .foregroundColor(.primary)
        .padding(.vertical, 8)
        .listRowInsets(EdgeInsets()) // Remove o padding padrão da seção
    }
}

#Preview {

    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Game.self, configurations: config)
        
        return GameListView()
            .modelContainer(container)
    } catch {
        return Text("Falha ao criar o container do preview: \(error.localizedDescription)")
    }
}
