import SwiftUI
import SwiftData

@main
struct BrasileiraoApp: App {
    
    var modelContainer: ModelContainer = {
        let schema = Schema([
            Game.self,
            Team.self,
            GameEvent.self,
            FilterGroup.self
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
            GameListView()
        }
        .modelContainer(modelContainer)
    }
}
