//
//  Item.swift
//  BrasileiraoApp
//
//  Created by Raquel Calazans on 22/07/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
