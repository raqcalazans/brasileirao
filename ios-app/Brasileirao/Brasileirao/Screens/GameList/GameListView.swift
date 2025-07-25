import SwiftUI
import SwiftData

struct GameListView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @StateObject private var viewModel: GameListViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: GameListViewModel())
    }
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 0) {

                if viewModel.currentGroup != nil {
                    FilterHeaderView(
                        currentStatusTitle: viewModel.currentGroup!.title,
                        onPrevious: { viewModel.selectPreviousGroup() },
                        onNext: { viewModel.selectNextGroup() }
                    )
                    .padding(.horizontal)
                    .background(Color(.systemGray6))
                }

                ZStack {
                    if viewModel.isLoading && viewModel.groups.isEmpty {
                        ProgressView("Buscando jogos...")
                    } else if let group = viewModel.currentGroup, !group.games.isEmpty {
                        List(group.games, id: \.id) { gameDTO in
                            VStack(spacing: 0) {
                                ZStack {
                                    NavigationLink(destination: GameDetailContainerView(gameID: gameDTO.id)) {
                                        EmptyView()
                                    }
                                    .opacity(0)
                                    
                                    GameView(gameDTO: gameDTO, style: .row)
                                        .padding(.horizontal, 16)
                                }
                                
                                Divider()
                            }
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                        }
                        .listStyle(.plain)
                        .refreshable { await viewModel.syncGames() }
                    } else {
                        ContentUnavailableView(
                            "Nenhum Jogo Encontrado",
                            systemImage: "soccer.ball.inverse",
                            description: Text("Não há jogos com o status \(viewModel.currentGroup?.title ?? "").")
                        )
                    }
                    
                    if viewModel.isLoading && !viewModel.groups.isEmpty {
                        ProgressView()
                            .padding()
                            .background(Material.thin)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationTitle("JOGOS")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) { Image(systemName: "arrow.left").foregroundColor(.primary) }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { Task { await viewModel.syncGames() } }) {
                        Image(systemName: "arrow.clockwise").foregroundColor(.primary)
                    }
                }
            }
            
            .task {
                await viewModel.syncGames()
            }
            
            .onAppear {
                viewModel.modelContext = modelContext
            }

            .alert("Erro de Rede", isPresented: .constant(viewModel.errorMessage != nil), actions: {
                Button("OK") { viewModel.errorMessage = nil }
            }, message: {
                Text(viewModel.errorMessage ?? "Ocorreu um erro desconhecido.")
            })
        }
    }
}

struct FilterHeaderView: View {
    let currentStatusTitle: String
    let onPrevious: () -> Void
    let onNext: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onPrevious) {
                Image(systemName: "chevron.left")
            }
            Spacer()
            Text(currentStatusTitle)
                .font(.headline)
                .frame(minWidth: 120)
            Spacer()
            Button(action: onNext) {
                Image(systemName: "chevron.right")
            }
        }
        .foregroundColor(.primary)
        .padding(.vertical, 8)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Game.self, configurations: config)
        return GameListView().modelContainer(container)
    } catch {
        return Text("Falha ao criar o container do preview: \(error.localizedDescription)")
    }
}
