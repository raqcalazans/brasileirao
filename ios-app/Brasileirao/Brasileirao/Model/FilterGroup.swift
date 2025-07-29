import Foundation
import SwiftData

@Model
final class FilterGroup {
    @Attribute(.unique)
    var id: String

    var title: String
    var displayOrder: Int

    @Relationship(inverse: \Game.filterGroup)
    var games: [Game] = []

    init(title: String,
         displayOrder: Int) {
        
        self.id = title
        self.title = title
        self.displayOrder = displayOrder
    }
}
