import SwiftUI
import SwiftData

@main
struct BrasileiraoApp: App {

    // Cria o container do SwiftData que gerenciará o banco de dados.
    // Ele precisa saber quais modelos (@Model) você vai usar.
    var modelContainer: ModelContainer = {
        let schema = Schema([
            Game.self,
            Team.self,
            Event.self
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()


    var body: some Scene {
        WindowGroup {
            GameListView() // Sua view principal
        }
        // O modificador .modelContainer injeta o banco de dados na hierarquia de views.
        // Todas as views filhas de GameListView() agora podem acessar o banco de dados
        // usando @Environment(\.modelContext) ou @Query.
        .modelContainer(modelContainer)
    }
}
